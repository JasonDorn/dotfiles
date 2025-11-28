export ITERM2_SHELL_INTEGRATION_NO_YANK_PROMPT=1
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/json/.oh-my-zsh"

export EDITOR='nvim'
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
# plugins=(zsh-autosuggestions zsh-syntax-highlighting)
plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
# source ~/.zsh_env_vars

# Example aliases
alias v='nvim'
alias zshrc="v ~/.zshrc"
alias vimrc="v ~/.vimrc"
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
alias gri='g rebase -i origin/development'
alias be="bundle exec"
alias gbDA="git branch | grep -v "development" | xargs git branch -D"
alias bi="bundle install"
alias gcod='git checkout development'
alias gaca='gA; git commit --amend --no-edit'
alias gacfp='gA; git commit -am -no-commit; gpf'
alias rc='bin/rails c'
alias logs='tail -f log/development.log'
alias killpuma='kill -9 $(lsof -i tcp:3000 -t)'
alias sr='spring stop; spring start;'
alias migrate='be rake db:migrate && be rake db:test:prepare'
alias dotfiles='cd ~/dotfiles/'
alias developer='cd ~/Developer'

export PGCLIENTENCODING=utf-8
export PATH="$PATH:/Users/json/.dotnet/tools"

# path+=('/Library/Frameworks/Mono.framework/Versions/Current/bin')

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# HB stuff
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# this is necessary so that rbenv and brew packages get priority.
export PATH="$HOME/.rbenv/bin:$PATH"
[[ -n $(which rbenv) ]] && eval "$(rbenv init - --no-rehash)"

export PYTHONBREAKPOINT=ipdb.set_trace
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
eval "$(direnv hook zsh)"
source ~/.work_zshrc.zsh
alias pcloneshell="POSTGRES_DB=$PEQUITY_CLONE_DB POSTGRES_USER=$PEQUITY_CLONE_USER POSTGRES_PASSWORD=$PEQUITY_CLONE_PGPASSWORD HOST=$PEQUITY_CLONE_HOST  python manage.py shell_plus"
alias pcloneserver="POSTGRES_DB=$PEQUITY_CLONE_DB POSTGRES_USER=$PEQUITY_CLONE_USER POSTGRES_PASSWORD=$PEQUITY_CLONE_PGPASSWORD HOST=$PEQUITY_CLONE_HOST  python manage.py runserver"
alias ruff-staged='git diff --name-only --cached --diff-filter=ACM | grep "\.py$" | xargs ruff format'
# from django.db import connection, connections
# connections["default"].set_schema("interactivebrokers")

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
