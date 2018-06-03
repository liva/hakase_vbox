#!/bin/bash -x
vagrant plugin install vagrant-vbguestv
agrant up
vagrant ssh -c "sudo bash -x /vagrant/install.sh"
vagrant reload
