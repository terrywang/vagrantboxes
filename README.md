vagrantboxes
============

**Handcrafted** Vagrant Base Boxes for [vagrantbox.es](http://vagrantbox.es).

# Distros

List of boxes currently maintainted

- Arch Linux x86_64
- Oracle Linux 7.6 x86_64
- ~~Oracle Linux 6.9 x86_64~~
- ~~Oracle Linux 5.11 x86_64~~

> Initial intention was to package my favourite `Arch Linux` virtual machine as Vagrant box, which can then be easily dropped into development and ops workflows. Over time, this practice has evolve into a collection of: 1. must-have packages 2. best practice and 3. important and/or notable changes for the distros

Veewee definitions are in [`veewee/definitions`](https://github.com/terrywang/vagrantboxes/tree/master/veewee/definitions) to automate the building of Vagrant Base Boxes;-) Check its [README.md](https://github.com/terrywang/vagrantboxes/blob/master/veewee/README.md) for usage.

# Other sources of vagrant boxes

Additional list of places where you can get all sorts of vagrant base boxes for different purposes: development, testing, or even production.

- [**vagrantbox.es**](http://vagrantbox.es)

  A List of vagrant base boxes. Initiated by Gareth Rushgrove `@garethr` hosted on Heroku using Nginx. See the story here: [**The Vagrantbox.es Story**](http://www.morethanseven.net/2012/07/01/The-vagrantbox.es-story/).

- [**Official Oracle Linux Vagrant Boxes**](https://yum.oracle.com/boxes)

  Now that Oracle offers official Vagrant Boxes, why NOT?

- **Chef** [**bento**](https://github.com/chef/bento)

  We all know what **bento** means in Japanese, right? In this case, they are **NOT** lunch boxes **BUT** handy base boxes (and packer templates) which can be used to test cookbooks or anything you want. Distributions included: Ubuntu Server, Debian, CentOS and Fedora.

- [**Official Puppet Vagrant Boxes**](https://app.vagrantup.com/puppetlabs)

  Pre-rolled vagrant boxes, ready for use. Made by the folks at Puppet Labs. Veewee definitions: https://github.com/puppetlabs/puppet-vagrant-boxes

- [**Ubuntu Cloud Images**](https://cloud-images.ubuntu.com)

  It's been there since Jan, 2013. To get latest LTS, 18.04 bionic in this case, simply use the URL: [https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64-vagrant.box](https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64-vagrant.box)
  > NOTE: OVA, Azure/Hyper-V VHD, VMware VMDK, KVM img, LXD images are also available for supported architectures.
 
Have fun!
