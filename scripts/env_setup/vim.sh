echo "Tuning vim settings"
echo "---"

setup_vimplug() {
	mkdir -p ~/.vim/pack/my-plugins/start
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

backup_existing_vim_settings() {
	cp ~/.vimrc ~/.vimrc.bkp
}

copy_vim_settings() {
	CONFIG_DIR="../../config/common"
	cat ./${CONFIG_DIR}/vimrc >> ~/.vimrc
}

show_plugin_update_msg() {
	red=`tput setaf 1`
	revert=`tput sgr0`
	echo "${red}Don't forget to run the :PlugUpdate command in vim${revert}"
}

setup_vimplug
backup_existing_vim_settings
copy_vim_settings
show_plugin_update_msg
