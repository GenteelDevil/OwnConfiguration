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
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo -e "\033[31m configuring vim...\033[0m"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
