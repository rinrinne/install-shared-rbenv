#!/bin/sh

RBENV_ROOT=/usr/local/rbenv

if [ -d $RBENV_ROOT ]; then
  export RBENV_ROOT
  PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)"
fi
