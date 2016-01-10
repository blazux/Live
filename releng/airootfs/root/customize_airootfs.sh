#!/bin/bash

echo "AU LANCEMENT LE USER EST :"
echo $HOME

set -e -u

#sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
sed -i 's/#\(fr_FR\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

export SHELL=/bin/bash

ln -sf /usr/share/zoneinfo/UTC /etc/localtime
#ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root
echo "root:root" | chpasswd

# Ajout d'un user
useradd -m -p "" -g users -G "adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel" -s /usr/bin/bash blaz

sed -i 's/#\(PermitRootLogin \)no/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

#test du startx
touch /root/.xinitrc
touch /home/blaz/.xinitrc
echo "exec startxfce4" >> /root/.xinitrc
echo "exec startxfce4" >> /home/blaz/.xinitrc

cd /opt
git clone https://github.com/rapid7/metasploit-framework.git

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default multi-user.target
systemctl enable wicd.service
systemctl enable postgresql.service 

#systemctl start postgresql.service

export PATH=/root/.gem/ruby/2.2.0/bin:$PATH

chown -R blaz:users /home/blaz
chown -R blaz:users /opt/metasploit-framework

gem install bundler
sudo -u blaz /home/blaz/bundling.sh

echo "CREATION DES LIENS SYMBOLIQUES POUR MSF :"
echo "moving to msf folder"
cd /opt/metasploit-framework
bash -c 'for MSF in $(ls msf*); do ln -s /opt/metasploit-framework/$MSF /usr/sbin/$MSF;done'

#echo "CONFIG USER POSTGRESQL :"
#sudo -u postgres createuser msf -P -S -R -D
#sudo -u postgres createdb -O msf test

echo "CREATION DU FICHIER DE CONFIG DATABASE.YML :"

echo "production:" >> /opt/metasploit-framework/config/database.yml
echo " adapter: postgresql" >> /opt/metasploit-framework/config/database.yml
echo " database: msf" >> /opt/metasploit-framework/config/database.yml
echo " username: msf" >> /opt/metasploit-framework/config/database.yml
echo " password: " >> /opt/metasploit-framework/config/database.yml
echo " host: 127.0.0.1" >> /opt/metasploit-framework/config/database.yml
echo " port: 5432" >> /opt/metasploit-framework/config/database.yml
echo " pool: 75" >> /opt/metasploit-framework/config/database.yml
echo " timeout: 5" >> /opt/metasploit-framework/config/database.yml


echo "Fin de la customisation root !!!"
