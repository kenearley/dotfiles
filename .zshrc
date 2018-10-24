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

export OCI_DIR=/opt/oracle/instantclient_11_2
export ORACLE_HOME=/opt/oracle/instantclient_11_2
export DYLD_LIBRARY_PATH=/opt/oracle/instantclient_11_2
export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
export SUBLIME=/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
export PATH=$PATH:$SUBLIME
export PATH=$PATH:$JAVA_HOME
export PATH=$PATH:$OCI_DIR
export PATH=$PATH:$ORACLE_HOME
export PATH=$PATH:$DYLD_LIBRARY_PATH

alias vi="nvim"
alias vim="nvim"
alias vimrc="vim ~/.vimrc"
alias preztorc="vim ~/.zpreztorc"
alias gitconfig="vim ~/.gitconfig"
alias zshrc="vim ~/.zshrc"
alias testunit="spring testunit"
alias stree='/Applications/SourceTree.app/Contents/Resources/stree'

alias evo_qc_console='~/bin/evo_qc_console'

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

eval "$(nodenv init -)"
eval "$(rbenv init - zsh)"
export PATH=./bin:./bin/developer:$PATH
# source /usr/local/share/zsh/site-functions/_aws

