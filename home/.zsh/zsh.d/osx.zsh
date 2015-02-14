zstyle ':completion:*:*:*:*:processes' command "ps -A"
if type gls > /dev/null; then # osx gnu coreutils installed
    alias ls='\gls -h --color=auto'
    alias ll='\gls -lh --color=auto'
    alias l='\gls -h -1 --color=auto'
    alias date='gdate'
    alias sort='gsort'
else # crappy osx ls installed
    alias ls="ls -h -G"
    alias ll='ls -lh -G'
    alias l="ls -h -1 -G"
fi
unalias tmux
alias tmux="SHELL=/usr/local/bin/zsh tmux"
export STARTER_KIT_VM_ROOT='/opt/starter-kit'
export STARTER_KIT_CACHE_ROOT='/opt/starter-kit'
export STARTER_KIT_SHARED_FOLDER_ROOT='/opt/base/'

STARTER_KIT_RUBY_VERSION='2.1.2'

alias starter-kit="RBENV_VERSION=$STARTER_KIT_RUBY_VERSION starter-kit"
alias spo="RBENV_VERSION=$STARTER_KIT_RUBY_VERSION starter-kit provision --only"
alias s="RBENV_VERSION=$STARTER_KIT_RUBY_VERSION starter-kit remote s"
alias sr="RBENV_VERSION=$STARTER_KIT_RUBY_VERSION starter-kit remote"
alias se="RBENV_VERSION=$STARTER_KIT_RUBY_VERSION starter-kit remote se"
alias sc="RBENV_VERSION=$STARTER_KIT_RUBY_VERSION starter-kit remote sc"
alias si="RBENV_VERSION=$STARTER_KIT_RUBY_VERSION starter-kit remote si"
alias grid="RBENV_VERSION=$STARTER_KIT_RUBY_VERSION grid"
alias dropship="RBENV_VERSION=$STARTER_KIT_RUBY_VERSION dropship"
alias dss="RBENV_VERSION=$STARTER_KIT_RUBY_VERSION dropship ssh"
