# # Set up the prompt
#
# autoload -Uz promptinit
# promptinit
# prompt adam1
#
# setopt histignorealldups sharehistory
#
# # Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e
#
# # Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
# HISTSIZE=1000
# SAVEHIST=1000
# HISTFILE=~/.zsh_history
#
# # Use modern completion system
# autoload -Uz compinit
# compinit
# alias vi="nvim"
#
# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true
#
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


#Set up the prompt

autoload -Uz promptinit
promptinit
# prompt adam1
# prompt default

setopt histignorealldups sharehistory PROMPT_SUBST promptsubst 

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


precmd() { psvar[1]=$(parse_git_branch); }


export PROMPT="%K{blue}%n@%m%k%B%F{cyan}%(4~|...|) %3~%F{blue} %1v
%# %b%f%k"


# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# to use nvim as man page viewer
# export MANPAGER='nvim +Man!'

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# read process shell functions
if [ -f ~/.functions ]; then
	. ~/.functions
fi

if [ -f ~/.paths ];then
	. ~/.paths
fi
EDITOR=/usr/bin/nvim;

case "$TERM" in

    xterm-color|*-256color) color_prompt=yes;
esac
# export $TERM=xterm-256color

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
   #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias c='clear'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# to configure or swap caps with escape 
#setxkbmap -option caps:swapescape

export PATH=$PATH:/home/naran/.local/bin

# Set up fzf key bindings and fuzzy completion
# source <(fzf --zsh)
source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh

# 
export JAVA_HOME=/usr/local/openjdk-17
export PATH=$JAVA_HOME/bin:$PATH


export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# for tmux to run default 
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [ -f ~/.with_tm ]; then
#   # exec tmux
#   exec tmux new -n "base"
# fi
tmux new -n "base"
clear

