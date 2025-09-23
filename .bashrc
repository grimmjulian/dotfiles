#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias sudo='sudo '
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nvim='bob run nightly'
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='[\u@\h \W ~${PS1_CMD1}]\\$ '
