#!/bin/bash
echo "$USER,welcome to your new device!"
echo "configuring date..."
TZ='Asia/Shanghai'; export TZ
echo -e "\033[31m updating source.list...\033[0m"
today=$(date +%y-%m-%d)
update_time=$(echo $(ls -l --full-time /etc/apt/sources.list) | sed 's/.* [0-9][0-9]\([0-9]*-[0-9]*-[0-9]*\).*/\1/g')
if [ "$today" != "$update_time" ]
then
    sudo apt-get update
else
    echo -e "\033[31m source.list has been updated today.\033[0m"
fi
# 如果source.list的更新时间是今天,那么不更新它
echo -e "\033[31m installing required software...\033[0m"
# 增加对这些软件的存在检测,或许没有必要
sudo apt-get install zsh vim tmux git
echo -e "\033[31m configuring oh-my-zsh...\033[0m"
# 增加对文件夹的检测,如果存在文件夹,那么一定是有配置文件的存在
zsh_config="/home/$USER/.oh-my-zsh"
if [ -d ${zsh_config} ];then
	echo -e "\033[31m oh-my-zsh already existed.\033[0m"
else
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
# 检测vim-plug的存在
vim_plug="/home/$USER/.vim/autoload/plug.vim"
echo -e "\033[31m configuring vim-plug...\033[0m"
if [ -f ${vim_plug} ];then
	echo -e "\033[31m vim-plug already existed.\033[0m"
else
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# 对YCM进行编译
ycm_dir="/home/$USER/.vim/plugged/YouCompleteMe"
echo "building essentials downloading..."
sudo apt-get install build-essential cmake python3-dev
if [ -d ${ycm_dir} ];then
	echo -e "\033[31m YCM dir existed\033[0m"
	echo -e "\033[31m checking whether compiled...\033[0m"
	python3 ${ycm_dir}/install.py --clang-completer
else
	echo -e "\033[31m YCM dir does not exist\033[0m"
	echo -e "\033[31m Downloading YCM...\033[0m"
	git clone https://github.com/ycm-core/YouCompleteMe.git ${ycm_dir}
	echo -e "\033[31m compiling YCM...\033[0m"
	python3 ${ycm_dir}/install.py --all	
fi

# 对salaried颜色插件放置
mkdir ~/.vim/colors
cp ~/.vim/plugged/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim
