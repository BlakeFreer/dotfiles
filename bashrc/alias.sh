alias explorer="dolphin ."
alias ven="source .venv/bin/activate"

# Git
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gfp="git fetch --prune"

# Go to the root of a git directory
function cdi() {
	cd `git rev-parse --show-toplevel`
}

function rg() {
	/usr/bin/rg $1 --json | delta
}
