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
export GO111MODULE=on
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOPROXY=https://proxy.golang.org,direct  
export GOPRIVATE=github.com/frontendmasters/*
export PATH=$PATH:/usr/local/go/bin:$GOBIN

ulimit -n 4864
ulimit -u 1418

alias lc='colorls -1 --sd'

alias vi="nvim"
alias vim="nvim"
alias vimrc="vim ~/.config/nvim/init.vim"
alias preztorc="vim ~/.zpreztorc"
alias gitconfig="vim ~/.gitconfig"
alias zshrc="vim ~/.zshrc"
alias testunit="spring testunit"
alias stree='/Applications/SourceTree.app/Contents/Resources/stree'

alias evo_qc_console='~/bin/evo_qc_console'

# autoload -Uz promptinit
# promptinit
# prompt agnoster
# prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#   fi
# }

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

iterm2_print_user_vars() {
  iterm2_set_user_var pwd ${PWD##*/}
}

function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

eval "$(rbenv init -)"
eval "$(nodenv init -)"

export PATH=./bin:./bin/developer:$PATH
# source /usr/local/share/zsh/site-functions/_aws
source $(dirname $(gem which colorls))/tab_complete.sh
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

