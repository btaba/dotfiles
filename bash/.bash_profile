
# ~/.bashrc
source ~/smart-change-directory/shellrcfiles/bashrc_scd

# Bash autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
    source <(kubectl completion bash)
fi

# Some terminal colors
COLOR_RED="\033[38;5;202m"
COLOR_YELLOW="\033[38;5;220m"
COLOR_GREEN="\033[38;5;71m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[38;5;44m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Parse git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[$COLOR_RED\]\u\[$COLOR_RESET\]@\h \[$COLOR_BLUE\]\W:\[$COLOR_RESET\]\[$COLOR_GREEN\]\$(parse_git_branch)\[\033[00m\]\n 🌎 > "


# Aliases
alias ls='ls -GFh'
alias gs='git status'
alias gb='git branch'
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

# History
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# MAC utilities
alias sleepscr='pmset displaysleepnow'

# Kubernetes
alias k='kubectl'

