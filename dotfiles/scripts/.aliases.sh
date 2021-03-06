#!/usr/bin/env bash
# https://github.com/borestad/dotjitsu/edit/master/.aliases
# ---------------------------------------------------------
# Globals & system overrids
# ---------------------------------------------------------
#alias ncdu="ncdu -x -1bre"
alias ..="cd .."
alias ...='cd ../../'
alias ag='ag --stats'
alias b='brew'
alias bif='brew info'
alias cat='bat'
alias cgrep="grep --color=always"
alias code='/usr/local/bin/code -n'
alias cp='gcp -v'
alias crontab='VISUAL=nano EDITOR=nano crontab'
alias ctp="bat package.json"
#alias git=hub
alias h="history | fzf --reverse"
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias killall="killall -v"
alias mkdir='gmkdir -pv'
alias mtr='sudo /usr/local/bin/grc -es --colour=auto mtr'
alias mv='gmv -v'
#alias ncdu="timeout 3600s /usr/local/bin/ncdu"
alias ncdu2="/usr/local/bin/ncdu"
alias nx='PATH=$(npm bin):$PATH'
alias path='echo -e ${PATH//:/\\n}'
alias pgrep='pgrep -fli'
alias python=/usr/local/bin/python3.7
# alias retroarch="/Applications/RetroArch.app/Contents/MacOS/RetroArch"
alias rm='grm -v'
alias rmf='grm -rfv'
alias serve='ws -f stats -d '
alias smartgit='/Applications/SmartGit.app/Contents/MacOS/SmartGit'
alias sqlite='sqlite3'
alias vnstat='/usr/local/bin/vnstat -i en0'
alias watchos="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator\ \(Watch\).app"
alias wget='wget --no-check-certificate --no-verbose --compression auto'
alias ws='ws -d'
cs () { cat "$@" | jase scripts 2>/dev/null | bat }

#
# fasd
#
alias a='fasd -a'        # any
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias s='fasd -si'       # show / search / select
#alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

#
# Apps
#
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"

wh () { which -a "$@" | ctt2 }

function clone {
  url=$1;
  reponame=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//');
  git clone $url $reponame;
  cd $reponame;
  echo "" && hub log --oneline --graph --date=short -n 5 && echo ""
}

alias fetch='git fetch --verbose && echo "" && hub log --oneline --graph --date=short -n 1 && echo ""'


# Compare original and gzipped file size
function gz() {
  local origsize=$(wc -c < "$1");
  local gzipsize=$(gzip -c "$1" | wc -c);
  local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
  printf "orig: %d bytes\n" "$origsize";
  printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
  tree -aC -I '.git|node_modules|bower_components|.tmp|tmp|dist' --dirsfirst "$@" | less -FRNX;
}

function gthumbnails() {
  local sec=${1:-1} # Default 1 sec
  for file in *.mp4; do
    #ffmpeg -y -i "$file" -f image2 -ss $sec -vframes 1 -an "${file%.mp4}.jpg";
    ffmpeg -ss 1 -i "$file" -vframes 1 -vcodec png -an -y "${file%.mp4}.png"
  done
}
# ---------------------------------------------------------
# GOTO aliases
# ---------------------------------------------------------
alias -- -="cd -"
alias dl="cd $HOME/Downloads"
alias dt="cd $HOME/Desktop"
alias c="cd $HOME/code"
alias ne="cd $HOME/netent"

alias gd="git diff -- :!package-lock.json :!yarn.lock"
append() { grep -q -F $1 $2 || echo $1 >> $2 }

alias exa='exa --group-directories-first'
alias ls='gls --color --group-directories-first'
alias l='ls -A'          # Lists in multi column, hidden files.
#alias ll='ls -lAh'       # Lists in one column, hidden files.
alias ll='exa -lah'       # Lists in one column, hidden files.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias lx='ll -XB'        # Lists sorted by extension (GNU only).
alias lk='ll -Sr'        # Lists sorted by size, largest last.
alias lt='ll -tr'        # Lists sorted by date, most recent last.
alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.
alias sl='ls'            # I often screw this up.

# ---------------------------------------------------------
# Gnu utils (to enforce presedence)
# ---------------------------------------------------------
alias xargs='/usr/local/bin/gxargs'
alias find='/usr/local/bin/gfind'
alias locate='/usr/local/bin/glocate'
alias updatedb='/usr/local/bin/gupdatedb'



