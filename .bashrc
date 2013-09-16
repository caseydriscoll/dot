alias a='alias'

a ..='cd ..'
a ...='cd ../..'
a ....='cd ../../..'

a att='tmux attach'
a attach='tmux attach'
a b='back'
a back='popd'
a brc='vim ~/.bashrc'
a c='clear'
a cdh='cd ~'
a cdhome='cd ~'
a d='date'
a detach='tmux detach'
a doit='eval "sudo $(fc -ln -1)"' # when I forget to use sudo, redo the last command with sudo
a g='git'
a go='pushd $dir > /dev/null' # pushes dir to stack silently
a install='sudo apt-get install'
a j='jobs'
a log='git log'
a path='echo $PATH'
a please='sudo' # sometimes I feel courteous
a pull='git pull hub master'
a push='git push hub master'
a py='python'
a r='rails'
a rm='rm -i' # it never hurts to double check
a s='du -sh' # shows the total size of the current (or given) dir
a sf='du -hd 1' # shows the total size of all the folders in the current (or given) dir
a sb='source ~/.bashrc'
a status='git status'
a tf='tree -C'
a t='tf -L 1' # show tree structure at expanding levels
a tt='tf -L 2'
a ttt='tf -L 3'
a tttt='tf -L 4'
a x='exit'
a vimrc='vim ~/.vimrc'

function trash { mv "$1" ~/.Trash; } # I never use this.
export -f trash
a T='trash'

PS1="\h:\W$ "

if [[ `uname` == 'Linux' ]]; then
	a sd='du --max-depth=1 -h | sort -rh'
	export LS_OPTIONS='--color=auto'
	a ll='ls $LS_OPTIONS -lh'
	a la='ls $LS_OPTIONS -Alh'
	a lh='ls $LS_OPTIONS -ldh .*'
	a apache='sudo /etc/init.d/apache2'
  a nginx='sudo service nginx'
  a update='sudo apt-get update'
  a upgrade='sudo apt-get upgrade --show-upgraded'
  a www='cd /srv/www/'
elif [[ `uname` == 'Darwin' ]]; then
  echo "THIS IS OSX"
	a cddesk='cd ~/Desktop'
	a cddown='cd ~/Downloads'
	a cddrop='cd ~/Dropbox'
	a cdsite='cd ~/Sites'
	
	a la='ls -alh -G'
	a lh='ls -ld .*'
	a ll='ls -lh -G'
	a apache='sudo /usr/sbin/apachectl'
  a nginx='sudo nginx'

	PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
  PATH=/usr/local/heroku/bin:$PATH
  PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
	export PATH

  source ~/.rvm/scripts/rvm
fi

