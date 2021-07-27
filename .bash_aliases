alias ..='cd ..'
alias cdsem2='cd ~/Documents/sf/documents/studium/sem2'
alias i3cfg='vim ~/.config/i3/config'
alias texplate='cp ~/.templates/textemplate.tex temp.tex && cp ~/.templates/Makefile ./Makefile-latex'
alias dotfilecollect='~/.scripts/dotfilecollect && cd ~/gits/dotfiles && git status'
alias showclock='tty-clock -cC 3'
alias weatherrep='curl -s wttr.in/Bremen'
alias vi='vim --noplugin'
alias timestamp="date '+%Y-%m-%d %H:%M:%S'"
alias hdoff="sudo hdparm -Y /dev/sdb"
alias quicktex="~/.scripts/quicktex.sh"
alias log="~/.scripts/log"
alias anki-vim="~/.local/bin/anki-vim"
alias gitlab="chromium-browser --app=https://gitlab.informatik.uni-bremen.de"
alias grep_hl="grep --color=always -z" 
alias pi3get='wget -O /home/ztf/prak3/slides/slides-all.pdf "http://www.informatik.uni-bremen.de/~cxl/lehre/pi3.ws18/lectures/slides-all.pdf"'
alias mpv_music='mpv --geometry=200-12+10 --loop-playlist --volume=30'
alias mpv_img='mpv --image-display-duration=inf --geometry=1280'
alias transp_term="urxvt -depth 32 -bg rgba:3f00/3f00/3f00/0000"
alias setup-notes="~/.scripts/notes_setup"
alias isvpnup='curl -s https://www.privateinternetaccess.com |grep "You are protected" > /dev/null && echo -e "\e[32myes\e[28m" || echo -e "\e[31mno\e[28m"'
alias please='echo "of course :)"; sudo $(fc -ln -1)'
alias urxvtf='~/.scripts/urxvtf'
alias nnvim='/home/ztf/local/nvim/bin/nvim'
alias fn='nvim  -c ":cd /home/ztf/notes/mdwiki" -c ":Ag"'
alias zfa='nvim  -c ":cd /home/ztf/zettelkasten" -c ":Ag"'
alias zff='nvim  -c ":cd /home/ztf/zettelkasten" -c ":Files"'
alias emoji='cat ~/.unicode | fzf | cut -d" " -f1 | xclip -i -sel clipboard -r -f | xclip -i -sel primary -r -f && echo'
alias findvid='find . -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" \) | fzf'
alias ip='curl --silent ipinfo.io/ip'
alias pomodoro='termdown $((25 * 60)); read -p "press [return] when you are ready to take a 5 minute break"; termdown $((5 * 60))'
alias last_screenshot='find Pictures/screenshots/ -regextype sed -type f -regex ".*/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}_[0-9]\{6\}.*\.png" | sort -r | head -n1'
