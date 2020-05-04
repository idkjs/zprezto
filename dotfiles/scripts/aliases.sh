# Custom aliases
# source ./git.sh
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
# ---------------------------------------------------------
# Find
# ---------------------------------------------------------
ff () {
  IFS=""
  local result=`fd $1`
  echo -e $result
  echo -e $result | wc -l
}

# ---------------------------------------------------------
# changing directories
# ---------------------------------------------------------
alias ..="cd .."
alias ...='cd ../../'

alias bif='brew info'
alias cat='bat'
# open ~/dotfiles in vscode
alias od="code ~/dotfiles"
alias readme="cat ${HOME}/.zprezto/runcoms/README.md"
alias ncdu2="/usr/local/bin/ncdu"
alias nx='PATH=$(npm bin):$PATH'
alias path='echo -e ${PATH//:/\\n}'
# https://gist.github.com/zanshin/1142739
alias 'bk=cd $OLDPWD'
alias zshrc="code ${HOME}/.zshrc"
alias zprofile="code ~/.zprofile"
alias zzshrc="code ${ZDOTDIR:-$HOME}/.zshrc"
alias chmodx="chmod +x $1"
# ---------------------------------------------------------
# Cli Tricks
# ---------------------------------------------------------
alias history.stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

# deletes node_module and exits shell
die () {
    [[ -n "$1" ]] && echo "$1"
    [[ -n "$2" ]] && exit $2 || exit 1
}
#
# fasd
#
# function to execute built-in cd, these are present throught .zprezto
# fasd_cd() {
#   if [ $# -le 1 ]; then
#     fasd "$@"
#   else
#     local _fasd_ret="$(fasd -e echo "$@")"
#     [ -z "$_fasd_ret" ] && return
#     [ -d "$_fasd_ret" ] && cd "$_fasd_ret" || echo "$_fasd_ret"
#   fi
# }
# alias a='fasd -a'        # any
# alias d='fasd -d'        # directory
# alias f='fasd -f'        # file
# alias s='fasd -si'       # show / search / select
# #alias sd='fasd -sid'     # interactive directory selection
# alias sf='fasd -sif'     # interactive file selection
# alias z='fasd_cd -d'     # cd, same functionality as j in autojump
# alias zz='fasd_cd -d -i' # cd with interactive selection

# ---------------------------------------------------------
# Boilerplate shortcuts
# ---------------------------------------------------------

# Create directory and immediately move into that dir
mk ()  { mkdir -p "$@" && cd "$_"; }

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
# exa
alias exa='exa --group-directories-first'

#
# Apps
#
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"
# get system version info
alias getsys="sw_vers"
alias vi="nvim"
alias vim="nvim"
alias tmn="tmux new-session -s"
alias tma="tmux attach -t"
alias tml="tmux ls"
alias tmk="tmux kill-session -t"
alias tmd="tmux detach -a"
alias y="yarn"
alias fdns="sudo dscacheutil -flushcache"
alias inish="git add . && git commit -m "inish""
# reload terminal after dotfile changes
# echo "sourcing "${HOME}/dotfiles/zshrc""
echo "sourcing2 ~/.zprezto/init.zsh"
# alias reload="source ${HOME}/dotfiles/zsh/zshrc"
alias rez="source ~/.zprezto/init.zsh"
alias reload="source ${HOME}/dotfiles/scripts/aliases.sh"

# echo "sourcing "${HOME}/.zshrc""
# source "${HOME}/.zshrc"
# alias reload="source ~/.zshrc"
# alias reload="source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh""

# yarn shortcuts

alias ys="yarn start"
alias yc="yarn clean"
alias ns="npm start"
alias nc="npm run clean"
alias bsbc="bsb -clean-world"
alias bsbm="bsb -make-world"
alias bsbw="bsb -make-world -w"
# delete all node_modules in dir.

alias findkill="find . -name "node_modules" -type d -prune -exec rm -rf '{}' +"

alias fddry="fd node_modules -x bash -c "rm -rf '{}' +""
function _basename_filename_extension(){
  # https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
for entry in $(pwd)/*
  do
    basename "$entry" .md
    #   echo "$entry"
  done
}
alias bfe="_basename_filename_extension";

function _add_typescript(){
  npm i --save-dev typescript
  # require `jq` and `moreutils` `brew install jq`,`brew install moreutils`
  jq '.scripts += {compile: "tsc"}' package.json | sponge package.json
  npm run compile -- --init
}
alias addts="_add_typescript";

function __del_node_modules_in_dir(){
echo "deleting /node_modules"
  cd ~/Github/ && echo $(pwd) && findkill
  cd ~/Downloads/ && echo $(pwd) && findkill
}
alias killnd="__del_node_modules_in_dir"

# clear esy cache
alias clearesy="rm -rf ~/.esy/"
alias npxcra="npx create-react-app "$1""
# bucklescript bsrefmt
alias reformat="find . -name *.re -or -name *.rei | grep -v node_modules | xargs bsrefmt --in-place"

# start chrome with extensions disabled flag
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --bwsi &"

function __git_clone_then_cd {
  if [ "$1x" != "x" ]; then
    git clone "https://github.com/$1"
    DIRNAME="$(cut -d'/' -f2 <<<$1)"
    cd "$DIRNAME"
  fi
}
# git clone and cd into cloned repo
alias gcd='__git_clone_then_cd'

# git add and commit with message
function __git_add_and_commit_with_message(){
  git add .
  git commit -m $1
}
alias gac='__git_add_and_commit_with_message'

alias gp='git push'

# list all installed apps from mac app store

alias apps="find /Applications \
-path '*Contents/_MASReceipt/receipt' \
-maxdepth 4 -print |\
sed 's#.app/Contents/_MASReceipt/receipt#.app#g; s#/Applications/##'"

# log package.json scripts

alias cats="cat package.json | jq ".scripts""

alias dev="concurrently \"npm:watch\" \"npm:webpack\" \"npm:server\""

# check incoming args on a script
function _check_args(){
  # i=$1
  # if [ $# -ne 1 ]
  # then
    
  #    echo "Usage: $0 <must provide directory>"
  # fi
  arg_count=$#

  if [ $# -eq 0 ]
    then
      echo "$arg_count arguments supplied"
  fi
}
# bucklescript init scripts

function __bsb_init_basic_reason(){
  _check_args
  bsb -init $1 -theme basic-reason
  cd $1
}
alias bsbr='__bsb_init_basic_reason'


function __bsb_init_react_hooks(){
  _check_args
  bsb -init $1 -theme react-hooks
  cd $1
}

alias bsbrh='__bsb_init_react_hooks'

function __bsb_init_ocaml_default(){
  _check_args
  bsb -init $1
  cd $1
}

alias bsbi='__bsb_init_ocaml_default'



# delete any .ml files

function __delete_ml {
  rm -rf **/*.ml
}

