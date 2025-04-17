# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -z "$DISPLAY" ] && [ "$(tty)" = /dev/tty1 ]; then
        startx
fi

# Disable the bell
if [[ $iatest -gt 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTTIMEFORMAT="%F %T" # add timestamp to history

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Функция для отображения имени текущей ветки Git
parse_git_branch() {
        git rev-parse --is-inside-work-tree &>/dev/null
        if [ $? -eq 0 ]; then
                branch=$(git symbolic-ref --short HEAD 2>/dev/null)
                echo " ($branch)"
        fi
}

# Настройка PS1 для отображения ветки Git с цветами
PS1="\[\e[32m\]\u@\h:\[\e[34m\]\w\[\e[33m\]\$(parse_git_branch)\[\e[0m\]\$ "
#PS1="[\[\e[34m\]\w\[\e[m\]\[\e[33m\]\$(parse_git_branch)\[\e[m\]] "


eval "$(fzf --bash)"
eval "$(zoxide init bash)"

# Перемещение по истории
bind '"\C-k": previous-history'
bind '"\C-j": next-history'

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim
alias vim='nvim'
alias vi='nvim'
alias t='tmux'

