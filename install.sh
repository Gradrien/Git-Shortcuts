#!/bin/bash
pdf_pkg='enscript'
gui_pkg='zenity'

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
if [ $OS = "Debian" ] || [ $OS = "Ubuntu" ] || [ $OS = "Linux Mint" ]
  PM='apt-get'
else if [ $OS = "Fedora" ] || [ $OS = "CentOS" ] || [ $OS = "RHEL" ]
  PM='dnf'
else if [ $OS = "Arch Linux" ]
  PM='pacman'
else
  echo "gitsc: Can't find a package manager"
  exit 1
fi

#Clone the project to home
git clone git@github.com:Gradrien/Git-Shortcuts.git $HOME/Git-Shortcuts
sleep 1
echo "Creating link with zsh"
sed -i '/export PATH=/ s/$/$HOME\/\Git-Shortcuts:/' ~/.zshrc
sleep 1
echo "Link created"
#Insatllation
sleep 1
echo "Installing manual entry"
sudo cp githelp /usr/share/man/man1/gitsc.1
sudo gzip /usr/share/man/man1/gitsc.1
echo "Checking your packages"
sleep 1

# Check the different packages
if rpm -q $pdf_pkg
then
  echo "Package installed"
else
  read -p "Do you want to install zenity ? [Yy] or [Nn] : " yn
  case $yn in
        [Yy]* ) echo "Installing package: $pdf_pkg";
                sudo $PM install $pdf_pkg; exit;;
        [Nn]* ) echo "Package not installed"; exit;;
        * ) echo "Package not installed"; exit;;
  esac
fi

if rpm -q $gui_pkg
then
  echo "Package installed"
else
  read -p "Do you want to install zenity ? [Yy] or [Nn] : " yn
  case $yn in
        [Yy]* ) echo "Installing package: $gui_pkg";
                sudo $PM install $gui_pkg; exit;;
        [Nn]* ) echo "Package not installed"; exit;;
        * ) echo "Package not installed"; exit;;
  esac
fi
