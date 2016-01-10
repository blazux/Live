/*
 * MessagePack for Ruby
 *
 * Copyright (C) 2008-2013 Sadayuki Furuhashi
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

#include "compat.h"
#include "ruby.h"
#include "packer.h"
#include "packer_class.h"
#include "buffer_class.h"
#include "factory_class.h"

VALUE cMessagePack_Packer;

static ID s_to_msgpack;
static ID s_write;

//static VALUE s_packer_value;
//static msgpack_packer_t* s_packer;

#define PACKER(from, name) \
    msgpack_packer_t* name; \
    Data_Get_Struct(from, msgpack_packer_t, name); \
    if(name == NULL) { \
        rb_raise(rb_eArgError, "NULL found for " # name " when shouldn't be."); \
    }

static void Packer_free(msgpack_packer_t* pk)
{
    if(pk == NULL) {
        return;
    }
    msgpack_packer_ext_registry_destroy(&pk->ext_registry);
    msgpack_packer_destroy(pk);
    xfree(pk);
}

static void Packer_mark(msgpack_packer_t* pk)
{
    msgpack_packer_mark(pk);
    msgpack_packer_ext_registry_mark(&pk->ext_registry);
}

VALUE MessagePack_Packer_alloc(VALUE klass)
{
    msgpack_packer_t* pk = ALLOC_N(msgpack_packer_t, 1);
    msgpack_packer_init(pk);

    VALUE self = Data_Wrap_Struct(klass, Packer_mark, Packer_free, pk);

    msgpack_packer_set_to_msgpack_method(pk, s_to_msgpack, self);
    msgpack_packer_ext_registry_init(&pk->ext_registry);
    pk->buffer_ref = MessagePack_Buffer_wrap(PACKER_BUFFER_(pk), self);

    return self;
}

VALUE MessagePack_Packer_initialize(int argc, VALUE* argv, VALUE self)
{
    VALUE io = Qnil;
    VALUE options = Qnil;

    if(argc == 0 || (argc == 1 && argv[0] == Qnil)) {
        /* Qnil */

    } else if(argc == 1) {
        VALUE v = argv[0];
        if(rb_type(v) == T_HASH) {
            options = v;
        } else {
            io = v;
        }

    } else if(argc == 2) {
        io = argv[0];
        options = argv[1];
        if(rb_type(options) != T_HASH) {
            rb_raise(rb_eArgError, "expected Hash but found %s.", rb_obj_classname(options));
        }

    } else {
        rb_raise(rb_eArgError, "wrong number of arguments (%d for 0..2)", argc);
    }

    PACKER(self, pk);

    MessagePack_Buffer_set_options(PACKER_BUFFER_(pk), io, options);

    if(options != Qnil) {
        VALUE v;

        v = rb_hash_aref(options, ID2SYM(rb_intern("compatibility_mode")));
        msgpack_packer_set_compat(pk, RTEST(v));
    }

    return self;
}

static VALUE Packer_compatibility_mode_p(VALUE self)
{
    PACKER(self, pk);
    return pk->compatibility_mode ? Qtrue : Qfalse;
}

static VALUE Packer_buffer(VALUE self)
{
    PACKER(self, pk);
    return pk->buffer_ref;
}

static VALUE Packer_write(VALUE self, VALUE v)
{
    PACKER(self, pk);
    msgpack_packer_write_value(pk, v);
    return self;
}

static VALUE Packer_write_nil(VALUE self)
{
    PACKER(self, pk);
    msgpack_packer_write_nil(pk);
    return self;
}

static VALUE Packer_write_array_header(VALUE self, VALUE n)
{
    PACKER(self, pk);
    msgpack_packer_write_array_header(pk, NUM2UINT(n));
    return self;
}

static VALUE Packer_write_map_header(VALUE self, VALUE n)
{
    PACKER(self, pk);
    msgpack_packer_write_map_header(pk, NUM2UINT(n));
    return self;
}