alias dml='__delete_ml'

# delete any .mli files

function __delete_mli {
  rm -rf **/*.mli
}

alias dmli='__delete_mli'
# convert .re to .ml files

# convert .ml to .re files
# https://mike632t.wordpress.com/2017/07/06/bash-yes-no-prompt/

function _add_bs_dependency(){

  NEWDEP=$1
  npm install $NEWDEP

  $(cat bsconfig.json | jq --arg NEWDEP $NEWDEP -r '.["bs-dependencies"] 
 += [$NEWDEP]' | sponge bsconfig.json)

  cat bsconfig.json | jq '.["bs-dependencies"]'
  echo ✨${NEWDEP} added to bs-dependencies ✨
}

alias addbs="_add_bs_dependency"
# function _add_bs_dependency(){
#   newDep=$1
#  jq '.["bs-dependencies"] += [ ${newDep} ]' bsconfig.json | sponge bsconfig.json
# }
function _add_mlre_scripts(){
   jq '.scripts += {format: "bsrefmt"}' package.json | sponge package.json
   jq '.scripts += {mlre: "bsrefmt --parse ml --print re --interface false"}' package.json | sponge package.json
   jq '.scripts += {reml: "bsrefmt --parse re --print ml --interface false"}' package.json | sponge package.json


#  jq '.scripts += {format: "bsrefmt"},{mlre: "bsrefmt --parse ml --print re --interface false"}{reml: "bsrefmt --parse re --print ml --interface false"}' bsconfig.json | sponge bsconfig.json
}

alias addmlre="_add_mlre_scripts"


function __convert_ml_to_re() {
  echo $(pwd)
  find . -name "*.ml" | while read filename; do bsrefmt --parse ml --print re $filename > ${filename%.ml}.re; done

} 

alias mlre="__convert_ml_to_re"

# convert .re to .ml files

function __convert_re_to_ml() {
  echo $(pwd)
  find . -name "*.re" | while read filename; do bsrefmt --parse re --print ml $filename > ${filename%.re}.ml; done
}

alias reml='__convert_re_to_ml'

# convert .rei to .mli files

function __convert_rei_to_mli(){
  echo $(pwd)
  find . -name "*.rei" | while read filename; do bsrefmt --parse re --print ml $filename > ${filename%.rei}.mli; done
}

alias reimli='__convert_rei_to_mli'

# convert one .rei to .mli file

function __convert_one_rei_to_mli(){
  echo $(pwd)
  file=$1
  find . -name $1 | while read filename; do bsrefmt --parse re --print ml $filename > ${filename%.rei}.mli; done
}

alias onereimli='__convert_one_rei_to_mli'

# convert one .re to .ml file

function __convert_one_re_to_ml() {
    echo $(pwd)
    file=$1
    find . -name $1 | while read filename; do bsrefmt --parse re --print ml $filename > ${filename%.re}.ml; done
}

alias onereml='__convert_one_re_to_ml'
# convert one .ml to .re file

function __convert_one_ml_to_re() {
  echo $(pwd)
  
  filename=$1

  echo $filename
  bsrefmt --parse ml --print re $filename > ${filename%.ml}.re

}

alias onemlre='__convert_one_ml_to_re'

# convert .mli to .rei files

function __convert_mli_to_rei(){
  echo $(pwd)
  find . -name "*.mli" | while read filename; do bsrefmt --parse ml --print re $filename > ${filename%.mli}.rei; done
}

alias mlirei='__convert_mli_to_rei'

# log npm scripts
alias cats="cat package.json | jq '.scripts'"


# new github repo via web

alias new="open https://github.com/new"

# opam_open on https://opam.ocaml.org/

function __opam_open_opam_pkg_on_web {

  opam_pkg=$1

  url=https://opam.ocaml.org/packages/${opam_pkg}

  open ${url}
}

alias oo="__opam_open_opam_pkg_on_web"

## create a bunch of files

function __create_a_bunch_of_files(){
  thismany=$1
  name=$2
  for i in {0..${thismany}}
  do
      echo "//*${name}${i}*/" > "decoding_objects${i}.re"
  done
}

alias genfiles="__create_a_bunch_of_files"


function gi() { 
  curl -sLw n https://www.gitignore.io/api/$@ ;
}
function nr() {
  hub create
  git push --set-upstream origin master
}
