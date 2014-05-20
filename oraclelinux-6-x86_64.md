# Oracle Linux 6 x86_64 Base Box for Vagrant

* Project: [VagrantBoxes@GitHub](https://github.com/terrywang/vagrantboxes)
* Download: [Oracle Linux 6.5 x86_64 Vagrant Base Box](http://cloud.terry.im/vagrant/oraclelinux-6-x86_64.box)
* SHA256: `44d7ca7156686eb493c3a58ad9117d454ef39ecb72ca845079dca7d94d07f518`

This is a minimal base box built for [Vagrant](http://www.vagrantup.com/). Initially created using VirtualBox 4.3.4 (now 4.3.12) on Ubuntu 12.04 x86_64, guest additions installed, packaged using Vagrant 1.6.2 (initially 1.0.6).

> **NOTE**: This Oracle Linux 6.5 base box can be updated to latest **6.x** minor releases once it is made available via Oracle's Public YUM Server. You also get package updates and errata for free. For example, once Oracle Linux 6.6 is made available, just run `yum update -y` and stay sharp. Enjoy!

## Vagrant Base Box Information

1. Release: `Oracle Linux 6.5 x86_64`
2. Kernels: UEKR3 => `3.8.13-35.el6uek.x86_64`, Red Hat Compatible Kernel => `2.6.32-431.17.1.el6.x86_64` 
2. VirtualBox Guest Additions 4.3.12 installed
3. Default run level 3 => `id:3:initdefault:`
4. **Public YUM** and **EPEL** configured, system up-to-date (**packages** and **errata**) as of 20 May, 2014 (UTC+10). Simply run `yum update -y` as `root` to stay updated.
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
7. Networking Mode - NAT
    * Port forwarding configured for NAT => `VBoxManage modifyvm "oracle64" --natpf1 "guestssh,tcp,,2222,,22"`
    * Hostname => `oracle.vagrantup.com`
8. Extra packages installed
    * tmux (`~vagrant/.tmux.conf` based on [Gist](https://gist.github.com/terrywang/3950393))
    * vim (with Vundle.vim, see `~/.vimrc`)
    * gdb
    * strace
    * git
    * rsync
    * htop
    * pv
    * ack
    * colordiff
    * bash-completion
    * sl
    * cowsay
    * linux_logo (compiled from source)
    * screenfetch (shell script)
9. Services
    * sshd (on)
    * iptables (off)
    * ip6tables (off)
10. SELinux is disabled, to re-enable, edit `/etc/selinux/config` and reboot
11. To install Oracle Database 11gR2 or 12c, the `oracle-rdbms-server-11gR2-preinstall` or `oracle-rdbms-server-12cR1-preinstall` package installs all dependencies and configure the system to meet all requirements with **one simple step**
    * Install Oracle RDBMS Pre-Install RPM => `yum install oracle-rdbms-server-11gR2-preinstall` for **11gR2**, `yum install oracle-rdbms-server-12cR1-preinstall` for **12cR1**
    * Refer to [How I Simplified Oracle Database 11g Installation on Oracle Linux 6](http://www.oracle.com/technetwork/articles/servers-storage-admin/ginnydbinstallonlinux6-1845247.html)
    * Download Oracle Database and Fusion Middleware (e.g. WebLogic Server) installers and get your hands dirty ;-)
    * **NOTE**: The Pre-Install RPM installs X11 client libraries but **NOT** X Window System server packages.
    * To use GUI, enable ssh X11 Forwarding by using `ssh -X vagrant@localhost -p 2222` (input vagrant user password) or `ssh -X -i /path/to/vagrant vagrant@localhost -p 2222` for public key authentication. Private key **vagrant** is available [here](https://raw.github.com/mitchellh/vagrant/master/keys/vagrant).
    * In case trusted X11 forwardings are required, use `ssh -Y vagrant@localhost -p 2222` instead of `ssh -X vagrant@localhost -p 2222`.

## Basic Software
* `rbenv` installed in `~vagrant/.rbenv`
* `ruby 2.1.2` installed using `ruby-build`
* `chef` 11.12.4 installed
* Puppet YUM repository configured and enabled. To install puppet master run `yum install puppet-server`, to install puppet on agent nodes run `yum install puppet`, to configure, check [Configuring Puppet](http://docs.puppetlabs.com/guides/configuring.html)
* Other gems => `bundler`, `rbenv-rehash`, `ruby-shadow`

## Getting started

Download the base box and get the box started

```bash
$ vagrant box add oraclelinux-6.5-x86_64 ADDRESS
$ mkdir test_environment
$ cd test_environment
$ vagrant init oraclelinux-6.5-x86_64
$ vagrant up
$ vagrant ssh
```

## Reference

[Vagrant - Getting Started Guide](http://docs.vagrantup.com/v2/getting-started/)

[A List of base boxes for Vagrant](http://vagrantbox.es/)
