What is?
===========================

This script installs rbenv then build ruby. Those are stored into shared directory. All user can use them with a bit setting.

Install packages
===========================

You need to install some libraries and commands for ruby-build. The below is package list for Ubuntu.

    build-essential libncurses-dev libgdbm-dev libyaml-dev
    tk-dev libreadline-dev zlib1g-dev libssl-dev libffi-dev
    libssl1.0.0 git-core curl

Setup variables
===========================

You can use the below environment variables.

<dl>
  <dt>RBENV_ROOT</dt>
  <dd>Install path for rbenv (default: /usr/local/bin/rbenv)</dd>
  <dt>RBENV_VERSION</dt>
  <dd>Ruby version you want to install (default: 1.9.3-p327)</dd>
</dl>

Install shared rbenv
===========================

```
$ ./install-shared-rbenv.sh
```

If you want to install into system directory, this should be run as root.


Use shared rbenv
===========================

Without user setting
```
$ sudo cat dot.profile > /etc/profile.d/Z99-rbenv.sh
```

Or setup by each users
```
$ cat dot.profile >> $HOME/.profile
```

Use shared rbenv without profile setting
============================

```
$ RBENV_ROOT=/path/to/rbenv RBENV_VERSION=your-ruby-version; $RBENV_ROOT/bin/rbenv exec ruby SCRIPTFILE
```

* If you export RBENV_ROOT and RBENV_VERSION, you can remove them from commnad line.
* If you set default version using `rbenv global`, The above command line can be run without RBENV_VERSION.

```
$ RBENV_ROOT=/path/to/rbenv RBENV_VERSION=your-ruby-version; $RBENV_ROOT/bin/rbenv global $RBENV_VERSION
```

Use gem
===========================

bundle is already installed into shared ruby. So you can use gem via bundle.

If you don't use any profile settings, bundle can be run with the below command.

```
$ RBENV_ROOT=/path/to/rbenv RBENV_VERSION=your-ruby-version; $RBENV_ROOT/bin/rbenv exec bundle
```
