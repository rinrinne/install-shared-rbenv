if [ -d /usr/local/rbenv ]; then
  PATH="/usr/local/rbenv:$PATH"
  eval "$(rbenv init -)"
fi
