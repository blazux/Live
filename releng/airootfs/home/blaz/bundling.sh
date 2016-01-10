#!/bin/bash

export PATH=/home/blaz/.gem/ruby/2.2.0/bin:$PATH

echo "BUILDAGE DE L'ENVIRONNEMENT POUR :"
echo $USER
cd /opt/metasploit-framework
gem install bundler

echo "CHECK DU PATH :"
echo $PATH

echo "RUBY ES TU LA ?"
ruby -v

#bundle install
