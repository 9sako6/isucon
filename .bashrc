# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# プロンプトにブランチ名表示
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
if [ -f /etc/bash_completion.d/git-prompt ]; then
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
else
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

export PATH=/home/isucon/local/ruby/bin:$PATH

alias gst="git status"
alias gps="git push"
alias gad="git add"
alias gpl="git pull --ff-only"
alias grb="git rebase"
alias gfc="git fetch"
alias gch="git checkout"
alias glg="git log --oneline --decorate --graph --all"
alias gcm="git commit -m "
