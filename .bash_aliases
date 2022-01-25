alias ..='cd ..'
alias showclock='tty-clock -cC 3'
alias timestamp="date '+%Y-%m-%d %H:%M:%S'"
alias today="date '+%Y-%m-%d'"
alias mpv_music='mpv --geometry=200-12+10 --loop-playlist --volume=30'
alias mpv_img='mpv --image-display-duration=inf --geometry=1280'
alias please='echo "of course :)"; sudo $(fc -ln -1)'
alias fn='nvim  -c ":cd /home/ztf/notes/mdwiki" -c ":Ag"'
alias findvid='find . -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" \) | fzf'
alias myip='curl --silent ipinfo.io/ip'
alias pomodoro='termdown $((25 * 60)); read -p "press [return] when you are ready to take a 5 minute break"; termdown $((5 * 60))'
alias last_screenshot='find ${HOME}/Pictures/screenshots/ -regextype sed -type f -regex ".*/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}_[0-9]\{6\}.*\.png" | sort -r | head -n1'
alias clera='clear'
alias claer='clear'
alias celar='clear'
