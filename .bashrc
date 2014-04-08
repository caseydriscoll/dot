alias a='alias'

alias  ..='cd ..'
alias  ...='cd ../..'
alias  ....='cd ../../..'

alias  att='tmux attach'
alias  attach='tmux attach'
alias  b='back'
alias  back='popd'
alias  brc='vim ~/.bashrc'
alias  c='clear'
alias  cdh='cd ~'
alias  cdhome='cd ~'
alias  d='date'
alias  detach='tmux detach'
alias  doit='eval "sudo $(fc -ln -1)"' # when I forget to use sudo, redo the last command with sudo
alias  g='git'
alias  github='git push github master'
alias  go='pushd $dir > /dev/null' # pushes dir to stack silently
alias  h='sudo vim /etc/hosts'
alias  install='sudo apt-get install'
alias  j='jobs'
alias  log='git lg'
alias  path='echo $PATH'
alias  please='sudo' # sometimes I feel courteous
alias  pull='git pull hub master'
alias  push='git push hub master'
alias  py='python'
alias  r='rails'
alias  rm='rm -i' # it never hurts to double check
alias  s='du -sh' # shows the total size of the current (or given) dir
alias  sf='du -hd 1' # shows the total size of all the folders in the current (or given) dir
alias  sb='source ~/.bashrc'
alias  st='status'
alias  status='git status'
alias  tf='tree -C'
alias  t='tf -L 1' # show tree structure at expanding levels
alias  tt='tf -L 2'
alias  ttt='tf -L 3'
alias  tttt='tf -L 4'
alias  v='vagrant'
alias  x='exit'
alias  vimrc='vim ~/.vimrc'

function addhost { echo "$(cat /etc/hosts) $1" | sudo tee /etc/hosts; }
export -f addhost

function trash { mv "$1" ~/.Trash; } # I never use this.
export -f trash
alias  T='trash'

PS1="\h:\W$ "

if [[ `uname` == 'Linux' ]]; then
	alias  sd='du --max-depth=1 -h | sort -rh'
	export LS_OPTIONS='--color=auto'
	alias  ll='ls $LS_OPTIONS -lh'
	alias  la='ls $LS_OPTIONS -Alh'
	alias  lh='ls $LS_OPTIONS -ldh .*'
	alias  apache='sudo /etc/init.d/apache2'
  alias  nginx='sudo service nginx'
  alias  update='sudo apt-get update'
  alias  upgrade='sudo apt-get upgrade --show-upgraded'
  alias  www='cd /srv/www/'

  source $HOME/.wp-cli/vendor/wp-cli/wp-cli/utils/wp-completion.bash
  PATH="$PATH:$HOME/.wp-cli/bin"
elif [[ `uname` == 'Darwin' ]]; then
  echo "THIS IS OSX"
	alias  cddesk='cd ~/Desktop'
	alias  cddown='cd ~/Downloads'
	alias  cddrop='cd ~/Dropbox'
	alias  cdsite='cd ~/Sites'
	
	alias  la='ls -alh -G'
	alias  lh='ls -ldh .*'
	alias  ll='ls -lh -G'
	alias  apache='sudo /usr/sbin/apachectl'
  alias  nginx='sudo nginx'
  alias  www="cd ~/Development/www"

	PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
  PATH=/usr/local/heroku/bin:$PATH
  PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
	export PATH

  source ~/.rvm/scripts/rvm

  export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
fi

