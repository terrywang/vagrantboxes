# Oracle Linux 5 x86_64 Base Box for Vagrant

* Project: [VagrantBoxes@GitHub](https://github.com/terrywang/vagrantboxes)
* Download: [Oracle Linux 5.10 x86_64 Vagrant Base Box](http://cloud.terry.im/vagrant/oraclelinux-5-x86_64.box)
* SHA256: `c15529b843a33eb198cf240c49865312fbef9f01460719ffdd18a47be2ae00b4`

This is a minimal base box built for [Vagrant](http://www.vagrantup.com/). Initially created using VirtualBox 4.2.16 (now 4.3.4) on Ubuntu 12.04 x86_64, guest additions installed, packaged using Vagrant 1.2.2 (now 1.3.5).

> **NOTE**: This Oracle Linux 5.10 base box can be updated to latest **5.x** minor releases (if there still is) once it is made available via Oracle's Public YUM Server. You also get package updates and errata for free.

## Vagrant Base Box Information

1. Release: `Oracle Linux 5.10 x86_64`
2. Kernels: UEK2 => `2.6.39-400.211.2.el5uek`, Red Hat Compatible Kernel => `2.6.18-371.3.1.0.1.el5` 
3. VirtualBox Guest Additions 4.3.4 installed
4. Default run level 3 => `id:3:initdefault:`
5. **Public YUM** and **EPEL** configured, system up-to-date (**packages** and **errata**) as of 7 December, 2013. Simply run `yum update -y` as `root` to stay updated.
6. Users and passwords
    * `root` / `vagrant`
    * `vagrant` / `vagrant` Public Key authentication configured for vagrant, password-less sudo
7. File Systems Layout
    * Virtual Hard Disk Capacity 20GB, Dynamically allocated
    * `/dev/sda1` => `/boot` `ext3` 300M
    * `/dev/sda2` => LVM Physical Volume
    * `/dev/linux/root` => `/` `ext3` 15GB
    * `/dev/linux/home` => `/home` `ext4` 4.1GB
    * `/dev/linux/swap` => `swap` 512MB
    * reserved blocks percentage: `/` => 0.1%, `/home` => 0%
    * In case more storage space is needed, create a new hard disk using `VBoxManage createhd`, attach it using `VBoxManage storageattach`. Then create a physical volume using the new HDD, add it to existing volume group, either grow existing logical volumes or create new ones, as you wish.
8. Networking Mode - NAT
    * Port forwarding configured for NAT => `VBoxManage modifyvm "oracle64" --natpf1 "guestssh,tcp,,2222,,22"`
    * Hostname => `oracle.vagrantup.com`
9. Extra packages installed
    * tmux (`~vagrant/.tmux.conf` based on [Gist](https://gist.github.com/terrywang/3950393))
    * vim (`~/vimrc`)
    * gdb
    * strace
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
10. Services
    * sshd (on)
    * iptables (off)
    * ip6tables (off)
11. SELinux is disabled, to re-enable, edit `/etc/selinux/config` and reboot
12. Prepare to install Oracle Database 10g or 11g, the `oracle-validated` package installs all dependencies and configure the system to meet all requirements with one simple step
    * Install oracle-validated RPM => `yum install oracle-validated`
    * Refer to [How I Simplified Oracle Database Installation on Oracle Linux](http://www.oracle.com/technetwork/articles/servers-storage-admin/ginnydbinstallonlinux-488779.html)
    * Download Oracle Database and Fusion Middleware (e.g. WebLogic Server) installers and get your hands dirty ;-)
    * **NOTE**: The `oracle-validated` RPM installs X11 client libraries but **NOT** X Window System server packages.
    * To use GUI, run ssh X11 Forwarding by using either `ssh -X vagrant@localhost -p 2222` (input vagrant user password) or `ssh -X -i /path/to/vagrant vagrant@localhost -p 2222` for public key authentication. Private key **vagrant** is available [here](https://raw.github.com/mitchellh/vagrant/master/keys/vagrant).
    * In case trusted X11 forwardings are required, use `ssh -Y vagrant@localhost -p 2222` instead of `ssh -X vagrant@localhost -p 2222`.

## Basic Software
* `rbenv` installed in `~vagrant/.rbenv`
* `ruby 1.9.3-p484` installed using `ruby-build`
* `chef` 11.8.2 installed
* Puppet YUM repository configured and enabled. To install puppet master run `yum install puppet-server`, to install puppet on agent nodes run `yum install puppet`, to configure, check [Configuring Puppet](http://docs.puppetlabs.com/guides/configuring.html)
* Other gems => `bundler`, `rbenv-rehash`, `ruby-shadow`

## Getting started

Download the base box and get the box started

```bash
$ vagrant box add oraclelinux-5.10-x86_64 ADDRESS
$ mkdir test_environment
$ cd test_environment
$ vagrant init oraclelinux-5.10-x86_64
$ vagrant up
$ vagrant ssh
```

## Reference

[Vagrant - Getting Started Guide](http://docs.vagrantup.com/v2/getting-started/)

[A List of base boxes for Vagrant](http://vagrantbox.es/)
