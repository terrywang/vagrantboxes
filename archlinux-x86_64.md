# Arch Linux x86_64 Base Box for Vagrant

* Project: [Vagrantboxes](https://github.com/terrywang/vagrantboxes)
* Use it: `vagrant init terrywang/archlinux && vagrant up` 

This is a minimal base box built for [Vagrant](http://www.vagrantup.com/). Initially created using VirtualBox 4.2.2 (now 6.1.22) on Linux x86_64, guest additions installed. Packaged using Vagrant 2.2.16 (initially 1.3.4).

This `Arch Linux` x86_64 base box was built using the `archlinux-2013.02.01-dual.iso`. Arch Linux is a **rolling release** so just run `pacman -Syu` to stay cutting edge. If shit happens and breaks the system, it's time to level up troubleshooting skills ;-)

> **NOTE**: In November 2012, Arch Linux switched to `systemd` as its default init system. In January 2013 `initsripts` was removed from its official repositories. The base box is up-to-date as of 13 May, 2021 (UTC+11).

## Vagrant Base Box Information

1. Release: Installed using `archlinux-2013.02.01-dual.iso`
2. Kernel: `5.12.3`
3. VirtualBox Guest Additions `6.1.22` installed using packages: `virtualbox-guest-utils`
4. Default boot target => `multi-user.target`
5. System timezone set to `UTC` via `systemd`'s `timedatectl set-timezone UTC`
6. `yay` - Yet Another Yogurt replaces `yaourt` as new AUR helper
7. Users and passwords
    * `root` / `vagrant`
    * `vagrant` / `vagrant` (Public Key authentication, password-less sudo)
8. File Systems Layout
    * Virtual Hard Disk Capacity 20GB, Dynamically allocated
    * `/dev/sda1` => `/` `ext4` 20GB
    * ~~`/dev/sda2` => `/home` `ext4` 2.3GB~~
    * reserved blocks percentage: `/` => 0%, ~~`/home` => 0%~~
    * In case more storage space is needed, refer to [issue #23](https://github.com/terrywang/vagrantboxes/issues/23) to resize the virtual hard disk and then resize partition and grow the filesystem. ~~Alternatively, create a new virtual hard disk using `VBoxManage createmedium`, attach it using `VBoxManage storageattach`. Then create a physical volume using the new HDD, add it to existing volume group, either grow existing logical volumes or create new ones, as you wish.~~
9. Networking
    * Networking mode - NAT
    * Port forwarding configured for NAT => `VBoxManage modifyvm "archlinux" --natpf1 "guestssh,tcp,,2222,,22"`
    * Default hostname => `arch.band.it`
    * NIC name changed from Predictable Network Interface name `enp0s3` to traditional `eth0` using udev rule => `/etc/udev/rules.d/66-persistent-net.rules`. Alternatively, `net.ifnames=0` can be passed as kernel command line parameter at boot for those who prefer traditional names.
10. Kernel parameters at runtime
    * Due to the deprecation of `/etc/sysctl.conf`, `/etc/sysctl.d/99-sysctl.conf` has been added to make kernel parameters persistent across reboots.
11. Additional packages installed (including AUR)
     * **`TL;DR`** decoupled the list of modern utils (and productivity tools) to a separately managed `-->` [**`modern_utils`**](https://sites.google.com/site/imterry/modernutils) wiki page ;-)
    * `bash-completion`, `zsh`, `fish` + [`Oh My Fish`](https://github.com/oh-my-fish/oh-my-fish)
    * `fzf`, ~~`fpp`~~, `autojump`, `direnv`
    * `htop`, `dstat`, `glances`, `inxi`, `bottom`, ~~`bashtop`~~, `bpytop`
    * `vmtouch`
    * `iotop`, `ioping`, `smem`, `lsof`, `fatrace`, `ftop`, `schedtool`
    * `coreutils`, `moreutils`, `inetutils`, `bind-tools`
    *  **modern utils**: `procs`, `fd` (`find` alternative written in Rust), `exa` (`ls` replacement written in Rust), `bottom`, `bandwhich`, `topgrade` (on top of upgrade), see `/root/modern_utils.md` for more details
    * `pv` (monitor the progress of data through a pipe)
    * `progress` (coreutils progress viewer)
    * `up` (Ultimate Plumber for pipes), `peco` (simplistic interactive filtering tool)
    * `sharutils`, `makeself`
    * `sshfs`, `nfs-utils`, `ddrescue`, `dd_rescue`, `gptfdisk`, `parted`, `ncdu`, `entr`
    * `ack`, `ag` (silver-searcher), `rg` (ripgrep), `cloc`, `tokei`
    * `colordiff`, `multitail`, `gawk`, `stow`, `fdupes`
    * `jq`, `gron`
    * `xsv` (CSV CLI toolkit written in Rust)
    * `vim` with `vim-plug` (minimalist Vim plugin manager) and `EditorConfig`
    * `nnn` (snappy file manager for ninjas, type less, do more, way faster)
    * `ranger`, `vifm` (vim-like file managers), `fff` (simple file manager writtent in bash)
    * `tmux` (with [`~/.tmux.conf`](https://gist.github.com/terrywang/3950393)), `reptyr` (reparent a running program to a new terminal), `detach`
    * `sl`, `figlet`, `cowsay`, `ponysay`, `octocatsay`, and `fortune-mod` for fun
    * `ethtool`, `iftop`, `nethogs`, `iperf3`, `corkscrew`, `sslh`, `netcat`, `socat`, `nmap`, `ngrep`, `dropwatch`, `connect`, `trickle`, `ipcalc`, `bwm-ng`, `whois`, `bmon`, `dhcping`, `fping`, `hping`
    * `kdig` provided by `knot` for advanced DNS lookup, specifically for DNS over TLS (DoT)
    * `conntrack-tools`, `iptstate`, `nftables`
    * `tcpdump`, `scapy`
    * `dmidecode`, `lshw`, `hwinfo`
    * `strace`, `ltrace`, `gdb`, `binwalk`
    * `audit`, `lynis`, `ssh-audit`
    * `srm`, `wipe`
    * `duc` a collection of tools for inspecting and visualising disk usage
    * `wireguard-tools`
    * `sysstat`, `collectl`
    * `symlinks` (symbolic link maintenance utility)
    * `asp` as drop-in replacement for `abs` as per [Deprecation of ABS tool and rsync endpoint](https://www.archlinux.org/news/deprecation-of-abs/)
    * `pkgfile` a ALPM (`pacman`) .files metadata explorer
12. `systemd` (now `246`) services (unit files), journal size and core dump collection behavior
    * `sshd.service` (enabled)
    * `dhcpcd.service` (enabled)
    * `vboxservice.service` (enabled)
    * `haveged.service` (enabled)
    * **NOTE**: `systemd` **216**+ made changes to core dump again, collection behavior can now be tuned in `/etc/systemd/coredump.conf`. Core dumps are stored in `/var/lib/systemd/coredump` by setting `Storage=external`.
    * **NOTE**: `systemd` **journal size** has been limited to 100MB by setting `SystemMaxUse=100M` in `/etc/systemd/journald.conf`. By default it is set to 10% of the size of the respective file system.
13. `ca-certificates` - Common CA Certificates
    * CNNIC and WoSign certificates (6 in total) have been blacklisted for security reasons, see `/etc/ca-certificates/trust-source/blacklist/`.
    * See `man 8 update-ca-trust` for more information. Use of `/etc/ca-certificates.conf` has been deprecated.
    * Use `update-ca-trust` and `trust` to apply changes.
14. Misc
    * Security hardened OpenSSH SSH client configuration can be found in `~terry/.ssh/config`. See -> [Secure Enhannced OpenSSH client configuration](https://gist.github.com/terrywang/a4239989b79d34f4160b) for information.
    * `sysstat` with `SADC_OPTIONS="-S XALL"` set in `/etc/conf.d/syssat`.
    * `pacman` 5.2 switched compression algorithm from `xz` to `zstd` for faster compression and decompression, while maintaining a compression ratio comparable with `xz`. Default package file extension is `.pkg.tar.zst`. 
    * `Pac-Man` style `pacman` by adding `ILoveCandy` in `/etc/pacman.conf`.
    * Since `systemd` 243 `systemd-resolved` has been configured for DNS Privacy using DNS over TLS (DoT). However, the service is NOT enabled by default due to `systemd-resolved`'s limited `resolvconf` interface. To enable, `systemd-resolvconf` needs to replace `openresolv`.

## Basic Software

**NOT** like the Oracle Linux base boxes, Ruby, Chef and Puppet are **NOT** pre-installed so as to make the box as slim as possible, also with the rise of Ansible, its agent-less model is preferred in most cases, enf of story. `rbenv` + `ruby-build` is **recommended** to manage per project Ruby version because rolling upgrade model pulls in whatever is latest, the behaviour can simply break things, avoid.

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
