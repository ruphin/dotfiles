# chrome alias
alias chrome='google-chrome'

# alias git log
alias gitlog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# code search alias
alias cs='grep -inIEr --color=ALWAYS'

function gogo() {
	repo=$(git remote -v | grep origin | grep '(fetch)' | awk '{print $2}' | sed -e 's/git@//g' -e 's/\.git//g' -e 's/:/\//g')
	basedir=$(echo $repo | sed -e 's/\/[^\/]*$//g')
	project=$(echo $repo | sed -e 's/.*\/\([^\/]*\)$/\1/')
	mkdir -p ~/.gopaths/$project/src/$basedir
	ln -fs $PWD ~/.gopaths/$project/src/$basedir/$project
	export GOPATH="$(readlink -f ~)/.gopaths/$project"
	export PATH=$PATH:$GOPATH/bin
}

# docker aliases
alias dps='docker ps'
alias dpsa='docker ps -a'

function dex {
  if [ -z "$2" ]; then
    PROGRAM=bash
  else
    PROGRAM=$2
  fi
  docker exec -t -i $1 $PROGRAM
}
