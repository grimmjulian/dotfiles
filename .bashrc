#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias sudo='sudo '
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias bobn='bob run nightly'
PS1='[\u@\h \W]\$ '
