# iTerm2 shell integration
export ITERM2_SHELL_INTEGRATION_NO_YANK_PROMPT=1

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Plugins
plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Aliases - Git
alias g='git'
alias gst='g status'
alias gco='g checkout'
alias gf='g fetch origin'
alias gr='g rebase origin/master'
alias gd='g diff'
alias gA='g add -A'
alias gAp='gA --patch'
alias gc='g commit -v'
alias gp='g push'
alias gpu='g push -u origin HEAD'
alias gup='git pull --rebase'
alias gri='g rebase -i origin/development'
alias gcod='git checkout development'
alias gaca='gA; git commit --amend --no-edit'
alias gpf='g push --force-with-lease'
alias gbDA='git branch | grep -v "development" | xargs git branch -D'

# Aliases - Editor & Navigation
alias v='nvim'
alias vim='nvim'
alias zshrc='v ~/.zshrc'
alias dotfiles='cd ~/dotfiles/'
alias developer='cd ~/Developer'

# Aliases - Development (Ruby/Rails - legacy)
alias be='bundle exec'
alias bi='bundle install'
alias rc='bin/rails c'
alias logs='tail -f log/development.log'
alias killpuma='kill -9 $(lsof -i tcp:3000 -t)'
alias sr='spring stop; spring start;'
alias migrate='be rake db:migrate && be rake db:test:prepare'

# Aliases - Python/Django
alias pcloneshell="POSTGRES_DB=$CLONE_DB POSTGRES_USER=$CLONE_USER POSTGRES_PASSWORD=$CLONE_PGPASSWORD HOST=$CLONE_HOST python manage.py shell_plus"
alias pcloneserver="POSTGRES_DB=$CLONE_DB POSTGRES_USER=$CLONE_USER POSTGRES_PASSWORD=$CLONE_PGPASSWORD HOST=$CLONE_HOST python manage.py runserver"
alias ruff-staged='git diff --name-only --cached --diff-filter=ACM | grep "\.py$" | xargs ruff format'

# Neovim - using LazyVim
# Old configs backed up in nvim-nvchad-backup and nvim-lazyvim-backup

# Environment variables
export PYTHONBREAKPOINT=ipdb.set_trace
export PGCLIENTENCODING=utf-8
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# PATH configurations
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"

# Tool initialization
[[ -n $(which rbenv) ]] && eval "$(rbenv init - --no-rehash)"
eval "$(direnv hook zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Work-specific configuration (keep your secrets here)
[ -f ~/.work_zshrc.zsh ] && source ~/.work_zshrc.zsh
