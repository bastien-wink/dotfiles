export ZSH="/home/bastien/.oh-my-zsh"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function cd {
  builtin cd "$@" && ls -h
}

setopt histignoredups
setopt HIST_IGNORE_ALL_DUPS

alias y='psysh'
alias p='wmctrl -a phpstorm && phpstorm'
alias dc='docker-compose'

#alias cda='cd /home/bastien/checkout/digitalgarden/armor-easy-print && echo "" && gst'
#alias cdp='cd /home/bastien/checkout/digitalgarden/pim && echo "" && gst'
#alias cdc='cd /home/bastien/checkout/digitalgarden/catrange && echo "" && gst'
alias cdm='cd /home/bastien/checkout/mercimax && echo "" && gst'
alias cdf='cd /home/bastien/checkout/flowfo && echo "" && gst'
alias cdh='cd /home/bastien/checkout/Handiplanet_FE && echo "" && gst'
alias cdhf='cd /home/bastien/checkout/Handiplanet_FE && echo "" && gst'
alias cdhb='cd /home/bastien/checkout/Handiplanet_BE && echo "" && gst'
alias cdha='cd /home/bastien/checkout/Handiplanet_APP && echo "" && gst'

alias gb='for k in `git branch -r | perl -pe '\''s/^..(.*?)( ->.*)?$/\1/'\''`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort '

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/bastien/google-cloud-sdk/path.zsh.inc' ]; then . '/home/bastien/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/bastien/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/bastien/google-cloud-sdk/completion.zsh.inc'; fi
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
