# Oracle Linux 6.3 x86_64 box for Vagrant

* Project: [Vagrant](https://github.com/terrywang/vagrant)
* Download: [Oracle Linux 6.3 x86_64 base box](https://www.dropbox.com/s/zejz4yljiexqcfu/oracle64.box)

This is a minimal base box for vagrantbox.es project. Created using VirtualBox 4.2.6 on Ubuntu 12.04, guest additions installed.

## Vagrant Base Box Information

1. Release: `Oracle Linux 6.3 x86_64`, Kernel UEK2 => `2.6.39-300.26.1.el6uek.x86_64`
2. VirtualBox Guest Additions 4.2.6 installed
3. Default run level 3 => `id:3:initdefault:`
4. Public YUM configured, system up-to-date (**packages** and **errata**) as of Feb 1, 2013. To update, simpley run `yum update` as `root`.
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
10. SELinux disabled, to re-enable, edit `/etc/selinux/config`.
11. Prepare to install Oracle Database 11gR2, the `oracle-rdbms-server-11gR2-preinstall` package installs all dependencies and configure the system to meet all requirements with 1 step
    * Install Oracle RDBMS Pre-Install RPM => `yum install oracle-rdbms-server-11gR2-preinstall`
    * Refer to [How I Simplified Oracle Database 11g Installation on Oracle Linux 6](http://www.oracle.com/technetwork/articles/servers-storage-admin/ginnydbinstallonlinux6-1845247.html)
    * Download Oracle Database 11gR2 install media and get your hands dirty on Oracle Database.
    * **NOTE**: The Pre-Install RPM installs X11 client libraries but **NOT** X Window System server packages.
    * To run GUI, enable ssh X11 Forwarding by using either `ssh -X vagrant@localhost -p 2222` (input vagrant user password) or `ssh -X -i /path/to/vagrant vagrant@localhost -p 2222` for public key authentication. Private key **vagrant** is avalable [here](https://raw.github.com/mitchellh/vagrant/master/keys/vagrant).

## Basic Software
* `rbenv` installed in `~vagrant/.rbenv`
* Ruby 1.9.3-p374 installed using `ruby-build`
* `chef` gem installed
* Other gems => `bundler`, `rbenv-rehash`

## Getting started

Download the base box and get started

```
$ vagrant box add oracle64 https://dl.dropbox.com/s/zejz4yljiexqcfu/oracle64.box
$ vagrant init oracle64
$ vagrant up
```

## Reference

[Vagrant - Getting Started Guide](http://docs.vagrantup.com/v1/docs/getting-started/index.html)

[A List of base boxes for Vagrant](http://vagrantbox.es/)
