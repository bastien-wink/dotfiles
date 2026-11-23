alias ssh 'TERM=xterm-256color command ssh'
alias cc 'claude'
bind '<' 'if test -z (commandline); commandline -r "cd ~/checkout/"; else; commandline -i "<"; end'
alias cs 'claude --dangerously-skip-permissions'
alias ls 'exa -la'
alias y 'psysh'
alias dc 'docker compose'
alias ds 'docker container stop $(docker container list -q)'
alias dk 'docker kill $(docker ps -q) && docker rm $(docker ps -aq)'
alias dcu 'dc up -d'
alias ku 'dk ; dcu'

alias gf 'git fetch'
alias gc 'git commit'
alias gb 'git branch'
alias ga 'git add'
alias gl 'git pull'
alias gd 'git diff'
alias gco 'git checkout'
alias gst 'git status'
alias gp 'git push'
alias gcam 'git add . && git status && git commit -m'
alias gcl 'git clean -fd && git checkout .'

alias cda 'cd $HOME/checkout/appelles/app-elles-backend/api && git status'
alias cdr 'cd $HOME/checkout/appelles/resonantes-website && git status'
alias cdg 'cd $HOME/checkout/generationzebree && git status'
alias cdk 'cd $HOME/checkout/kinjo/kinjo-platform && git status'

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting                                 # Supresses fish's intro message
set fish_prompt_pwd_dir_length 0

set -g FZF_DEFAULT_OPTS '--layout=reverse'

function p
    for arg in $argv
        if string match -qr '^(.+):([0-9]+)$' -- $arg
            set -l file (string replace -r '^(.+):([0-9]+)$' '$1' -- $arg)
            set -l line (string replace -r '^(.+):([0-9]+)$' '$2' -- $arg)
            phpstorm2 --line $line $file &
        else
            phpstorm2 $arg &
        end
    end
end

starship init fish | source
