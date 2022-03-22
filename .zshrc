export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Oh mY ZSH wont self update
DISABLE_AUTO_UPDATE=true

# Uncomment the following line if you want to disable marking untracked files
# much, much faster.
# under VCS as dirty. This makes repository status check for large repositories
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

function cd {
  builtin cd "$@" && exa -la
}

setopt histignoredups
setopt HIST_IGNORE_ALL_DUPS

alias ls='exa -la'
alias composer='php /usr/bin/composer.phar'
alias y='psysh'
alias p='wmctrl -a phpstorm && phpstorm'
alias dc='docker-compose'
alias ds='docker container stop $(docker container list -q)'

alias cdm='cd $HOME/checkout/mercimax && echo "" && gst'
alias cdf='cd $HOME/checkout/flowfo && echo "" && gst'

alias cdp='cd $HOME/checkout/pegase && echo "" && gst'
alias cdpa='cd $HOME/checkout/pegase/api && echo "" && gst'

alias cdi='cd $HOME/checkout/idcity/IdCitySaas && echo "" && gst'
alias cdid='cd $HOME/checkout/idcity/DockerDev && echo "" && gst'
alias cda='cd $HOME/checkout/appelles/app-elles-backend/api && gst'


alias gb='for k in `git branch -r | perl -pe '\''s/^..(.*?)( ->.*)?$/\1/'\''`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort '

alias gcam='git commit -am'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
