#!/bin/bash

install_debian() {
  # Install apt packages
  echo "Installing apt packages..."
  sudo apt update
  sudo apt install apt-transport-https clang cmake curl ffmpeg g++ gcc gimp git htop libgtk-3-dev mlocate mpv ncdu neofetch net-tools ninja-build openjdk-17-* pkg-config python3 python3-pip software-properties-common steam switcheroo-control tmux tree unzip vim vlc wget zram-config -y

  # Install virtulization software
  echo "Installing virtualization software."
  sudo apt install bridge-utils libvirt-clients libvirt-daemon libvirt-daemon-system qemu qemu-kvm virt-manager virt-viewer virtinst -y

  # Install Visual Studio Code
  echo "Installing Visual Studio Code Components."
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
  sudo apt update
  sudo apt install code

  # Install IntelliJ IDEA
  echo "Installing IntelliJ IDEA."
  sudo add-apt-repository ppa:mmk2410/intellij-idea -y
  sudo apt update
  sudo apt install intellij-idea-ultimate -y

  # Install Docker
  echo "Installing Docker."
  sudo apt remove docker docker-engine docker.io containerd runc
  sudo apt update
  sudo apt install ca-certificates gnupg
  sudo mkdir -m 0755 -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update
  sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  sudo docker run hello-world

  # TARBALL - ~

  # Install WPILib
  echo "Installing WPILib for FRC development."
  cd ~
  wget -O WPILib.tar.gz https://github.com/wpilibsuite/allwpilib/releases/download/v2023.4.3/WPILib_Linux-2023.4.3.tar.gz
  tar -xvf WPILib.tar.gz
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

  # TARBALL - ~/Downloads

  # Install Android Studio
  echo "Installing Android Studio."
  cd ~/Downloads
  sudo apt install lib32z1 libbz2-1.0:i386 libc6:i386 libncurses5:i386 libstdc++6:i386
  wget -O android-studio.tar.gz https://dl.google.com/dl/android/studio/ide-zips/2021.1.1.5/android-studio-2021.1.1.5-linux.tar.gz
  tar -xvf android-studio.tar.gz
  cd android-studio/bin/
  ./studio.sh

  # Install flutter
  echo "Installing flutter."
  cd ~/Downloads
  wget -O flutter.tar.gz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.7.9-stable.tar.xz
  tar -xvf flutter.tar.gz
  cd flutter/bin/
  ./flutter
  ./dart
  flutter upgrade --force
  dart --disable-analytics
  flutter config --no-analytics
  flutter config --enable-linux-desktop
  flutter config --enable-macos-desktop
  flutter config --enable-windows-desktop

  # Install Postman
  echo "Installing Postman."
  cd ~/Downloads
  wget -O postman.tar.gz https://dl.pstmn.io/download/latest/linux64
  tar -xvf postman.tar.gz
  cd postman/
  ./Postman

  # DPKG
  cd ~/Downloads

  # Install Discord
  echo "Installing Discord."
  wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
  sudo dpkg --install discord.deb

  # Install GDLauncher
  echo "Installing GDLauncher."
  wget -O gdlauncher.deb https://github.com/gorilla-devs/GDLauncher/releases/download/v1.1.30/GDLauncher-linux-setup.deb
  sudo dpkg --install gdlauncher.deb

  # Install Minecraft
  echo "Installing Minecraft."
  wget -O minecraft.deb https://launcher.mojang.com/download/Minecraft.deb
  sudo dpkg --install minecraft.deb

  # Install Multiviewer for F1/F2/F3 Races
  echo "Installing Multiviewer."
  wget -O multiviewer.deb https://releases.multiviewer.app/download/99812509/multiviewer-for-f1_1.14.2_amd64.deb
  sudo dpkg --install multiviewer.deb

  # Install OBS
  echo "Installing OBS."
  wget -O obs.deb https://github.com/obsproject/obs-studio/releases/download/29.0.2/obs-studio_29.0.2-0obsproject1_jammy_amd64.deb
  sudo dpkg --install obs.deb

  # Install OnlyOffice
  echo "Installing OnlyOffice."
  wget -O onlyoffice.deb http://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
  sudo dpkg --install onlyoffice.deb

  # Install RPI Imager
  echo "Installing RPI Imager."
  wget -O rpi-imager.deb https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb
  sudo dpkg --install rpi-imager.deb

  # Install Slack
  echo "Installing Slack."
  wget -O slack.deb https://downloads.slack-edge.com/releases/linux/4.29.149/prod/x64/slack-desktop-4.29.149-amd64.deb
  sudo dpkg --install slack.deb

  # Install Soundux
  echo "Installing Soundux."
  wget -O soundux.deb https://github.com/Soundux/Soundux/releases/download/0.2.7/soundux-0.2.7.deb
  sudo dpkg --install soundux.deb

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
  sudo apt remove firefox -y
  sudo snap remove firefox
  sudo add-apt-repository ppa:mozillateam/ppa -y
  echo '
  Package: *
  Pin: release o=LP-PPA-mozillateam
  Pin-Priority: 1001
  ' | sudo tee /etc/apt/preferences.d/mozilla-firefox
  echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
  sudo apt update
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

  # Install Wine
  echo "Installing Wine."
  sudo dpkg --add-architecture i386
  sudo mkdir -pm755 /etc/apt/keyrings
  sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
  sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
  sudo apt install --install-recommends winehq-staging -y

  # Install Grapejuice
  echo "Installing Grapejuice."
  sudo dpkg --add-architecture i386
  curl https://gitlab.com/brinkervii/grapejuice/-/raw/master/ci_scripts/signing_keys/public_key.gpg | sudo tee /usr/share/keyrings/grapejuice-archive-keyring.gpg
  sudo tee /etc/apt/sources.list.d/grapejuice.list <<< 'deb [signed-by=/usr/share/keyrings/grapejuice-archive-keyring.gpg] https://brinkervii.gitlab.io/grapejuice/repositories/debian/ universal main'
  sudo apt update
  sudo apt install grapejuice -y

  # Install ProtonVPN
  echo "Installing ProtonVPN."
  sudo apt install openvpn dialog python3-pip python3-setuptools -y
  sudo pip3 install protonvpn-cli
  sudo protonvpn init
  sudo protonvpn c -f

  # Install preload (speeds up application startup)
  echo "Installing preload."
  sudo apt install preload -y

  # Reduce overheating
  echo "Reducing overheating prevention using TLP."
  sudo apt install tlp tlp-rdw -y
  sudo tlp start

  sudo apt install indicator-cpufreq -y

  # Configure tasks that need to be done manually
  for i in {60..1}
  do
  echo "Before system reboot make sure to update these:"
  echo "1. Remove language support from apt-update - sudo gedit /etc/apt/apt.conf.d/00aptitude and change: Acquire::Languages "none";"
  echo "2. Update GRUB load times - sudo gedit /etc/default/grub & and change: GRUB_TIMEOUT=2"
  echo "3. Update GRUB - sudo update-grub"
  done

  # Upgrade packages
  echo "Upgrading packages"
  sudo apt update && sudo apt upgrade -y && sudo apt autoclean -y && sudo apt clean -y && sudo apt autoremove -y
  sudo snap refresh

  # Reboot
  for i in {5..1}
  do
    echo -e "\e[41mWARNING: Rebooting in $i seconds! Press CTRL + C to cancel.\e[0m"
    sleep 1s
  done
  reboot
}