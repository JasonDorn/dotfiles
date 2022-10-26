# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jasondorn/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git zsh-autosuggestions rails ruby rake rbenv zsh-syntax-highlighting)
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
#
# Example aliases
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias gco="g checkout"
alias gf="g fetch origin"
alias gr="g rebase origin/master"
alias g='git'
alias gst='g status'
alias gpf='g push --force-with-lease'
alias gd='g diff'
alias gA="g add -A"
alias gAp="gA --patch"
alias gc="g commit -v"
alias gp="g push"
alias gpu="g push -u origin HEAD"
alias gup='git pull --rebase'
alias g="git"
alias gri='g rebase -i origin/develop'
alias be="bundle exec"
alias gbDA="git branch | grep -v "develop" | xargs git branch -D"
alias v='vim'
alias bi='bundle install'
alias gcod='git checkout develop'
alias gaca='gA; git commit --amend --no-edit'
alias gacfp='gA; git commit -am -no-commit; gpf'
alias rails='bin/rails s'
alias rc='bin/rails c'
alias hb='cd ~/Developer/Homebase1'
alias lt1='ngrok http -hostname=local-tunnel.joinhomebase.com 3000'
alias lt2='ngrok http -hostname=local-tunnel2.joinhomebase.com 3000'
alias logs='tail -f log/development.log'
alias killpuma='kill -9 $(lsof -i tcp:3000 -t)'
alias obe9='gco obe9/feature-branch'
alias rs='pgcli "host='homebase.coumrfl5tpqr.us-west-2.redshift.amazonaws.com' user='jasondorn' dbname='homebase' port='5439' password='H0m3b@s31!'"'
alias tmux="TERM=screen-256color-bce tmux"
alias hb.k='lsof -i:3000 | grep LISTEN | awk '\''{print $2}'\'' | xargs kill -9'
alias sr='spring stop; spring start;'
alias migrate='be rake db:migrate:with_data; be rake db:test:prepare'

function assets() {
  cd hb;
  cd client;
  yarn run hot-assets;
}

function rollout() {
  be rake "rollouts:generate[${1}]"
}

export PATH="$PATH:/Users/jasondorn/.dotnet/tools"

# path+=('/Library/Frameworks/Mono.framework/Versions/Current/bin')

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# HB stuff
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export NVM_DIR="$HOME/.nvm"
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# this is necessary so that rbenv and brew packages get priority.
export PATH="$HOME/.rbenv/bin:$PATH"
[[ -n $(which rbenv) ]] && eval "$(rbenv init - --no-rehash)"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
