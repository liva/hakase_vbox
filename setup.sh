#!/bin/bash -x
vagrant up
vagrant ssh -c "sudo bash -x /vagrant/install.sh"
vagrant reload