# ---------------------------------------------------------
# Find
# ---------------------------------------------------------
ff () {
  IFS=""
  local result=`fd $1`
  echo -e $result
  echo -e $result | wc -l
}

alias fff='ag -G "\.(js?x|ts?x|json)$" '
alias fic='find $( pwd )  -follow  -name "*.c" -o -name "*.cc" -o -name "*.cpp"  | xargs grep --color  -e '
alias fih='find $( pwd )  -follow -name "*.h" | xargs grep --color -e '
alias fis='find $( pwd )  -follow  -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.h"  | xargs grep --color  -e '
alias fif='find $( pwd ) -follow -ty
pe f -not -name "*~" -not -name "*swp" | xargs grep --color -e '
alias fip='find $( pwd )  -follow  -name "*.ts"  | xargs grep --color  -e '
alias qff='find $( pwd ) -follow 2>/dev/null -name '
alias qfic='find $( pwd )  -follow  -name "*.c" -o -name "*.cc" -o -name "*.cpp" 2>/dev/null | xargs grep --color  -e '
alias qfih='find $( pwd )  -follow -name "*.h" 2>/dev/null | xargs grep --color -e '
alias qfis='find $( pwd )  -follow  -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.h" 2>/dev/null | xargs grep --color  -e '
alias qfif='find $( pwd ) -follow -type f  2>/dev/null| xargs grep --color -e '
alias qfip='find $( pwd )  -follow  -name "*.py" 2>/dev/null | xargs grep --color  -e '
# ---------------------------------------------------------
# Others
# ---------------------------------------------------------
alias spotlight.access='sudo fs_usage -w -f filesys -e Terminal tee | tee fs_usage.log'
alias spotlight.rebuild='sudo mdutil -E /'

# ---------------------------------------------------------
# Boilerplate shortcuts
# ---------------------------------------------------------

# Create directory and immediately move into that dir
mk ()  { mkdir -p "$@" && cd "$_"; }
mkt () { hr -; cd $(mktemp -d -p $HOME/tmp); pwd; echo; }
mktc () { cd $(mktemp -d) && pwd && hr - && clone $1 }

# Opens file in EDITOR.
edit () {
  local dir=$1
  [[ -z "$dir" ]] && dir='.'
  $EDITOR $dir
}


alias e='edit'
alias zr='echo "Reloading zsh..."; rm -fv ~/.zcompdump*; reset; exec $SHELL -l;'
alias reload='zr'
alias reloadshell='zr'


brew.info () {
 #grep desc $(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/*.rb  | perl -ne 'm{^.*/(.*?)\.rb.*?\"(.*)"$} and print "$1|$2\n"' | column -t -s '|' | fzf --reverse
}

if (( $+commands[http] )); then
  alias GET='http GET'
  # alias HEAD='http -I'
  # alias POST='http POST'
  # alias PUT='http PUT'
  # alias PATCH='http PATCH'
  # alias DELETE='http DELETE'
  # alias OPTIONS='http OPTIONS'
fi



# ---------------------------------------------------------
# Cli Tricks
# ---------------------------------------------------------
alias history.stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

die () {
    [[ -n "$1" ]] && echo "$1"
    [[ -n "$2" ]] && exit $2 || exit 1
}


# ---------------------------------------------------------
# OSX tricks
# ---------------------------------------------------------

# Open curr dir in preview.app.
osx.openPreview () {
  local item=$1
  [[ -z "$item" ]] && item='.'
  open $1 -a 'Preview'
}

