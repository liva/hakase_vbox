#!/bin/bash
set -e

if [ "$EXEC_PROTECTOR" != "disabled" ]; then
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    echo "DO NOT RUN install.sh directly!!"
    echo "USE setup.sh INSTEAD!"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    exit 1
fi

function wait_until_dpkg_unlocked() {
    while sudo fuser /var/lib/dpkg/lock >/dev/null 2>&1; do
        sleep 1;
    done
}

# avoid duplicate installation
test -f /etc/hakase_installed && exit

pushd /usr/src
su -c "grep '^deb ' /etc/apt/sources.list | sed 's/^deb/deb-src/g' > /etc/apt/sources.list.d/deb-src.list"
sed -i'~' -E "s@http://(..\.)?archive\.ubuntu\.com/ubuntu@http://pf.is.s.u-tokyo.ac.jp/~awamoto/apt-mirror/@g" /etc/apt/sources.list

wait_until_dpkg_unlocked; apt update -qq
wait_until_dpkg_unlocked; apt install -y libelf-dev make g++

wget http://www.pf.is.s.u-tokyo.ac.jp/~awamoto/hakase/linux-headers-4.14.34hakase_4.14.34hakase-1_amd64.deb
wget http://www.pf.is.s.u-tokyo.ac.jp/~awamoto/hakase/linux-image-4.14.34hakase_4.14.34hakase-1_amd64.deb
wget http://www.pf.is.s.u-tokyo.ac.jp/~awamoto/hakase/linux-libc-dev_4.14.34hakase-1_amd64.deb

wait_until_dpkg_unlocked; dpkg -i *hakase-1_amd64.deb

sed -i -e "s/GRUB_CMDLINE_LINUX_DEFAULT=\"/GRUB_CMDLINE_LINUX_DEFAULT=\"memmap=0x80000000\\\\\\\$0x80000000 /g" /etc/default/grub
sed -i -e "s/GRUB_TIMEOUT=10/GRUB_TIMEOUT=2/g" /etc/default/grub
update-grub2
popd

date > /etc/hakase_installed
