if [[ -d $HOME/.rbenv && -d $HOME/.rbenv/bin ]]; then
    PATH=$HOME/.rbenv/bin:$PATH
fi
if type rbenv > /dev/null; then
    eval "$(rbenv init - zsh)"
fi
