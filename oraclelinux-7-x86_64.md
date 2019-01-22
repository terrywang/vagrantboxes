# Oracle Linux 7 x86_64 Base Box for Vagrant

* Project: [VagrantBoxes@GitHub](https://github.com/terrywang/vagrantboxes)
* Use this box with Vagrant: `vagrant init terrywang/oraclelinux-7-x86_64 && vagrant up`
* Alternative (Direct Download): [Oracle Linux 7.6 x86_64 Vagrant Base Box](http://cloud.terry.im/vagrant/oraclelinux-7-x86_64.box)
* SHA256: `44ba249926588c81ca626ae4e06d080e29ac91d32a6b892e539e29379b363f5c`

This is a minimal base box built for [Vagrant](http://www.vagrantup.com/). Initially created using VirtualBox 4.3.24 (now 6.0.2) on Linux x86_64, guest additions installed, packaged using Vagrant 2.2.3.

> **NOTE**: This Oracle Linux 7.6 base box can be updated to latest **7.x** minor releases once it is made available via Oracle's Public YUM Server. You also get package updates and errata for free. For example, once Oracle Linux 7.7 is made available, just run `yum update -y` and stay sharp. Enjoy!

## Vagrant Base Box Information

1. Release: `Oracle Linux 7.6 x86_64`
2. Kernels: UEK R5  => `kernel-uek-4.14.35-1844.1.3.el7uek.x86_64`, Red Hat Compatible Kernel => `3.10.0-957.1.3.el7.x86_64`
2. VirtualBox Guest Additions 6.0.2 installed
3. Default boot target => `multi-user.target`, `/etc/inittab` is **NO LONGER** used due to the switch to `systemd`.
4. **Public YUM** and **EPEL** configured, system up-to-date (**packages** and **errata**) as of 22 January, 2019 (UTC+11). Simply run `yum update -y` as `root` to stay updated.
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
7. Networking
    * Networking mode - NAT
    * Port forwarding configured for NAT => `VBoxManage modifyvm "oracle7" --natpf1 "guestssh,tcp,,2222,,22"`
    * Hostname => `oraclelinux7.vagrantup.com`
    * For people who prefer the old NIC naming scheme (`ethX` instead of more predictable enpXsY), pass `net.ifnames=0` as kernel boot parameter to revert to old style.
8. Extra packages installed
    * `tmux` (`~vagrant/.tmux.conf` based on [Gist](https://gist.github.com/terrywang/3950393))
    * `vim` (with `Vundle.vim`, see `~/.vimrc`)
    * `gdb`, `strace`, `crash`, `ltrace`
    * `git`, `tig`, `colordiff`
    * `rsync`, `fdupes`
    * `htop`, `dstat`, `glances`, `smem`, `lsof`, `iotop`
    * `coreutils`, `moreutils`, `net-tools` (`inetutils`), `bind-utils`
    * `pv`, `tree`, `psmisc`
    * `wget`, `curl`, `gawk`, `ack`, `ag` (`the_silver_searcher`)
    * `zsh` (with `prezto`), `bash-completion`
    * `ethtool`, `iptraf`, `iperf3`, `iftop`, `nmap`
    * `bmon`, `tcpdump`, `nfs-utils`, `fuse-sshfs`
    * `conntrack`, `iptstate`
    * `lshw`, `pciutils`, `usbutils`
    * `reptyr`, `ntsysv`, `yum-utils`
    * `sl`
    * `neofetch` (shell script)
9. systemd services
    * sshd.service (enabled)
    * firewalld.service (disabled)
    * kdump.service (disabled)
    * postfix.service (enabled)
    * sysstat.service (enabled)
    * rhnsd (off)
10. SELinux is disabled. To re-enable it, edit `/etc/selinux/config` and reboot
11. Optional [debuginfo](https://oss.oracle.com/ol7/debuginfo) repository added, disabled by default. Enable by editing `/etc/yum.repos.d/debuginfo.repo`

## Basic Software
* `rbenv` installed in `~vagrant/.rbenv`
* `ruby` 2.6.0 installed using `ruby-build`
* `chef` 14.8.12 installed
* Puppet YUM repository configured and enabled. To install puppet master run `yum install puppet-server`, to install puppet on agent nodes run `yum install puppet`, to configure, check [Configuring Puppet](http://docs.puppetlabs.com/guides/configuring.html)
* Other gems => `bundler`, `rbenv-rehash`

## Getting started

Download the base box and get the box started

```bash
$ mkdir test_environment
$ cd test_environment
$ vagrant init terrywang/oraclelinux-7-x86_64
$ vagrant up
$ vagrant ssh
```

## Reference

[Vagrant - Getting Started Guide](http://docs.vagrantup.com/v2/getting-started/)

[A List of base boxes for Vagrant](http://vagrantbox.es/)
