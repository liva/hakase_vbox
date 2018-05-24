# hakase_vbox
hakase_vbox is a repository to install _hakase_ kernel.

## Dependencies
- [Oracle VM VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/downloads.html)
- vagrant-vbguest

## Setup
First, install vagrant-vbguest as follows if you've not installed it:
```
$ vagrant plugin install vagrant-vbguest
```

To install _hakase_ kernel, simply run:
```
$ ./setup.sh
```
When installation the kernel is completed, please check with `uname -r` to see if it is properly installed.
```
$ uname -r
4.14.34hakase
```
