#!/bin/bash
enscript_pkg='enscript'
zenity_pkg='zenity'

# Find the current os
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    ...
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    ...
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi

# Select the package manager
if [ "$OS" = "Debian" ] || [ "$OS" = "Ubuntu" ] || [ "$OS" = "Linux Mint" ]; then
  PM='apt-get'
elif [ "$OS" = "Fedora" ] || [ "$OS" = "CentOS" ] || [ "$OS" = "RHEL" ]; then
  PM='dnf'
elif [ "$OS" = "Arch Linux" ]; then
  PM='pacman'
else
  echo "gitsc: Can't find a package manager"
  exit 1
fi

#Clone the project to home
if ! curl -fsSL https://github.com/Gradrien/Git-Shortcuts/archive/master.tar.gz | tar -xz --strip-components=1 -C $HOME/Git-Shortcuts; then
    echo "Failed to clone the Git-Shortcuts project"
    exit 1
fi
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
                sudo "$PM" install "$pkg"
                ;;
            *)
                echo "Package not installed"
                ;;
        esac
    fi
}

install_package "$enscript_pkg"
install_package "$zenity_pkg"
