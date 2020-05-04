#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...


# Source Aliases

source "${ZDOTDIR:-$HOME}/dotfiles/aliases.sh"

# Source Exports
source "${ZDOTDIR:-$HOME}/dotfiles/exports.sh"
# echo "$(fnm env --multi --use-on-cd)"
source ${HOME}/Library/Preferences/org.dystroy.broot/launcher/bash/br

eval "$(fnm env --use-on-cd)"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# sourcing
echo "sourcing "${HOME}/.zshrc""
source "${HOME}/.zshrc"
# opam configuration
test -r /Users/mandalarian/.opam/opam-init/init.zsh && . /Users/mandalarian/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# https://stackoverflow.com/a/26846960/2336356
#set history size
export HISTSIZE=10000
#save history after logout
export SAVEHIST=10000
#history file
export HISTFILE=~/.zhistory
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY   

# standardml/ added to zprofile instead
# export PATH=/usr/local/smlnj/bin:$PATH
currentfile=`basename "$0"`
echo "this is coming from $(pwd)/$currentfile"
export PATH=/usr/local/bin:$PATH 

export PATH="/usr/local/opt/llvm/bin:$PATH"
# https://github.com/jluningp/smlformat
# echo "PATH=\"\$PATH:SMLFORMAT_DIR\"; export PATH" >> ~/.bashrc
export PATH=/usr/local/bin:$PATH 
export PATH=${HOME}/smlformat:$PATH
# export PATH=/home/smlformat:$PATH
# basher
export PATH="$HOME/.basher/bin:$PATH"
eval "$(basher init - zsh)"
# https://github.com/zquestz/s#providertag-autocompletion
if [ -f $GOPATH/src/github.com/zquestz/s/autocomplete/s-completion.bash ]; then
    . $GOPATH/src/github.com/zquestz/s/autocomplete/s-completion.bash
fi

# opam env
eval `opam config env`
