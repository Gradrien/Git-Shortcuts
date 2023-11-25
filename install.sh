#!/bin/bash

enscript_pkg='enscript'
zenity_pkg='zenity'

# Check for package managers
if command -v apt-get &> /dev/null; then
    PACKAGE_MANAGER="apt-get"
elif command -v yum &> /dev/null; then
    PACKAGE_MANAGER="yum"
elif command -v pacman &> /dev/null; then
    PACKAGE_MANAGER="pacman"
elif command -v dnf &> /dev/null; then
    PACKAGE_MANAGER="dnf"
elif command -v zypper &> /dev/null; then
    PACKAGE_MANAGER="zypper"
elif command -v brew &> /dev/null; then
    PACKAGE_MANAGER="brew"
elif command -v port &> /dev/null; then
    PACKAGE_MANAGER="port"
elif command -v emerge &> /dev/null; then
    PACKAGE_MANAGER="emerge"
elif command -v apk &> /dev/null; then
    PACKAGE_MANAGER="apk"
elif command -v pkg &> /dev/null; then
    PACKAGE_MANAGER="pkg"
elif command -v opkg &> /dev/null; then
    PACKAGE_MANAGER="opkg"
elif command -v slackpkg &> /dev/null; then
    PACKAGE_MANAGER="slackpkg"
elif command -v paru &> /dev/null; then
    PACKAGE_MANAGER="paru"
else
    echo "Error: Unsupported package manager. Please install the required package manually."
    exit 1
fi

# Install your package using the determined package manager
echo "Using $PACKAGE_MANAGER for package installation."

sleep 1
echo "Creating link with zsh"
sed -i '/export PATH=/ s/$/$HOME\/\Git-Shortcuts:/' ~/.zshrc
sleep 1
echo "Link created"
#Insatllation
sleep 1
echo -e "\033[32mInstalling manual entry\033[0m"
sudo cp githelp /usr/share/man/man1/gitsc.1
sudo gzip /usr/share/man/man1/gitsc.1
echo -e "\033[32mChecking your packages\033[0m"

sleep 1

# Check the different packages
install_package() {
    local pkg=$1
    if rpm -q "$pkg"; then
        echo "Package $pkg is already installed"
    else
        read -p "Do you want to install $pkg? [Yy] or [Nn] : " yn
        case $yn in
            [Yy]* )
                echo "Installing package: $pkg"
                sudo "$PACKAGE_MANAGER" install "$pkg"
                ;;
            *)
                echo "Package not installed"
                ;;
        esac
    fi
}

install_package "$enscript_pkg"
install_package "$zenity_pkg"
