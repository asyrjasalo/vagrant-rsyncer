# vagrant syncer

A Vagrant plugin that is an optimized implementation of [Vagrant rsync(-auto)](https://github.com/mitchellh/vagrant/tree/b721eb62cfbfa93895d0d4cf019436ab6b1df05d/plugins/synced_folders/rsync),
based heavily on [vagrant-gatling-rsync](https://github.com/smerrill/vagrant-gatling-rsync)'s
great listener implementations for watching large hierarchies.


Vagrant syncer forks [Vagrant's RsyncHelper](https://github.com/mitchellh/vagrant/blob/b721eb62cfbfa93895d0d4cf019436ab6b1df05d/plugins/synced_folders/rsync/helper.rb)
to make it (c)leaner, instead of using the class like [vagrant-gatling-rsync](https://github.com/smerrill/vagrant-gatling-rsync) does.

If the optimizations seem to work in heavy use, I'll see if (some of) them
can be merged to Vagrant core and be submitted as pull requests to
[the official Vagrant repo](https://github.com/mitchellh/vagrant).


## Installation

    vagrant plugin install vagrant-syncer


## Configuration

All the [rsync synced folder settings](https://docs.vagrantup.com/v2/synced-folders/rsync.html) are supported.
They also have the same default values.

See [Vagrantfile](https://github.com/asyrjasalo/vagrant-syncer/blob/master/example/Vagrantfile)
for additional plugin specific ```config.syncer``` settings.


## Usage

    vagrant syncer


## Detailed list of improvements over rsync(-auto)

To be written.


## Development

Clone this repository and install Ruby 2.2.3, using e.g. [rbenv](https://github.com/sstephenson/rbenv).

    cd vagrant-syncer
    rbenv install $(cat .ruby-version)
    gem install bundler -v1.10.5
    bundle install

Then use it with:

    bundle exec vagrant syncer

Or outside the bundle:

    ./build_and_install.sh
    vagrant syncer


## Thanks

Hashicorp for [Vagrant](https://github.com/mitchellh/vagrant), even though
its future will be overshadowed by [Otto](https://github.com/hashicorp/otto).

[vagrant-gatling-rsync](https://github.com/smerrill/vagrant-gatling-rsync) for more suitable listener
implementations for large file hierarchies.

[rb-fsevent](https://github.com/thibaudgg/rb-fsevent) for FSEvents API access on OS/X.

[rb-inotify](https://github.com/nex3/rb-inotify) for inotify API access on GNU/Linux.

[Listen](https://github.com/guard/listen) for OS independent watcher API.
