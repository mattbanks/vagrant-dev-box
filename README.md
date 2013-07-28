# Vagrant PHP/WordPress Development Box

Created with [PuPHPet](https://puphpet.com/). Sets up a nice LAMP development box for PHP/WordPress, with Composer, NodeJS, Grunt, Yeoman, and Bower.

## Includes:

* Apache
* MySQL
* PHP 5.4
* PHPMyAdmin
* XDebug
* NodeJS
* Grunt
* Yeoman
* Bower
* Compass Ruby Gem
* WP-CLI (via [Ryan McCue's puppet-wp module](https://github.com/rmccue/puppet-wp))
* Composer

## Installation / Usage

First, install [Vagrant](http://downloads.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/).

Copy the contents of this archive to a new folder and run `vagrant up`

The `/var/www` folder in the box is synced with `~/Sites`. You can edit the `Vagrantfile` to change this location for your own needs.

SSH into the box with `vagrant ssh` to run whatever is needed.

MySQL root password setup as `root` to keep it simple.

The box is setup with IP `192.168.56.101`. Point your browser there or setup your host file to point to `local.whatup`, which is configured as a vhost here.


