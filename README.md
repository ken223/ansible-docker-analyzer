# Ansible playbook to analyze with docker

## System configuretion

### master

* ansible server
* prometheus
* grafana

### worker000

* docker-ce
* (T.B.D.)scikit-learn(include miniconda)

## Vagrantfile

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  config.vm.define :master do | master |
    master.vm.hostname = "master"
    master.vm.network :private_network, ip: "192.168.32.10"
    master.vm.network :private_network, ip: "192.168.33.10", virtualbox__intnet: "intnet"
  end

  config.vm.define :worker001 do | worker001 |
    worker001.vm.hostname = "worker001"
    worker001.vm.network :private_network, ip: "192.168.33.20", virtualbox__intnet: "intnet"
  end
end
```

After "vagrant up", execute below command.

```
vagrant@master:~$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/vagrant/.ssh/id_rsa): /home/vagrant/.ssh/ansible-keys
略
vagrant@master:~$ cat ~/.ssh/ansible-keys.pub >> ~/.ssh/authorized_keys
```

In worker001, append vagrant@master:~/.ssh/ansible-keys.pub to vagrant@worker001:~/.ssh/authorized_keys