# Show current Finder directory in terminal
osx.finderDir () {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

# Lock current session and proceed to the login screen.
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# ---------------------------------------------------------
# SSH
# ---------------------------------------------------------
ssh.addkey () {
  # ssh $1 "tee -a ~/.ssh/authorized_keys" < ~/.ssh/id_?sa.pub
  ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" < ~/.ssh/id_?sa.pub  # '?sa' is a glob, not a typo!
  echo "sshkey done."
}

alias ssh.pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias ssh.keygen='ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa; ssh.pubkey'
alias pubkey="ssh.pubkey"
alias addkey="ssh.addkey"



# ---------------------------------------------------------
# GIT
# ---------------------------------------------------------
# Checkout git branches
git.co () {
  local branches branch
  local date=$(date '+%Y-%m-%d %H:%M:%S')
  local branches=$(git branch -a)
  echo $date
  branch=$(echo "$branches" | fzf +m -x -e --height=30 --reverse) &&
  ~/.repos/git-friendly/stash && ~/.repos/git-friendly/branch $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::") && pull
}

alias co='git.co'

#alias ghc='cd $(ghq list --full-path | fzf)'
#alias ghf='find $(git rev-parse --show-cdup) -type f | grep -v "/.git/" | fzf'
#alias gho='(cd $(ghq list --full-path | fzf) && git browse)'


# ---------------------------------------------------------
# CD
# ---------------------------------------------------------
# cd to the default working directory set by current_working_project
chdir.default () {
  export wdir=`cat $HOME/.tmp/current_project_path`
  echo "Change current working project to $wdir"
  cd $wdir
}

chdir.set () {
  cwd=pwd > $HOME/.tmp/current_project_path
  echo "Set current working project to `$cwd`"
}

chdir.rm () {
  echo "Remove current working project: `cat $HOME/.tmp/current_project_path`"
  '~' >> $HOME/.tmp/current_project_path
}

# ---------------------------------------------------------
# System stuff
# ---------------------------------------------------------

# Load 8 cores at once.
system.maxcpu () {
  dn=/dev/null
  yes > $dn & yes > $dn & yes > $dn & yes > $dn &
  yes > $dn & yes > $dn & yes > $dn & yes > $dn &
}

ps.kill () { kill -9 `ps ax | grep $1 | grep -v grep | awk '{print $1}'` }

# ---------------------------------------------------------
# Lists (with fzf magic)
# ---------------------------------------------------------
# List of available VM's - with fbr magic
vm.vbox () {
  vm=$(VBoxManage list vms | fzf +s +m -e --reverse) &&
  uuid=$(echo "$vm" | ack --cc '{([a-z0-9\-]+)}' --output '$1') &&
  VBoxManage startvm $uuid
}

vm.fusion () {
  vm=`vmrun list | fzf +s +m -e --reverse` &&
  echo $vm
  #uuid=`echo "$vm" | ack --cc '{([a-z0-9\-]+)}' --output '$1'` &&
  #VBoxManage startvm $uuid
}



# ---------------------------------------------------------
# File related stuff
# ---------------------------------------------------------
file.size () { wc -c < $1 }
# Monitor IO in real-time (open files etc).
files.open () { sudo dtrace -n 'syscall::open*:entry { printf("%s %s",execname,copyinstr(arg0)); }' }
# Files used, anywhere on the filesystem
alias files.usage='sudo fs_usage -e -f filesystem|grep -v CACHE_HIT|grep -v grep'
# Files being opened (OSX Only)
alias files.open='sudo fs_usage -e -f filesystem|grep -v CACHE_HIT|grep -v grep|grep open'
# Files in use in the Users directory
alias files.usage.user='sudo fs_usage -e -f filesystem|grep -v CACHE_HIT|grep -v grep|grep Users'

files.last_modified_directory() { echo `\ls -t | head -n 1` }

ddd() {
  local cmd="dd if='"$1"' | pv | sudo dd of=/dev/rdisk"$2" bs=1m"
  echo $cmd
  sudo sh -c "$cmd"
}

# ---------------------------------------------------------
# Network stuff
# ---------------------------------------------------------
function ip.internal { ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' }
alias ip.public='dig +short myip.opendns.com @resolver1.opendns.com'
alias ip='ip.internal; ip.public'
alias net.connections='lsof -l -i +L -R -V'
alias net.established='lsof -l -i +L -R -V | grep ESTABLISHED'
alias net.available_ip="ping -t 1 255.255.255.255 > /dev/null; arp -a"
alias net.sockets_numerical='netstat -tulpn'
alias net.sockets_services='netstat -tulp'
alias net.sniff0="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias net.sniff1="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias net.sniff4="sudo ngrep -d 'en4' -t '^(GET|POST) ' 'tcp and port 80'"
alias net.flushdns='dscacheutil -flushcache'
alias flushdns='net.flushdns'

# ---------------------------------------------------------
# Compression
# ---------------------------------------------------------

z1 () {
  local input=$1; local output=${2:-$1}.tar.gz
  echo "Compressiong $input into $output"
  #tar cf - $input | pv -s $(du -sk $input | awk '{print $input*1024}') | pigz -c -9 > $output
  tar cf - $input | pigz -c -9 > $output
}

z2 () {
  local input=$1; local output=${2:-$1}.tar.lz
  tar cf - $input | pv -s $(du -sk $input | awk '{print $input*1024}') | plzip -c -9 > $output
}

z3 () {
  local input=$1; local output=${2:-$1}.tar.bz2
  tar cf - $input | pv -s $(du -sk $input | awk '{print $input*1024}') | pbzip2 -c -9 > $output
}

xtract () {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.lzma)      unlzma $1      ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x -ad $1 ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.xz)        unxz $1        ;;
          *.exe)       cabextract $1  ;;
          *)           echo "extract: '$1' - cannot be extracted via extract()" ;;
        esac
        #cd $1* && open .
    else
        echo "$1 - file does not exist"
    fi
