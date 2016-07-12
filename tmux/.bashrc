alias sublime='/opt/sublime_text/sublime_text'
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
alias tmux="TERM=screen-256color-bce tmux"
export EDITOR=vim






tmux attach &> /dev/null

if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi
