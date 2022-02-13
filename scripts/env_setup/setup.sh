echo "Configuring bash..."
cat ./config/bashrc >> ~/.bashrc
cat ./config/git_aliases >> ~/.bashrc

echo "Configuring vim"
./scripts/env_setup/vim.sh
cp ./config/vimrc ~/.vimrc

echo "TODOs: Don't forget these steps..."
echo "	- source ~/.bashrc"
echo "	- Run :PlugInstall from inside vim"
