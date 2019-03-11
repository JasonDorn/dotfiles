# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

#Load rbenv
status --is-interactive; and . (rbenv init -|psub)

set -gx EDITOR vim
alias reacts='foreman start -f Procfile.dev'
alias gco="g checkout"
alias gf="g fetch origin"
alias gr="g rebase origin/master"
alias srspec="bin/rspec"
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
alias bi='bundle install'
alias g="git"
alias gri='g rebase -i origin/develop'
alias srails='bin/rails'
alias sw="env QUEUE='*' bundle exec rake resque:work"
alias be="bundle exec"
alias gbDA="git branch | grep -v "develop" | xargs git branch -D"
alias v='vim'
alias bi='bundle install'
alias babel='./node_modules/.bin/babel'
alias spsg='brew services start postgresql'
alias kpsg='brew services stop postgresql'
alias sz='export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES'
alias gcod='git checkout develop'
alias gaca='gA; git commit --amend --no-edit'
alias gacfp='gA; git commit -am -no-commit; gpf'

function hb.pgcli
  psql "postgresql://jason@$argv.cyutk09lvyxz.us-west-2.rds.amazonaws.com:5432/homebase"
end

alias hb.db.clone='hb.pgcli clone-standalone'

export PGPASSWORD=kbtsWAwUoBFLKJY6BpRs
