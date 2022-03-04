#!/bin/bash
set -e

echo "configuring bash..."
cat ../../config/bashrc >> ~/.bashrc
cat ../../config/git_aliases >> ~/.bashrc

echo "configuring vim"
sudo apt install curl vim -y
./vim.sh
cp ../../config/vimrc ~/.vimrc

echo "installing necessary pkgs"
sudo apt install openssh-server ansible sshpass -y

echo "TODOs: Don't forget these steps..."
echo "	- source ~/.bashrc"
echo "	- Run :PlugInstall from inside vim"
