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
sudo apt-get install zsh vim tmux git tmuxinator curl
pip install virtualenv
echo -e "\033[31m configuring oh-my-zsh...\033[0m"
# 增加对文件夹的检测,如果存在文件夹,那么一定是有配置文件的存在
zsh_config="/home/$USER/.oh-my-zsh"
if [ -d ${zsh_config} ];then
	echo -e "\033[31m oh-my-zsh already existed.\033[0m"
else
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# install hacktools
echo -e "\033[31m install hacktools...\033[0m"
mkdir ~/HackTools
virtualenv -p python3 ~/HackTools/hackenv
git clone https://github.com/maurosoria/dirsearch.git ~/HackTools/Web/dirsearch
git clone https://github.com/lijiejie/subDomainsBrute.git ~/HackTools/Web/subdomainbrute

# set alias
echo "alias hackenv=\"source ~/HackTools/hackenv/bin/activate\"" >> ~/.zshrc
echo "alias dirsearch=\"python3 ~/HackTools/Web/dirsearch/dirsearch.py\"" >> ~/.zshrc
echo "alias subdomainbrute=\"python3 ~/HackTools/Web/subdomainbrute.py\"" >> ~/.zshrc
