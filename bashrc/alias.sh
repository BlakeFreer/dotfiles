alias explorer="dolphin ."
alias ven="source .venv/bin/activate"

# Git
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gfp="git fetch --prune"
alias gca="git commit --amend"

# Go to the root of a git directory
function cdi() {
	cd `git rev-parse --show-toplevel`
}

function rg() {
	/usr/bin/rg "$@" --json | delta
}

# hledger
alias hl="hledger"
alias hla="hledger add"
