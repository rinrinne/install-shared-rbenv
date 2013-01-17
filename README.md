How to install shared rbenv
===========================

```
$ sudo install-shared-rbenv.sh
```

How to use shared rbenv
===========================

Use without user setting
---------------------------

please move dot.profile to /etc/profile.d/Z99-rbenv.sh.

Setup by each users
---------------------------

user can append dot.profile to $HOME/.profile.

How to call ruby in system
==========================

```
$ export RBENV_ROOT=/usr/local/rbenv
$ $RBENV_ROOT/bin/rbenv exec ruby SCRIPTFILE
```