fi
}


# ---------------------------------------------------------
# Useful file size aliases
# ---------------------------------------------------------

randfile () {
  local size=$1
  time openssl rand $size | head -c $size > $size.bin
}

# 1500 -> 1.500
to_kb () { echo $(bc <<< "scale=3; $1/1000") }

# 10000 -> 10,000
format_number () { printf "%'.3f\n" $1 }

# ./some_file.txt -> 11496328
size_in_bytes () { stat -f %z "$1" }

# ./some_file.txt -> 11,496.328 KB
echo_size () { echo $(format_number $(to_kb $(size_in_bytes "$1")))"kB" }


# ---------------------------------------------------------
# TMUX
# ---------------------------------------------------------
ta_function() { tmux attach -t $1 }
tk_function() { tmux kill-session -t $1 }
alias t='tmux'
alias 'tmux-new'='tmux new-session -A -s $(basename $PWD | tr -d .)'
alias 'tmux-ls'='tmux ls'
alias 'tmux-attach'=ta_function
alias 'tmux-at'=ta_function
alias 'tmux-kill'=tk_function

# ---------------------------------------------------------
# FZF
# ---------------------------------------------------------

# Fuzzy match against history, edit selected value
fhist() {
  print -z $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | \
    tail -2000 | \
    fzf --tac --reverse --no-sort | \
    sed 's/ *[0-9]* *//')
}

#bindkey -s '^r' 'fhist\n'

# Copied from https://github.com/junegunn/dotfiles/blob/master/bashrc

# fd - cd to selected directory
# fd() {
#   DIR=`find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf-tmux` \
#     && cd "$DIR"
# }

# fkill - kill process
fkill() {
  ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf-tmux --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  out=$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# Switch tmux-sessions
ft() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf-tmux --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}


# ---------------------------------------------------------
# GHQ (Git util)
# ---------------------------------------------------------
ghq () {
  # https://fotoallerlei.com/post/2019-09-29-ghq/#change-the-ghq-root-directory
  if [ "$1" = look -a -n "$2" ]; then
    local repos=($(command ghq list -p "$2"))
    echo "repos: $repos"
    case ${#repos[@]} in
      0)
        echo 'No repo found.'
        return 1
        ;;
      1)
        cd "${repos[0]}"
        return
        ;;
      *)
        local PS3="Select repo: "
        select reponame in ${repos[@]}; do
          cd "${reponame}"
          return
        done
    esac
  elif [ "$1" = get -a -n "$2" ]; then
    command ghq "$@"
    cd $(command ghq list -e -p "$2")
    return
  fi
  command ghq "$@"
}

alias gsa='git submodule add'


# ---------------------------------------------------------
# WGET
# ---------------------------------------------------------
crwl() {
  wget --tries=inf --timestamping --recursive --level=inf --convert-links --page-requisites --no-parent --reject-regex '\?C=' "$@"
}


alias mrsort="gawk -v RS=\"\" '{ gsub(\"\n\", \"###\"); print }' .mrconfig | sort -f | gawk -v ORS=\"\n\n\" '{ gsub(\"###\", \"\n\"); print }' > .mrconfig.tmp && mv .mrconfig.tmp .mrconfig"
