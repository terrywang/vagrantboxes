# Oracle Linux 6 x86_64 Base Box for Vagrant

* Project: [Vagrant](https://github.com/terrywang/vagrant)
* Download: [Oracle Linux 6 x86_64 Vagrant Base Box](https://www.dropbox.com/s/zmitpteca72sjpx/oracle64.box)
* Direct URL: [https://dl.dropbox.com/s/zmitpteca72sjpx/oracle64.box](https://dl.dropbox.com/s/zmitpteca72sjpx/oracle64.box)

This is a minimal base box built for [Vagrant](http://www.vagrantup.com/). Created using VirtualBox 4.2.6 on Ubuntu 12.04 x86_64, guest additions installed, packaged using Vagrant 1.0.6.

> **NOTE**: This Oracle Linux 6.3 base box can be updated to latest **6.x** minor release once it is made available, by using Oracle's Public YUM Server. You also get package updates and errata for free. For instance, once Oracle Linux 6.4 is made available, just run `yum update -y` to update the base box to 6.4. Enjoy.

## Vagrant Base Box Information

1. Release: `Oracle Linux 6.3 x86_64`, Kernel UEK2 => `2.6.39-300.28.1.el6uek.x86_64`
2. VirtualBox Guest Additions 4.2.6 installed
3. Default run level 3 => `id:3:initdefault:`
4. Public YUM configured, system up-to-date (**packages** and **errata**) as of Feb 8, 2013. To keep it updated, simpley run `yum update` as `root`.
5. Users and passwords
    * `root` / `vagrant`
    * `vagrant` / `vagrant` Public Key authentication configured for vagrant, password-less sudo
6. File Systems Layout
    * Virtual Hard Disk Capacity 20GB, Dynamically allocated
    * `/dev/sda1` => `/boot` `ext4` 300M
    * `/dev/sda2` => LVM Physical Volume
    * `/dev/linux/root` => `/` `ext4` 15GB
    * `/dev/linux/home` => `/home` `ext4` 4.2GB
    * `/dev/linux/swap` => `swap` 512MB
    * reserved blocks percentage: `/` => 0.1%, `/home` => 0%
    * `btrfs` support, `btrfs-progs` tools installed
    * In case more storage space is needed, create a new hard disk using `VBoxManage createhd`, attach it using `VBoxManage storageattach`. Then create a physical volume using the new HDD, add it to existing volume group, either grow existing logical volumes or create new ones, as you wish.
7. Network NAT
    * Port forwarding configured for NAT => `VBoxManage modifyvm "oracle64" --natpf1 "guestssh,tcp,,2222,,22"`
    * Hostname => `oracle.vagrantup.com`
8. Extra packages added (EPEL repositories disabled)
    * htop
    * colordiff
    * tmux (~vagrant/.tmux.conf)
    * pv
    * bash-completion
    * sl
    * cowsay
    * linux_logo (compiled from source)
    * screenfetch
9. Services
    * sshd (on)
    * iptables (off)
    * ip6tables (off)
10. SELinux disabled, to re-enable, edit `/etc/selinux/config` and reboot
11. Prepare to install Oracle Database 11gR2, the `oracle-rdbms-server-11gR2-preinstall` package installs all dependencies and configure the system to meet all requirements with 1 step
    * Install Oracle RDBMS Pre-Install RPM => `yum install oracle-rdbms-server-11gR2-preinstall`
    * Refer to [How I Simplified Oracle Database 11g Installation on Oracle Linux 6](http://www.oracle.com/technetwork/articles/servers-storage-admin/ginnydbinstallonlinux6-1845247.html)
    * Download Oracle Database and Fusion Middleware (e.g. WebLogic Server) installers and get your hands dirty on Oracle Database and Fusion Middleware.
    * **NOTE**: The Pre-Install RPM installs X11 client libraries but **NOT** X Window System server packages.
    * To run GUI, enable ssh X11 Forwarding by using either `ssh -X vagrant@localhost -p 2222` (input vagrant user password) or `ssh -X -i /path/to/vagrant vagrant@localhost -p 2222` for public key authentication. Private key **vagrant** is avalable [here](https://raw.github.com/mitchellh/vagrant/master/keys/vagrant).

## Basic Software
* `rbenv` installed in `~vagrant/.rbenv`
* ruby 1.9.3-p392 installed using`ruby-build`
* `chef` 11.4.0 installed
* Other gems => `bundler`, `rbenv-rehash`, `ruby-shadow`

## Getting started

Download the base box and get the box started

```
$ vagrant box add oracle64 https://www.dropbox.com/s/zmitpteca72sjpx/oracle64.box
$ mkdir test_environment
$ cd test_environment
$ vagrant init oracle64
$ vagrant up
$ vagrant ssh
```

## Reference

[Vagrant - Getting Started Guide](http://docs.vagrantup.com/v1/docs/getting-started/index.html)

[A List of base boxes for Vagrant](http://vagrantbox.es/)