#!/bin/bash

ansible-playbook -u vagrant -i development --private-key ~/.ssh/ansible-keys -e 'ansible_python_interpreter=/usr/bin/python3' site.yml
