source ~/.alias
source ~/.functions

PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

if [ -d "$HOME/.scripts" ]; then
  for f in $HOME/.scripts/*; do source $f; done
fi

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

PS1="> "

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
  alias  motd='run-parts /etc/update-motd.d/'

	if [ -d "~/.wp-cli" ]; then
		PATH="$PATH:$HOME/.wp-cli/bin"
	fi
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
  alias  sub="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

  alias fab="cd ~/Development/fab/www"

  export EDITOR='vim'

  if [ -d "$HOME/.rbenv" ]; then
    export PATH="$HOME/.rbenv/shims:$PATH"
  fi

  # if [ -d "$HOME/.rvm" ]; then
    # source ~/.rvm/scripts/rvm
    # export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
  # fi

  if [ -d "$HOME/Library/Android/sdk" ]; then
    PATH="$PATH:$HOME/Library/Android/sdk/tools"
    PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
    export PATH
  fi
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
