# Arch Linux x86_64 Base Box for Vagrant

* Project: [Vagrantboxes](https://github.com/terrywang/vagrantboxes)
* Download: [Arch Linux x86_64 Vagrant Base Box](http://cloud.terry.im/vagrant/archlinux-x86_64.box)
* SHA256: `46b23e034b07d4278279a15a2a64e30b49472413380188018fa91316b806671c`

This is a minimal base box built for [Vagrant](http://www.vagrantup.com/). Initially created using VirtualBox 4.2.12 (now 4.3.10) on Ubuntu 12.04 x86_64, guest additions installed. Packaged using Vagrant 1.5.4 (initially 1.3.4).

This `Arch Linux` x86_64 base box was built using the `archlinux-2013.02.01-dual.iso`. Arch Linux is a **rolling release** so just run `pacman -Syu` to stay bleeding edge. If shit happens and it breaks, time to test your troubleshooting skills;-)

> **NOTE**: In November 2012, Arch Linux switched to `systemd` as its default init system. In January 2013 `initsripts` was removed from its official repositories. The base box is up-to-date as of April 29, 2014. The base box is NOT affected by OpenSSL *heartbleed* bug - CVE-2014-0160 as openssl has been updated to 1.0.1g or later.

## Vagrant Base Box Information

1. Release: Installed using `archlinux-2013.02.01-dual.iso`
2. Kernel: `3.14.1-1-ARCH`
3. VirtualBox Guest Additions 4.3.10 installed using packages: `virtualbox-guest-{dkms,modules,utils}`
4. `yaourt` installed as the front end for AUR
5. Users and passwords
    * `root` / `vagrant`
    * `vagrant` / `vagrant` (Public Key authentication, password-less sudo)
    * `systemd-journal-gateway` system user/group to run `systemd-journal-gatewayd`
6. File Systems Layout
    * Virtual Hard Disk Capacity 10GB, Dynamically allocated
    * `/dev/sda1` => `/` `ext4` 7.4GB
    * `/dev/sda2` => `/home` `ext4` 2.0GB
    * reserved blocks percentage: `/` => 0%, `/home` => 0%
    * In case more storage space is needed, create a new hard disk using `VBoxManage createhd`, attach it using `VBoxManage storageattach`. Then create a physical volume using the new HDD, add it to existing volume group, either grow existing logical volumes or create new ones, as you wish.
7. Network NAT
    * Port forwarding configured for NAT => `VBoxManage modifyvm "archlinux" --natpf1 "guestssh,tcp,,2222,,22"`
    * Default hostname => `archlinux.vagrant.vm`
    * Persists network interface from `enp0s3` to `eth0` using udev rule => `/etc/udev/rules.d/66-persistent-net.rules`
8. Kernel Parameters
    * Due to the deprecation of `/etc/sysctl.conf`, `/etc/sysctl.d/99-sysctl.conf` has been added to make kernel parameters persistent between reboots.
9. Additional packages installed (including AUR)
    * `bash-completion`, `zsh` with `prezto`
    * `htop`, `dstat`, `glances`, `smem`, `inxi`, `lsof`
    * `coreutils`, `moreutils`, `inetutils`, `dnsutils`, `pv`
    * `sshfs`
    * `ack`, `ag` (silver-searcher)
    * `colordiff`, `multitail`, `gawk`
    * `vim` with `Vundle.vim`
    * `ranger` (vim-like file manager)
    * `tmux` (with `~vagrant/.tmux.conf`), `reptyr` (reparent a running program to a new terminal)
    * `cowsay` and `octocatsay` for fun
    * `ethtool`, `nethogs`, `corkscrew`, `netcat`, `socat`, `nmap`, `connect-proxy` (AUR)
    * `dmidecode`, `lshw`, `hwinfo`
    * `strace`, `gdb`
10. `systemd` Services (units) and journal size
    * sshd.service (enabled)
    * dhcpcd.service (enabled)
    * vboxservice.service (enabled)
    * **NOTE**: `systemd` **journal size** has been limited to 50MB by setting `SystemMaxUse=50M` in `/etc/systemd/journald.conf`. By default it is set to 10% of the size of the respective file system.
11. `ca-certificates` - Common CA Certificates
    * CNNIC certificates has been removed for safety reasons
    * For more details, see `/etc/ca-certificates.conf`
    * DO NOT forget to run `update-ca-certificates` to apply the change.

## Basic Software

**NOT** like the Oracle Linux base boxes, Ruby, Chef and Puppet are **NOT** pre-installed so as to make the box as slim as possible. `rbenv` + `ruby-build` is strongly **recommended** because Extra repository always pushes the latest Ruby which may possibly break things.

## Getting started

Download the base box and get the box started

```bash
$ vagrant box add archlinux-x86_64 ADDRESS
$ mkdir test_environment
$ cd test_environment
$ vagrant init archlinux-x86_64
$ vagrant up
$ vagrant ssh
```

> **NOTE**: A sample Vagrantfile can be found here => [`Vagrantfile`](https://gist.github.com/terrywang/6506216).

## Reference

[Vagrant - Getting Started](http://docs.vagrantup.com/v2/getting-started/index.html)

[A List of base boxes for Vagrant](http://vagrantbox.es/)
