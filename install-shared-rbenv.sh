#!/bin/sh

set -e

[ `id -u` = 0 ] || (echo This script should be run as root; exit 1)
[ -x /usr/bin/lsb_release ] || (echo This script should be run on Ubuntu; exit 1)

[ ! -z $RBENV_ROOT ] || RBENV_ROOT=/usr/local/rbenv

# install packages
apt-get install build-essential libncurses-dev libgdbm-dev libyaml-dev tk-dev libreadline-dev zlib1g-dev libssl-dev libffi-dev libssl1.0.0 git-core curl

mkdir -p $RBENV_ROOT
cd $RBENV_ROOT

git clone https://github.com/sstephenson/rbenv.git .
mkdir -p plugins
git clone https://github.com/sstephenson/ruby-build.git plugins/ruby-build

export RBENV_ROOT
$RBENV_ROOT/bin/rbenv install 1.9.3-p327
$RBENV_ROOT/bin/rbenv rehash
$RBENV_ROOT/bin/rbenv global 1.9.3-p327

$RBENV_ROOT/bin/rbenv exec gem install bundler
