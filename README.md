# Portable dev envrionment

Vagrant is a tool for building and managing virtual machine environments in a single workflow. With an easy-to-use workflow and focus on automation, Vagrant lowers development environment setup time, increases production parity, and makes the "works on my machine" excuse a relic of the past.


## Installation

1. Install [Vagrant](https://www.vagrantup.com/downloads).
2. Install virtualbox or other [Providers](https://www.vagrantup.com/docs/providers).

## Usage

Boot up
```bash
vagrant up --provision
```

Suspend (save state)

```bash
vagrant suspend
```

Halt (poweroff)

```bash
vagrant halt
```

Detroy (delete the VM)
```bash
vagrant destroy
```

## Details 

The provision script installs the following packages and softwares to the VM
* golang
* docker
* kubebuilder
* kind
* kubectl
* miniconda

and some other common dev packages.

