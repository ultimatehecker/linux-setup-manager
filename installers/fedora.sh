#!/bin/bash

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
sudo dnf install akmod-nvidia alien audacity cargo dconf-editor deja-dup ffmpeg-free gcc gcc-c++ gimp gnome-extensions-app gnome-tweaks htop java-17-openjdk-* mpv ncdu neofetch nmap nodejs nvtop obs-studio rust steam yt-dlp -y

# Multimedia codecs
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
sudo dnf install lame\* --exclude=lame-devel -y
sudo dnf group upgrade --with-optional Multimedia -y

# Install flatpak packages
echo "Installing flatpak packages."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Discord
echo "Installing Discord."
wget -O discord.tar.gz "https://discord.com/api/download?platform=linux&format=tar.gz"
tar -xf discord.tar.gz
sudo mv Discord /opt/
sudo ln -s /opt/Discord/Discord /usr/bin/Discord
sudo cp ../shortcuts/discord.desktop /usr/share/applications/


# GNOME Extensions
sudo dnf install gnome-shell-extension-appindicator gnome-shell-extension-caffeine gnome-shell-extension-dash-to-dock gnome-shell-extension-openweather -y
echo "Install these GNOME Extensions:"
echo "Alphabetical App Grid:    https://extensions.gnome.org/extension/4269/alphabetical-app-grid/"
echo "Clipboard History:        https://extensions.gnome.org/extension/4839/clipboard-history/"
echo "Extension List:           https://extensions.gnome.org/extension/3088/extension-list/"
echo "Vitals:                   https://extensions.gnome.org/extension/1460/vitals/"

# Non-automated installs
echo "Manually install these programs:"
echo "Bitwarden:    https://bitwarden.com/download/"
echo "Discord:      https://discord.com"
echo "IntelliJ:     https://www.jetbrains.com/idea/download/?section=linux"
echo "Minecraft:    https://www.minecraft.net/en-us/download"
echo "Postman:      https://www.postman.com/downloads/"
echo "ProtonVPN:    https://protonvpn.com/support/official-linux-vpn-fedora/"
echo "VS Code:      https://code.visualstudio.com/Download"

read -rsp $'Press any key to continue...\n' -n 1 key

# Reboot
for i in {5..1}
do
  echo -e "\e[41mWARNING: Rebooting in $i seconds! Press CTRL + C to cancel.\e[0m"
  sleep 1s
done
reboot

