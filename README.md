Shared rbenv installer
===========================

* Author: rinrinne
* Repository: https://github.com/rinrinne/install-shared-rbenv

This script installs [rbenv][1] and [ruby-build][2] then build ruby. Those are stored into shared directory. All user can use them with a bit setting.

[1]: https://github.com/sstephenson/rbenv
[2]: https://github.com/sstephenson/ruby-build

Install packages
---------------------------

You need to install some libraries and commands for ruby-build. The below is package list for Ubuntu.

    build-essential libncurses-dev libgdbm-dev libyaml-dev
    tk-dev libreadline-dev zlib1g-dev libssl-dev libffi-dev
    libssl1.0.0 git-core curl

Setup variables
---------------------------

You can use the below environment variables.

<dl>
  <dt>RBENV_ROOT</dt>
  <dd>Install path for rbenv (default: /usr/local/rbenv)</dd>
  <dt>RBENV_VERSION</dt>
  <dd>Ruby version you want to install (default: 1.9.3-p385)</dd>
</dl>

If you store them into `.install` in current directory, This script reads it.

Install shared rbenv
---------------------------

```
$ ./install-shared-rbenv
```

If you want to install into system directory, this should be run as root.


Use shared rbenv
---------------------------

Without user setting
```
$ sudo cat dot.profile > /etc/profile.d/Z99-rbenv.sh
```

Or setup by each users
```
$ cat dot.profile >> $HOME/.profile
```

In addition, rbenv wrapper named `shared-rbenv` is generated into current directory. You can use it if you want to run rbenv itself.

```
$ ./shared-rbenv
```

You can move `shared-rbenv` to any directory then run it.

Use shared rbenv without profile setting
---------------------------

```
$ RBENV_ROOT=/path/to/rbenv RBENV_VERSION=your-ruby-version; $RBENV_ROOT/bin/rbenv exec ruby SCRIPTFILE
```

* If you export `RBENV_ROOT` and `RBENV_VERSION`, you can remove them from commnad line.
* If you set default version using `rbenv global`, The above command line can be run without `RBENV_VERSION`.

```
$ RBENV_ROOT=/path/to/rbenv RBENV_VERSION=your-ruby-version; $RBENV_ROOT/bin/rbenv global $RBENV_VERSION
```

Or, run with `shared-rbenv`

```
$ ./shared-rbenv exec ruby SCRIPTFILE
```

Use gem
---------------------------

bundle is already installed into shared ruby. So you can use gem via bundle.

If you don't use any profile settings, bundle can be run with the below command.

```
$ RBENV_ROOT=/path/to/rbenv RBENV_VERSION=your-ruby-version; $RBENV_ROOT/bin/rbenv exec bundle
```

Or run with `shared-rbenv`

```
$ ./shared-rbenv exec bundle
```

Update rbenv or install another ruby version
---------------------------

Same as install.

If `RBENV_ROOT` is already exist as directory, `install-shared-rbenv` will update rbenv and plugins then install ruby with `RBENV_VERSION`.

FAQ
---------------------------

## What ruby version is available?

At first, you should install once by default. Then you can run the below command to get available ruby versons.

```
$ ./shared-rbenv install -l
```

LICENSE
---------------------------

MIT License.


Copyright
---------------------------

Copyright (c) 2013 rinrinne a.k.a. rin_ne
