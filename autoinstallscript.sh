# initial update
    sudo apt-get update
# vim
    sudo apt-get install vim -y
# i3-wm
    sudo apt-get install i3 -y
    sudo apt-get install i3blocks -y
# lxappearance
    sudo apt-get install lxappearance -y
# keepassx
    sudo apt-get install keepassx -y
# zathura
    # you can set this to be the
    # default pdf program via thunar
    sudo apt-get install zathura -y
# gedit
    sudo apt-get install gedit -y
# qbittorrent
    sudo apt-get install qbittorrent -y
# seafile
    sudo add-apt-repository ppa:seafile/seafile-client
    sudo apt-get update
    sudo apt-get install seafile-gui -y
# pavucontrol
    sudo apt-get install pavucontrol -y
# htop
    sudo apt-get install htop -y
# thunar
    sudo apt-get install thunar -y
#ranger
    sudo apt-get install ranger -y
# streamlink
    sudo add-apt-repository ppa:nilarimogard/webupd8
    sudo apt update
    sudo apt install streamlink -y
# pia
    tar -xzf pia-v72-installer-linux.tar.gz
    ./pia-v72-installer-linux.sh
# tty-clock
    sudo apt-get install tty-clock -y
# arandr
    sudo apt-get install arandr -y
# mpv
    sudo apt-get install mpv -y
# feh
    sudo apt-get install feh -y
# chromium
    sudo apt-get install chromium-browser -y
# xclip
    sudo apt-get install xclip -y
# git
	# install
	sudo apt-get install git -y
	# setup
	ssh-keygen -t rsa -C "ja_he@uni-bremen.de" -b 4096
	xclip -sel clip < ~/.ssh/id_rsa.pub
	echo "Your key is in the clipboard, log in and paste it. "
	echo "make sure you close the browser afterwards, bud..."
	chromium-browser https://gitlab.informatik.uni-bremen.de/profile/keys
	git config --global user.email "ja_he@uni-bremen.de"
	git config --global user.name "Jan Hensel"
	# get dotfiles
	mkdir gits
	cd gits
	git clone git@gitlab.informatik.uni-bremen.de:ja_he/dotfiles.git
	cd
# wal
	# not sure if viable (maybe need for syncing?)
# pathogen.vim
    mkdir ~/.vim
    mkdir ~/.vim/bundle
    mkdir ~/.vim/autoload
    cd ~/gits
    git clone https://github.com/tpope/vim-pathogen.git
    cd
    cp ~/gits/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim
# latex-box.vim
    cd ~/.vim/bundle
    git clone git://github.com/LaTeX-Box-Team/LaTeX-Box.git
    cd
# tabular.vim
    cd ~/.vim/bundle
    git clone git://github.com/godlygeek/tabular.git
    cd
# vim-airline.vim
    cd ~/.vim/bundle
    git clone https://github.com/bling/vim-airline
    cd
# bullets.vim
    cd ~/.vim/bundle
    git clone https://github.com/dkarter/bullets.vim
    cd
# delimitmate.vim
    cd ~/.vim/bundle
    git clone https://github.com/raimondi/delimitmate
    cd
# vim-table-mode.vim 
    cd ~/.vim/bundle
    git clone https://github.com/dhruvasagar/vim-table-mode.git
	cd 
# 256_noir (vim colorscheme)
    cd ~/.vim/bundle
    git clone https://github.com/andreasvc/vim-256noir.git
	cd 
# i3-gaps 
    # dependencies 
        sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake
    # install 
        cd ~/gits
        git clone https://www.github.com/Airblader/i3 i3-gaps
        cd i3-gaps
        autoreconf --force --install
        rm -rf build/
        mkdir -p build && cd build/
        ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
        make
        sudo make install
# arc-theme
    sudo apt-get install arc-theme -y
# numix
    sudo add-apt-repository ppa:numix/ppa
    sudo apt-get update
    sudo apt-get install numix-icon-theme
# krita
    sudo add-apt-repository ppa:kritalime/ppa
    sudo apt-get update
    sudo apt-get install krita -y
# redshift
    sudo apt-get install redshift -y
# curl
    sudo apt-get install curl -y
# latexmk
    sudo apt-get install latexmk -y
# texlive
    sudo apt-get install texlive-full -y
# scrot
    sudo apt-get install scrot -y
# compton 
    sudo apt-get install compton -y
# xbacklight 
    sudo apt-get install xbacklight -y
# c / c++
    sudo apt install libstdc++-6-doc -y 
# quodlibet 
    sudo apt-get install quodlibet -y 
# rofi 
    sudo apt-get install rofi -y
# ibus 
    sudo apt-get install ibus -y 
    sudo apt-get install ibus-hangul -y 
    sudo apt-get install ibus-table-latex -y 
# xsel 
    sudo apt-get install xsel -y 
# festival 
    sudo apt-get install festival -y 
# weechat 
    sudo apt-get install weechat -y 
# neofetch 
    sudo apt-get install neofetch -y 
# TODO i3-gaps 
# wal 
    sudo apt-get install python3-pip -y 
    sudo pip3 install pywal 
# bluetooth
    sudo apt-get install bluez-tools -y 
# iosevka font 
    sudo add-apt-repository ppa:laurent-boulard/fonts
    sudo apt-get update 
    sudo apt-get install fonts-iosevka
# scientifica font 
    cd /etc/fonts/conf.d/
    sudo rm /etc/fonts/conf.d/10* && sudo rm -rf 70-no-bitmaps.conf && sudo ln -s ../conf.avail/
	sudo dpkg-reconfigure fontconfig
	cd ~/gits
	git clone https://github.com/nerdypepper/scientifica
	mkdir ~/.local/share/fonts
	ln -fs ~/gits/scientifica/regular/scientifica-11.bdf ~/.local/share/fonts/scientifica-11.bdf
	ln -fs ~/gits/scientifica/bold/scientificaBold-11.bdf ~/.local/share/fonts/scientificaBold-11.bdf
# sensors 
    sudo apt-get install lm-sensors -y
# pip
    sudo apt-get install python-pip -y 
# intellij
    sudo snap install intellij-idea-community --classic --edge 
# cava
    sudo apt-get install libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool -y 
	cd ~/gits/
	git clone https://github.com/karlstav/cava.git
	cd ~/gits/cava/
	./autogen.sh
	./configure.sh
	sudo make 
	sudo make install 
	cd
# cmake 
    sudo apt-get install cmake -y 
# anki 
    echo "opening chrome so you can DL the right version of anki"
    echo "make sure you close it when the DL is done"
    chromium-browser https://apps.ankiweb.net/ 
    tar xjf Download/anki-*.tar.bz2
    cd anki*
    sudo make install
    cd