static VALUE Packer_write_ext(VALUE self, VALUE type, VALUE data)
{
    PACKER(self, pk);
    int ext_type = rb_num2int(type);
    if(ext_type < -128 || ext_type > 127) {
        rb_raise(rb_eRangeError, "integer %d too big to convert to `signed char'", ext_type);
    }
    StringValue(data);
    msgpack_packer_write_ext(pk, ext_type, data);
    return self;
}

static VALUE Packer_flush(VALUE self)
{
    PACKER(self, pk);
    msgpack_buffer_flush(PACKER_BUFFER_(pk));
    return self;
}

static VALUE Packer_clear(VALUE self)
{
    PACKER(self, pk);
    msgpack_buffer_clear(PACKER_BUFFER_(pk));
    return Qnil;
}

static VALUE Packer_size(VALUE self)
{
    PACKER(self, pk);
    size_t size = msgpack_buffer_all_readable_size(PACKER_BUFFER_(pk));
    return SIZET2NUM(size);
}

static VALUE Packer_empty_p(VALUE self)
{
    PACKER(self, pk);
    if(msgpack_buffer_top_readable_size(PACKER_BUFFER_(pk)) == 0) {
        return Qtrue;
    } else {
        return Qfalse;
    }
}

static VALUE Packer_to_str(VALUE self)
{
    PACKER(self, pk);
    return msgpack_buffer_all_as_string(PACKER_BUFFER_(pk));
}

static VALUE Packer_to_a(VALUE self)
{
    PACKER(self, pk);
    return msgpack_buffer_all_as_string_array(PACKER_BUFFER_(pk));
}

static VALUE Packer_write_to(VALUE self, VALUE io)
{
    PACKER(self, pk);
    size_t sz = msgpack_buffer_flush_to_io(PACKER_BUFFER_(pk), io, s_write, true);
    return ULONG2NUM(sz);
}

//static VALUE Packer_append(VALUE self, VALUE string_or_buffer)
//{
//    PACKER(self, pk);
//
//    // TODO if string_or_buffer is a Buffer
//    VALUE string = string_or_buffer;
//
//    msgpack_buffer_append_string(PACKER_BUFFER_(pk), string);
//
//    return self;
//}

static VALUE Packer_registered_types_internal(VALUE self)
{
    PACKER(self, pk);
#ifdef HAVE_RB_HASH_DUP
    return rb_hash_dup(pk->ext_registry.hash);
#else
    return rb_funcall(pk->ext_registry.hash, rb_intern("dup"), 0);
#endif
}

static VALUE Packer_register_type(int argc, VALUE* argv, VALUE self)
{
    PACKER(self, pk);

    int ext_type;
    VALUE ext_class;
    VALUE proc;
    VALUE arg;

    switch (argc) {
    case 2:
        /* register_type(0x7f, Time) {|obj| block... } */
        rb_need_block();
#ifdef HAVE_RB_BLOCK_LAMBDA
        proc = rb_block_lambda();
#else
        /* MRI 1.8 */
        proc = rb_block_proc();
#endif
        arg = proc;
        break;
    case 3:
        /* register_type(0x7f, Time, :to_msgpack_ext) */
        arg = argv[2];
        proc = rb_funcall(arg, rb_intern("to_proc"), 0);
        break;
    default:
        rb_raise(rb_eArgError, "wrong number of arguments (%d for 2..3)", argc);
    }

    ext_type = rb_num2int(argv[0]);
    if(ext_type < -128 || ext_type > 127) {
        rb_raise(rb_eRangeError, "integer %d too big to convert to `signed char'", ext_type);
    }

    ext_class = argv[1];
    if(rb_type(ext_class) != T_CLASS) {
        rb_raise(rb_eArgError, "expected Class but found %s.", rb_obj_classname(ext_class));
    }

    msgpack_packer_ext_registry_put(&pk->ext_registry, ext_class, ext_type, proc, arg);

    return Qnil;
}

