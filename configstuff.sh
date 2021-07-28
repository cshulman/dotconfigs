#!/bin/bash

#bashrc & colors setup
cp ~/dotconfigs/.bashrc ~.bashrc
cp ~/dotconfigs/.bash_colors ~.bash_colors
cp ~/dotconfigs/.trapd00r_colors ~.trapd00r_colors

source ~.bashrc

echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf
cat /etc/dnf/dnf.conf

sudo dnf -y upgrade --refresh

sudo dnf update


#install rpm
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf -y install gnome-tweak-tool
sudo dnf -y install gnome-themes-extra 
sudo dnf -y install vim
sudo dnf -y install gimp
sudo dnf -y install unzip p7zip p7zip-plugins unrar
sudo dnf -y install fira-code-fonts 'mozilla-fira*' 'google-roboto*'
sudo dnf -y install ansible
sudo dnf -y install vlc

sudo dnf -y install tlp tlp-rdw
#thinkpad specific tlp
#install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo tlp-stat -b

#Flash Player install:
#dnf install http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
# install flash-plugin alsa-plugins-pulseaudio libcurl
