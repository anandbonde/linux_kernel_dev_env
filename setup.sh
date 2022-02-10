echo "This script will set up your kernel development environment."
echo "Run the 'run.sh' script and get a coffee... (bash only)"

read -r -p "Continue? (enter y/N) " should_continue
[[ $should_continue != "y" ]] && [[ $should_continue != "Y" ]] && exit

echo "Installing pkgs..."
pkgs=(
	build-essential
	ccache
	cscope
	ctags
	distcc
	dwarves
	tmux
	vim
	zstd
)
sudo apt install -y ${pkgs[*]}

echo "Configuring git..."
cp ./config/git ~/.gitconfig

echo "Configuring bash..."
cat ./config/bashrc >> ~/.bashrc
cat ./config/git_aliases >> ~/.bashrc

echo "Configuring ccache"
cp ./config/ccache ~/.ccache

echo "TODOs: Don't forget these steps..."
echo "	- source ~/.bashrc"
echo "	- Update ~/.gitconfig"
echo "	- Run :PlugInstall from inside vim"
