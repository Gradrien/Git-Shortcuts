#!/bin/bash
echo "Creating link with zsh"
sed -i '/export PATH=/ s/$/$HOME\/\Git-Shortcuts:/' ~/.zshrc
sleep 1
echo "Link created"
#Insatllation
sleep 1
echo "Checking your packages"
sleep 1
pkg="zenity"
if rpm -q $pkg
then
  echo "Package installed"
else
  read -p "Do you want to install zenity ? [Yy] or [Nn] : " yn
  case $yn in
        [Yy]* ) read -p "Enter your commit message: ${NC}" msg
                sudo dnf install $pkg; break;;
        [Nn]* ) echo "Package not installed"; exit;;
        * ) echo "Package not installed"; exit;;
  esac
fi