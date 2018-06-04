# hakase_vbox
hakase_vbox is a vagrant(virtualbox) environment installed _hakase_ kernel.

## Dependencies
- [Oracle VM VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/downloads.html)

Do not install them via package manager (apt, yum, etc...).
Please download and install the latest version from the official website.

## Setup
To install _hakase_ kernel, simply run:
```
$ ./setup.sh
```

When the kernel installation is completed, please check with `uname -r` to see if it is properly installed.

```
$ vagrant ssh -c "uname -r"
4.14.34hakase
Shared connection to 127.0.0.1 closed.
```
