# Oracle Linux 7 x86_64 Base Box for Vagrant

* Project: [VagrantBoxes@GitHub](https://github.com/terrywang/vagrantboxes)
* Download: [Oracle Linux 7.0 x86_64 Vagrant Base Box](http://cloud.terry.im/vagrant/oraclelinux-7-x86_64.box)
* SHA256: `bdbd7fc6e1e61d27265f8e1a1509a3ddaa7c14d280181e5f8f28721c7a583783`

This is a minimal base box built for [Vagrant](http://www.vagrantup.com/). Initially created using VirtualBox 4.3.14 on Linux x86_64, guest additions installed, packaged using Vagrant 1.6.3.

> **NOTE**: This Oracle Linux 7.0 base box can be updated to latest **7.x** minor releases once it is made available via Oracle's Public YUM Server. You also get package updates and errata for free. For example, once Oracle Linux 7.1 is made available, just run `yum update -y` and stay sharp. Enjoy!

## Vagrant Base Box Information

1. Release: `Oracle Linux 7.0 x86_64`
2. Kernels: UEK R3  => `3.8.13-35.3.1.el7uek.x86_64`, Red Hat Compatible Kernel => `3.10.0-123.4.4.el7.x86_64`
2. VirtualBox Guest Additions 4.3.14 installed
3. Default target `multiuser.target`, `/etc/inittab` is no longer used due to the switch to `systemd`.
4. **Public YUM** and **EPEL** configured, system up-to-date (**packages** and **errata**) as of 25 July, 2014 (UTC+10). Simply run `yum update -y` as `root` to stay updated.
5. Users and passwords
    * `root` / `vagrant`
    * `vagrant` / `vagrant` Public Key authentication configured for vagrant, password-less sudo
6. File Systems Layout
    * Virtual Hard Disk Capacity 20GB, Dynamically allocated
    * `/dev/sda1` => `/boot` `ext4` 500M
    * `/dev/sda2` => LVM Physical Volume
    * `/dev/linux/root` => `/` `xfs` 15GB
    * `/dev/linux/home` => `/home` `ext4` 3.8GB
    * No swap partition (LV) or swap file is configured
    * reserved blocks percentage: `/boot` => 0%, `/home` => 0%
    * `btrfs` support, `btrfs-progs` tools installed
    * In case more storage space is needed, create a new hard disk using `VBoxManage createhd`, attach it using `VBoxManage storageattach`. Then create a physical volume using the new HDD, add it to existing volume group, either grow existing logical volumes or create new ones, as you wish.
7. Networking Mode - NAT
    * Port forwarding configured for NAT => `VBoxManage modifyvm "oracle70" --natpf1 "guestssh,tcp,,2222,,22"`
    * Hostname => `oraclelinux7.vagrantup.com`
8. Extra packages installed
    * tmux (`~vagrant/.tmux.conf` based on [Gist](https://gist.github.com/terrywang/3950393))
    * vim (with `Vundle.vim`, see `~/.vimrc`)
    * gdb, strace, crash
    * git, tig 
    * rsync
    * htop
    * pv, tree, psmisc
    * wget, curl, gawk, ack
    * colordiff
    * zsh (with `prezto`)
    * bash-completion
    * net-tools, bind-utils, ethtool, iptraf, iftop, nmap
    * conntrack, iptstate
    * lshw, pciutils, usbutils
    * reptyr, ntsysv, yum-utils
    * sl
    * screenfetch (shell script)
9. Services
    * sshd.service (enabled)
    * firewalld.service (disabled)
    * kdump.service (disabled)
    * postfix.service (disabled)
    * rhnsd (off)
10. SELinux is disabled. To re-enable it, edit `/etc/selinux/config` and reboot

## Basic Software
* `rbenv` installed in `~vagrant/.rbenv`
* `ruby` 2.1.2 installed using `ruby-build`
* `chef` 11.12.8 installed
* Puppet YUM repository configured and enabled. To install puppet master run `yum install puppet-server`, to install puppet on agent nodes run `yum install puppet`, to configure, check [Configuring Puppet](http://docs.puppetlabs.com/guides/configuring.html)
* Other gems => `bundler`, `rbenv-rehash`, `ruby-shadow`

## Getting started

Download the base box and get the box started

```bash
$ vagrant box add oraclelinux-7.0-x86_64 ADDRESS
$ mkdir test_environment
$ cd test_environment
$ vagrant init oraclelinux-7.0-x86_64
$ vagrant up
$ vagrant ssh
```

## Reference

[Vagrant - Getting Started Guide](http://docs.vagrantup.com/v2/getting-started/)

[A List of base boxes for Vagrant](http://vagrantbox.es/)
