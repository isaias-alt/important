alias ll='ls -la'

alias gs='git status'

alias gp='git push'

alias gpo='git push origin'

alias gca='git commit --amend'

alias gaa='git add .'

alias gpl='git pull'

gc() {
  git commit -m "$1"
}

ga() {
  git add "$1"
}

gcl() {
  git clone "$1"
}
