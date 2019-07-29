# Arch Linux x86_64 Base Box for Vagrant

* Project: [Vagrantboxes](https://github.com/terrywang/vagrantboxes)
* Use this box with Vagrant: `vagrant init terrywang/archlinux && vagrant up` 
* Alternative (Direct Download): [Arch Linux x86_64 Vagrant Base Box](http://cloud.terry.im/vagrant/archlinux-x86_64.box)
* SHA256: `476f2e58d1ff2498c55eeffcf2bfa6bfe48b5d357133b889ab76289cc55d53d9`

This is a minimal base box built for [Vagrant](http://www.vagrantup.com/). Initially created using VirtualBox 4.2.2 (now 6.0.10) on Linux x86_64, guest additions installed. Packaged using Vagrant 2.2.5 (initially 1.3.4).

This `Arch Linux` x86_64 base box was built using the `archlinux-2013.02.01-dual.iso`. Arch Linux is a **rolling release** so just run `pacman -Syu` to stay cutting edge. If shit happens and the system breaks, it's time to test your troubleshooting skills;-)

> **NOTE**: In November 2012, Arch Linux switched to `systemd` as its default init system. In January 2013 `initsripts` was removed from its official repositories. The base box is up-to-date as of 29 July, 2019 (UTC+10).

## Vagrant Base Box Information

1. Release: Installed using `archlinux-2013.02.01-dual.iso`
2. Kernel: `5.2.3-arch1-1-ARCH`
3. VirtualBox Guest Additions 6.0.10 installed using packages: `virtualbox-guest-{dkms,utils}`
4. Default boot target => `multi-user.target`
5. `yaourt` installed as the front end for AUR
6. Users and passwords
    * `root` / `vagrant`
    * `vagrant` / `vagrant` (Public Key authentication, password-less sudo)
7. File Systems Layout
    * Virtual Hard Disk Capacity 20GB, Dynamically allocated
    * `/dev/sda1` => `/` `ext4` 20GB
    * ~~`/dev/sda2` => `/home` `ext4` 2.3GB~~
    * reserved blocks percentage: `/` => 0%, ~~`/home` => 0%~~
    * In case more storage space is needed, refer to [issue #23](https://github.com/terrywang/vagrantboxes/issues/23) to resize the virtual hard disk and then resize partition/grow file system. Alternatively, create a new hard disk using `VBoxManage createhd`, attach it using `VBoxManage storageattach`. Then create a physical volume using the new HDD, add it to existing volume group, either grow existing logical volumes or create new ones, as you wish.
8. Networking
    * Networking mode - NAT
    * Port forwarding configured for NAT => `VBoxManage modifyvm "archlinux" --natpf1 "guestssh,tcp,,2222,,22"`
    * Default hostname => `archlinux.vagrant.vm`
    * NIC name changed from `enp0s3` to `eth0` using udev rule => `/etc/udev/rules.d/66-persistent-net.rules`. For those who are so used to the old naming scheme. Alternatively, `net.ifnames=0` can be passed as kernel boot parameter to achieve the same, ever better.
9. Kernel Parameters
    * Due to the deprecation of `/etc/sysctl.conf`, `/etc/sysctl.d/99-sysctl.conf` has been added to make kernel parameters persistent across reboots.
10. Additional packages installed (including AUR)
    * `bash-completion`, `zsh` with `prezto`, `fish`
    * `fzf`, `autojump`
    * `htop`, `gotop`, `dstat`, `glances`, `iotop`, `ioping`, `smem`, `inxi`, `lsof`, `fatrace`, `schedtool`
    * `coreutils`, `moreutils`, `inetutils`, `bind-tools`, `pv`
    * `sharutils`, `makeself`
    * `sshfs`, `nfs-utils`, `ddrescue`, `dd_rescue`, `gptfdisk`, `parted`, `ncdu`, `entr`
    * `ack`, `ag` (silver-searcher), `rg` (ripgrep), `cloc`
    * `colordiff`, `multitail`, `gawk`, `stow`, `jq`, `fdupes`
    * `vim` with `Vundle.vim` and `EditorConfig`
    * `nnn` (snappy file manager for ninjas, type less, do more, way faster)
    * `ranger`, `vifm` (vim-like file managers), `fff` (simple file manager writtent in bash)
    * `tmux` (with [`~/.tmux.conf`](https://gist.github.com/terrywang/3950393)), `reptyr` (reparent a running program to a new terminal)
    * `sl`, `figlet`, `cowsay`, `ponysay`, `octocatsay`, `fortune-mod` and `linux_logo` for fun
    * `ethtool`, `iftop`, `nethogs`, `iperf`, `corkscrew`, `sslh`, `netcat`, `socat`, `nmap`, `ngrep`, `connect`, `trickle`, `ipcalc`, `bwm-ng`, `whois`, `bmon`, `dhcping`, `fping`, `hping`
    * `conntrack-tools`, `iptstate`, `nftables`
    * `tcpdump`, `scapy`
    * `dmidecode`, `lshw`, `hwinfo`
    * `strace`, `ltrace`, `gdb`, `binwalk`
    * `audit`, `lynis`, `ssh-audit`
    * `srm`, `wipe`
    * `wireguard`
    * `sysstat`, `collectl`
    * `asp` as drop-in replacement for `abs` as per [Deprecation of ABS tool and rsync endpoint](https://www.archlinux.org/news/deprecation-of-abs/)
    * `pkgfile` a ALPM (`pacman`) .files metadata explorer
11. `systemd` services (unit files), journal size and core dump collection behavior
    * sshd.service (enabled)
    * dhcpcd.service (enabled)
    * vboxservice.service (enabled)
    * haveged.service (enabled)
    * **NOTE**: `systemd` **216**+ made changes to core dump again, collection behavior can now be tuned in `/etc/systemd/coredump.conf`. Core dumps are stored in `/var/lib/systemd/coredump` by setting `Storage=external`.
    * **NOTE**: `systemd` **journal size** has been limited to 100MB by setting `SystemMaxUse=100M` in `/etc/systemd/journald.conf`. By default it is set to 10% of the size of the respective file system.
12. `ca-certificates` - Common CA Certificates
    * CNNIC and WoSign certificates (6 in total) have been blacklisted for security reasons, see `/etc/ca-certificates/trust-source/blacklist/`.
    * See `man 8 update-ca-trust` for more information. Use of `/etc/ca-certificates.conf` has been deprecated.
    * Use `update-ca-trust` and `trust` to apply changes.
13. Misc
    * Security hardened OpenSSH SSH client configuration can be found in `~terry/.ssh/config`. See -> [Secure Enhannced OpenSSH client configuration](https://gist.github.com/terrywang/a4239989b79d34f4160b) for information.
    * `sysstat` with `SADC_OPTIONS="-S XALL"` set in `/etc/conf.d/syssat`.

## Basic Software

**NOT** like the Oracle Linux base boxes, Ruby, Chef and Puppet are **NOT** pre-installed so as to make the box as slim as possible. `rbenv` + `ruby-build` is strongly **recommended** because official repository always pushes the latest Ruby which may break things.

## Getting started

Download the base box and get the box started

```bash
$ mkdir test_environment
$ cd test_environment
$ vagrant init terrywang/archlinux
$ vagrant up
$ vagrant ssh
```

> **NOTE**: A sample Vagrantfile can be found here => [`Vagrantfile`](https://gist.github.com/terrywang/6506216).

## Reference

[Vagrant - Getting Started](http://docs.vagrantup.com/v2/getting-started/index.html)

[A List of base boxes for Vagrant](http://vagrantbox.es/)
