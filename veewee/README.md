# Veewee Definitions

[Veewee](https://github.com/jedi4ever/veewee) definitions that can be used to automate the building of Oracle Linux 5.9 and 6.4 Vagrant Base Boxes.

> **NOTE**: If veewee runs behind firewall and require proxy servers to access the Internet, uncomment and set proxy servers in `proxy.sh`.

## Requirement

* See Veewee [requirements](https://github.com/jedi4ever/veewee/blob/master/doc/requirements.md)
* Ruby Version Manager like rbenv or RVM
* Virtualization Providers (e.g. VirtualBox)

## Usage

Install Veewee from source

Clone veewee project

```bash
$ cd /path/to/workspace
$ git clone https://github.com/jedi4ever/veewee.git
$ cd veewee
```
Run `bundle install` to install Gemfile dependencies

**NOTE**: Install gem `rbenv-rehash` to avoid running `rbenv rehash` every time you install new gems.

```bash
$ gem install bundler
$ rbenv rehash
$ bundle install
$ rbenv rehash
```

Copy the definitions to the `templates` directory

```bash
$ rsync -av --progress --stats \
  /path/to/vagrantboxes/veewee/definitions/ \
  /path/to/workspace/veewee/templates
```

**NOTE**: These definitions have NOT been merged into the veewee project yet.

Ready to build!

## Build

List templates

```bash
$ bundle exec veewee vbox templates | grep -i oracle
```

Create a definition

```bash
$ bundle exec veewee vbox define 'oraclelinux-6.4-x86_64' 'OracleLinux-6.4-x86_64-DVD'
```

**NOTE**: This clones the template into the `definitions` directory.

Build the image

```bash
$ bundle exec veewee vbox build 'oraclelinux-6.4-x86_64'
# Enable debug mode output
$ bundle exec veewee vbox build 'oraclelinux-6.4-x86_64' --debug
```

> **Tip**: If you have already downloaded the DVD ISO files,  create symbolic links in `iso` directory to avoid repeated download and save time.

Validate the build

```bash
$ bundle exec veewee vbox validate 'oraclelinux-6.4-x86_64'
```

Export the base box

```bash
$ bundle exec veewee vbox export 'oraclelinux-6.4-x86_64'
```

Done, `oraclelinux-6.4-x86_64.box` should be created in veewee root directory, distribute and consume it using vagrant.


