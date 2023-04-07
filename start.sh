#!/bin/bash

# Install apt packages
echo "Installing apt packages..."
sudo apt update
sudo apt install curl ffmpeg g++ gcc gimp git htop mlocate mpv ncdu neofetch net-tools python3 python3-pip steam tmux tree vim vlc wget apt-transport-https software-properties-common clang cmake libgtk-3-dev ninja-build pkg-config unzip -y

# Install virtulization software
echo "Installing virtualization software."
sudo apt install bridge-utils libvirt-clients libvirt-daemon libvirt-daemon-system qemu qemu-kvm virt-manager virt-viewer virtinst -y

# Install Visual Studio Code
echo "Installing Visual Studio Code Components."
sudo apt update
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
sudo apt install code

# Install IntelliJ IDEA
echo "Installing IntelliJ IDEA."
sudo add-apt-repository ppa:mmk2410/intellij-idea -y
sudo apt install intellij-idea-ultimate -y

# Install OpenJDK
echo "Installing OpenJDK."
sudo apt install openjdk-17-jdk openjdk-17-source openjdk-17-doc -y

# Install WPILib
echo "Installing WPILib for FRC development."
wget -O WPILib.tar.gz https://github.com/wpilibsuite/allwpilib/releases/download/v2023.4.3/WPILib_Linux-2023.4.3.tar.gz
tar -xf WPILib.tar.gz
cd WPILib/
./WPILibInstaller

# Intergrate WPILib with Pheonix Tuner X
echo "Intergrating WPILib with Pheonix Tuner X."
cd ~
wget -O PheonixTunerX.zip https://github.com/CrossTheRoadElec/Phoenix-Releases/releases/download/v5.30.4.2/CTRE_Phoenix_FRC_Linux_5.30.4.zip
unzip PheonixTunerX.zip
cd PheonixTunerX/
mv maven/ ~/WPILib/2023
mv vendordeps/ ~/WPILib/2023
cd ~

# Install Android Studio
echo "Installing Android Studio."
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

wget -O android-studio.tar.gz https://dl.google.com/dl/android/studio/ide-zips/2021.1.1.5/android-studio-2021.1.1.5-linux.tar.gz
tar -xf android-studio.tar.gz
cd android-studio/bin/
./studio.sh

# Install flutter
echo "Installing flutter."
wget -O flutter.tar.gz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.7.9-stable.tar.xz
tar -xf flutter.tar.gz
cd flutter/bin/
./flutter
./dart
flutter upgrade
dart --disable-analytics
flutter config --no-analytics
flutter config --enable-linux-desktop
flutter config --enable-macos-desktop
flutter config --enable-windows-desktop

# Install Postman
echo "Installing Postman."
wget -O postman.tar.gz https://dl.pstmn.io/download/latest/linux64
tar -xf postman.tar.gz
cd postman/
./Postman

# Install Node.js
echo "Installing Node.js."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts
nvm use --lts

# Configure git
echo "Configuring git."
git config --global user.name "ultimatehecker"
git config --global user.email "86735991+ultimatehecker@users.noreply.github.com"

# Install GNOME-TWEAKS
echo "Installing GNOME-TWEAKS."
sudo apt install gnome-tweaks -y

# Install firefox
echo "Installing firefox."
sudo snap remove firefox
sudo add-apt-repository ppa:mozillateam/ppa -y
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
sudo apt install firefox thunderbird -y

# Install Kdenlive
echo "Installing Kdenlive."
sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y
sudo apt update
sudo apt install kdenlive -y

# Install Spotify
echo "Installing Spotify."
wget -O- https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
$ sudo add-apt-repository "deb http://repository.spotify.com stable non-free" -y
sudo apt install spotify-client -y

# Install Discord
echo "Installing Discord."
cd Downloads/
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo dpkg --install discord.deb
cd ~

# Install Minecraft
cd Downloads/
wget -O minecraft.deb https://launcher.mojang.com/download/Minecraft.deb
sudo dpkg --install minecraft.deb
cd ~

# Install GDLauncher
echo "Installing GDLauncher."
cd Downloads/
wget -O gdlauncher.deb https://github.com/gorilla-devs/GDLauncher/releases/download/v1.1.30/GDLauncher-linux-setup.deb
sudo dpkg --install gdlauncher.deb
cd ~

# Install Wine
echo "Installing Wine."
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt install --install-recommends winehq-staging -y

# Install Grapejuice
echo "Installing Grapejuice."
cd Downloads/
sudo dpkg --add-architecture i386
curl https://gitlab.com/brinkervii/grapejuice/-/raw/master/ci_scripts/signing_keys/public_key.gpg | sudo tee /usr/share/keyrings/grapejuice-archive-keyring.gpg
sudo tee /etc/apt/sources.list.d/grapejuice.list <<< 'deb [signed-by=/usr/share/keyrings/grapejuice-archive-keyring.gpg] https://brinkervii.gitlab.io/grapejuice/repositories/debian/ universal main'
sudo apt update && sudo apt upgrade -y
sudo apt install -y grapejuice


# Install RPI Imager
echo "Installing RPI Imager."
cd Downloads/
wget -O rpi-imager.deb https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb
sudo dpkg --install rpi-imager.deb
cd ~

# Install OnlyOffice
echo "Installing OnlyOffice."
cd Downloads/
wget -O onlyoffice.deb http://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
sudo dpkg --install onlyoffice.deb
cd ~

# Install Soundux
echo "Installing Soundux."
cd Downloads/
wget -O soundux.deb https://github.com/Soundux/Soundux/releases/download/0.2.7/soundux-0.2.7.deb
sudo dpkg --install soundux.deb
cd ~

# Install OBS
echo "Installing OBS."
cd Downloads/
wget -O obs.deb https://github.com/obsproject/obs-studio/releases/download/29.0.2/obs-studio_29.0.2-0obsproject1_jammy_amd64.deb
sudo dpkg --install obs.deb
cd ~

# Install Multiviewer for F1/F2/F3 Races
echo "Installing Multiviewer."
cd Downloads/
wget -O multiviewer.deb https://releases.multiviewer.app/download/99812509/multiviewer-for-f1_1.14.2_amd64.deb
sudo dpkg --install multiviewer.deb
cd ~

# Install Slack
echo "Installing Slack."
cd Downloads/
wget -O slack.deb https://downloads.slack-edge.com/releases/linux/4.29.149/prod/x64/slack-desktop-4.29.149-amd64.deb
sudo dpkg --install slack.deb
cd ~

# Install ProtonVPN
echo "Installing ProtonVPN."
sudo apt install openvpn dialog python3-pip python3-setuptools -y
sudo pip3 install protonvpn-cli
sudo protonvpn init
sudo protonvpn c -f

# Upgrade packages
echo "Upgrading packages"
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sudo snap refresh
flutter upgrade

# Reboot
for i in {5..1}
do
echo -e "\e[41mWARNING: Rebooting in $i seconds! Press CTRL + C to cancel.\e[0m"
sleep 1s
done
reboot