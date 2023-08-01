#!/bin/bash

install_rhel() {
  echo "Configuring system."

  # Configure git
  git config --global user.name "ultimate_hecker"
  git config --global user.email "86735991+ultimatehecker@users.noreply.github.com"

  # Autocomplete ignore case
  echo "bind 'set completion-ignore-case on'" >> ~/.bashrc

  # Configure dnf
  sudo sh -c "echo \"defaultyes=True\" >> /etc/dnf/dnf.conf"
  sudo sh -c "echo \"max_parallel_downloads=10\" >> /etc/dnf/dnf.conf"

  # Install shortcuts
  sudo cp -r ../shortcuts/* /usr/share/applications/

  # Install dnf packages
  echo "Installing dnf packages."
  sudo dnf update -y
  sudo dnf install akmod-nvidia alien audacity cargo dconf-editor deja-dup ffmpeg-free gcc gcc-c++ gimp gnome-extensions-app gnome-tweaks htop mpv ncdu neofetch nmap nvtop obs-studio unzip rust vlc steam yt-dlp -y

  # Multimedia codecs
  sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
  sudo dnf install lame\* --exclude=lame-devel -y
  sudo dnf group upgrade --with-optional Multimedia -y

  # Install flatpak
  echo "Installing flatpak."
  sudo dnf install -y flatpak
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

  # Install ONLYOFFICE
  echo "Installing ONLYOFFICE."
  sudo dnf install https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm
  sudo yum install epel-release
  sudo yum install onlyoffice-desktopeditors -y

  # Install Slack
  echo "Installing Slack."
  sudo dnf -y update
  wget -O slack.rpm https://downloads.slack-edge.com/releases/linux/4.29.149/prod/x64/slack-4.29.149-0.1.el8.x86_64.rpm
  sudo rpm -i slack.rpm

  # Install Discord
  echo "Installing Discord."
  wget -O discord.tar.gz "https://discord.com/api/download?platform=linux&format=tar.gz"
  tar -xf discord.tar.gz
  sudo mv Discord /opt/

  # Install GDLauncher
  echo "Installing GDLauncher."
  wget -O gdlauncher.rpm https://github.com/gorilla-devs/GDLauncher/releases/download/v1.1.30/GDLauncher-linux-setup.rpm
  sudo rpm -i gdlauncher.rpm

  # Install Minecraft
  echo "Installing Minecraft."
  wget -O minecraft.tar.gz https://launcher.mojang.com/download/Minecraft.tar.gz
  tar -xf minecraft.tar.gz
  sudo mv minecraft-launcher /opt/

  # Install Spotify
  echo "Installing Spotify."
  flatpak install flathub com.spotify.Client

  # Install IntelliJ IDEA Ultimate Edition
  echo "Installing IntelliJ IDEA Ultimate Edition."
  wget -O idea.tar.gz https://download.jetbrains.com/idea/ideaIU-2023.2.tar.gz
  tar -xf idea.tar.gz
  sudo mkdir /opt/idea/
  sudo chmod 777 /opt/idea/
  sudo mv idea-*/* /opt/idea/
  sudo ln -sf /opt/idea/bin/idea.sh /bin/intellijidea-ue

  # Install Java
  echo "Installing Java."
  sudo dnf install java-1.8.0-openjdk.x86_64
  sudo dnf install java-11-openjdk.x86_64
  sudo dnf install java-11-openjdk-devel.x86_64
  sudo dnf install java-17-openjdk-*
  echo "Use the following command to switch between Java versions: sudo alternatives --config java"

  # Install WPILib
  cd ~
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

  # Install CLion
  echo "Installing CLion."
  wget -O clion.tar.gz https://download.jetbrains.com/cpp/CLion-2023.2.tar.gz
  tar -xf clion.tar.gz
  sudo mkdir /opt/clion/
  sudo chmod 777 /opt/clion/
  sudo mv clion-*/* /opt/clion/
  sudo ln -sf /opt/clion/bin/clion.sh /bin/clion

  # Install Visual Studio Code
  echo "Installing Visual Studio Code."
  sudo dnf upgrade --refresh
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  printf "[vscode]\nname=packages.microsoft.com\nbaseurl=https://packages.microsoft.com/yumrepos/vscode/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscode.repo
  sudo dnf install code -y

  # Install Node.js
  echo "Installing Node.js."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  nvm install --lts
  nvm use --lts

  # Install ProtonVPN
  echo "Installing ProtonVPN."
  sudo dnf update
  sudo dnf install protonvpn
  sudo dnf install python3-pip
  pip3 install --user 'dnspython>=1.16.0'

  # Install Postman
  echo "Installing Postman."
  wget -O postman.tar.gz https://dl.pstmn.io/download/latest/linux_64
  tar -xf postman.tar.gz
  sudo mv Postman /opt/

  # Install Thunderbird
  echo "Installing Thunderbird."
  sudo dnf upgrade --refresh
  sudo dnf install thunderbird -y

  # Install Soundux
  echo "Installing Soundux."
  wget -O soundux.rpm https://github.com/Soundux/Soundux/releases/download/0.2.7/soundux-0.2.7-1.fc34.x86_64.rpm
  sudo rpm -i soundux.rpm

  # Install UltimakerCura
  echo "Installing UltimakerCura."
  wget -O ultimakercura.AppImage https://github.com/Ultimaker/Cura/releases/download/5.4.0/UltiMaker-Cura-5.4.0-linux-modern.AppImage
  sudo chmod u+x ultimakercura.AppImage
  sudo mkdir /opt/ultimakercura/
  sudo chmod 777 /opt/ultimakercura/
  sudo mv ultimakercura.AppImage /opt/ultimakercura/
  sudo mv ../img/ultimakercura.png /opt/ultimakercura/

  # GNOME Extensions
  echo "Installing GNOME Extensions."
  sudo dnf install gnome-shell-extension-appindicator gnome-shell-extension-caffeine gnome-shell-extension-dash-to-dock gnome-shell-extension-openweather -y
  echo "Install these GNOME Extensions:"
  echo "Alphabetical App Grid:    https://extensions.gnome.org/extension/4269/alphabetical-app-grid/"
  echo "Clipboard History:        https://extensions.gnome.org/extension/4839/clipboard-history/"
  echo "Extension List:           https://extensions.gnome.org/extension/3088/extension-list/"
  echo "Vitals:                   https://extensions.gnome.org/extension/1460/vitals/"

  read -rsp $'Press any key to continue...\n' -n 1 key

  # Reboot
  for i in {5..1}
  do
    echo -e "\e[41mWARNING: Rebooting in $i seconds! Press CTRL + C to cancel.\e[0m"
    sleep 1s
  done
  reboot
}