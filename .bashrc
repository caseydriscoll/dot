source .alias

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
	# alias  apache='sudo /usr/sbin/apachectl'
	# alias  nginx='sudo nginx'
	alias  www="cd ~/Development/www"
	alias  vvv="cd ~/Development/vvv"

	PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
	# PATH=/usr/local/heroku/bin:$PATH
	# PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
	export PATH

	# source ~/.rvm/scripts/rvm

	export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
fi

