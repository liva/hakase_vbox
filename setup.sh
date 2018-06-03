#!/bin/bash
set -e

vagrant destroy -f || :
vagrant plugin install vagrant-vbguest
trap 'vagrant destroy -f' SIGINT ERR
vagrant up
vagrant ssh -c "sudo env EXEC_PROTECTOR=disabled bash /vagrant/install.sh"
vagrant reload

echo "setup done!"