VALUE MessagePack_pack(int argc, VALUE* argv)
{
    VALUE v;

    if (argc < 0 || argc > 3) {
        rb_raise(rb_eArgError, "wrong number of arguments (%d for 1..3)", argc);
    }
    v = argv[0];

    VALUE self = MessagePack_Factory_packer(argc - 1, argv + 1, cMessagePack_DefaultFactory);
    PACKER(self, pk);

    msgpack_packer_write_value(pk, v);

    VALUE retval;
    if(msgpack_buffer_has_io(PACKER_BUFFER_(pk))) {
        msgpack_buffer_flush(PACKER_BUFFER_(pk));
        retval = Qnil;
    } else {
        retval = msgpack_buffer_all_as_string(PACKER_BUFFER_(pk));
    }

    msgpack_buffer_clear(PACKER_BUFFER_(pk)); /* to free rmem before GC */

#ifdef RB_GC_GUARD
    /* This prevents compilers from optimizing out the `self` variable
     * from stack. Otherwise GC free()s it. */
    RB_GC_GUARD(self);
#endif

    return retval;
}

static VALUE MessagePack_dump_module_method(int argc, VALUE* argv, VALUE mod)
{
    UNUSED(mod);
    return MessagePack_pack(argc, argv);
}

static VALUE MessagePack_pack_module_method(int argc, VALUE* argv, VALUE mod)
{
    UNUSED(mod);
    return MessagePack_pack(argc, argv);
}

void MessagePack_Packer_module_init(VALUE mMessagePack)
{
    s_to_msgpack = rb_intern("to_msgpack");
    s_write = rb_intern("write");

    msgpack_packer_static_init();
    msgpack_packer_ext_registry_static_init();

    cMessagePack_Packer = rb_define_class_under(mMessagePack, "Packer", rb_cObject);

    rb_define_alloc_func(cMessagePack_Packer, MessagePack_Packer_alloc);

    rb_define_method(cMessagePack_Packer, "initialize", MessagePack_Packer_initialize, -1);
    rb_define_method(cMessagePack_Packer, "compatibility_mode?", Packer_compatibility_mode_p, 0);
    rb_define_method(cMessagePack_Packer, "buffer", Packer_buffer, 0);
    rb_define_method(cMessagePack_Packer, "write", Packer_write, 1);
    rb_define_alias(cMessagePack_Packer, "pack", "write");
    rb_define_method(cMessagePack_Packer, "write_nil", Packer_write_nil, 0);
    rb_define_method(cMessagePack_Packer, "write_array_header", Packer_write_array_header, 1);
    rb_define_method(cMessagePack_Packer, "write_map_header", Packer_write_map_header, 1);
    rb_define_method(cMessagePack_Packer, "write_ext", Packer_write_ext, 2);
    rb_define_method(cMessagePack_Packer, "flush", Packer_flush, 0);

    /* delegation methods */
    rb_define_method(cMessagePack_Packer, "clear", Packer_clear, 0);
    rb_define_method(cMessagePack_Packer, "size", Packer_size, 0);
    rb_define_method(cMessagePack_Packer, "empty?", Packer_empty_p, 0);
    rb_define_method(cMessagePack_Packer, "write_to", Packer_write_to, 1);
    rb_define_method(cMessagePack_Packer, "to_str", Packer_to_str, 0);
    rb_define_alias(cMessagePack_Packer, "to_s", "to_str");
    rb_define_method(cMessagePack_Packer, "to_a", Packer_to_a, 0);
    //rb_define_method(cMessagePack_Packer, "append", Packer_append, 1);
    //rb_define_alias(cMessagePack_Packer, "<<", "append");

    rb_define_private_method(cMessagePack_Packer, "registered_types_internal", Packer_registered_types_internal, 0);
    rb_define_method(cMessagePack_Packer, "register_type", Packer_register_type, -1);

    //s_packer_value = MessagePack_Packer_alloc(cMessagePack_Packer);
    //rb_gc_register_address(&s_packer_value);
    //Data_Get_Struct(s_packer_value, msgpack_packer_t, s_packer);

    /* MessagePack.pack(x) */
    rb_define_module_function(mMessagePack, "pack", MessagePack_pack_module_method, -1);
    rb_define_module_function(mMessagePack, "dump", MessagePack_dump_module_method, -1);
}
