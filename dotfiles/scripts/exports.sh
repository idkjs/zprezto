# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# here's LS_COLORS
# github.com/trapd00r/LS_COLORS
# command -v gdircolors >/dev/null 2>&1 || alias gdircolors="dircolors"
# eval "$(gdircolors -b ~/.dircolors)"

# Add npmbin mode modules to `$PATH`
export PATH="$HOME/dotfiles/npmbin/node_modules/.bin:$PATH"

# Add `~/bin` to the `$PATH`
export PATH="$HOME/dotfiles/bin:$PATH"


# Android Studio
# export ANDROID_HOME=~/Library/Android/sdk
# export PATH=${PATH}:${ANDROID_HOME}/tools
# export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Postgresql App
export PATH=${PATH}:/Applications/Postgres.app/Contents/Versions/latest/bin

# export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Github
# export NPM_TOKEN="$(cat ~/.npmrc | awk -F'=' '{print $2}')"

# rg config
export RIPGREP_CONFIG_PATH="$HOME/.rgrc"

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# fnm
export PATH=/var/folders/rt/7lc5vcw16459dszl8djk35fh0000gn/T/fnm-shell-9103786/bin:$PATH
export FNM_MULTISHELL_PATH=/var/folders/rt/7lc5vcw16459dszl8djk35fh0000gn/T/fnm-shell-9103786
export FNM_DIR=/Users/mandalarian/.fnm
export FNM_NODE_DIST_MIRROR=https://nodejs.org/dist
export FNM_LOGLEVEL=info