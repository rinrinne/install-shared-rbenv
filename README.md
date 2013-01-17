How to install shared rbenv
===========================

```
$ sudo install-shared-rbenv.sh
```

How to use shared rbenv
===========================

Use without user setting
```
$ sudo mv dot.profile /etc/profile.d/Z99-rbenv.sh
```

Or setup by each users
```
$ cat dot.profile | sed -e 's/^#.*//' >> $HOME/.profile
```

How to use gem
===========================

bundle is already installed into shared ruby. So you can use gem via bundle.

If you want to update bundle, please do the below operation.

```
$ sudo env RBENV_ROOT=/usr/local/rbenv /usr/local/rbenv/bin/rbenv exec gem update
```

How to call ruby from system
==========================

System - no profile, no *rbenv init*


```
$ export RBENV_ROOT=/usr/local/rbenv
$ $RBENV_ROOT/bin/rbenv exec ruby SCRIPTFILE
```
