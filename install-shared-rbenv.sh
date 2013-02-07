#!/bin/sh

set -e

CURRENT=`pwd`

[ ! -z $RBENV_ROOT ] || RBENV_ROOT=/usr/local/rbenv
[ ! -z $RBENV_VERSION ] || RBENV_VERSION=1.9.3-p385

if [ -d $RBENV_ROOT ]; then
  cd $RBENV_ROOT
  git pull
  cd plugins/ruby-build
  git pull
else
  mkdir -p $RBENV_ROOT
  cd $RBENV_ROOT

  git clone https://github.com/sstephenson/rbenv.git .
  mkdir -p plugins
  git clone https://github.com/sstephenson/ruby-build.git plugins/ruby-build
fi

cd $CURRENT
export RBENV_ROOT
export RBENV_VERSION

$RBENV_ROOT/bin/rbenv install $RBENV_VERSION
$RBENV_ROOT/bin/rbenv rehash

$RBENV_ROOT/bin/rbenv exec gem install bundler

cat dot.profile.sample | sed -e "s!__RBENV_ROOT__!$RBENV_ROOT!" > dot.profile
cat shared-rbenv.sample | sed -e "s!__RBENV_ROOT__!$RBENV_ROOT!" | \
  sed -e "s!__RBENV_VERSION__!$RBENV_VERSION!" > shared-rbenv
chmod a+x shared-rbenv
