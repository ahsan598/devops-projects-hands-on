# 🧱 Base Ubuntu VM with Vagrant

This is a simple, minimal Vagrant configuration to spin up a basic Ubuntu virtual machine. Useful as a starting point for any DevOps experimentation, testing, or provisioning.

### 🔧 Features

- Ubuntu 22.04 LTS (can be customized)
- SSH access
- Easily configurable resources (CPU, RAM, IP)
- Shared folder support


### 🚀 Getting Started

**1. Prerequisites**

Make sure you have the following installed:

- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [GIT](https://git-scm.com/downloads)


**2. How to Provision Your VM**

```bash
cd base-vm
vagrant up
```

This will:
- Download Ubuntu box (if not already downloaded)
- Launch a VM with the given configuration


**3. Accessing Your VM**

- To log in to the VM:
```sh
vagrant ssh
```

- To shut down the VM:

```sh
vagrant halt
```

- To destroy the VM:

```sh
vagrant destroy
```

### ⚙️ Configuration

Edit the `config.yaml` file to configure the VM. It is read by the `Vagrantfile` to set:
- Memory and CPUs
- Static IP address
- Port forwarding rules


```yml
# Resources
memory: 2048
cpus: 2
```


---

### 📁 Quick Commands

- Run these commands from the folder containing the Vagrantfile to manage, provision, or restart your VM.

| Command                      | Description                                   |
| ---------------------------- | --------------------------------------------- |
| `vagrant up`                 | Start your VM                                 |
| `vagrant ssh`                | Login into your VM                            |
| `vagrant halt`               | Stop your VM                                  |
| `vagrant destroy`            | Destroy your VM                               |
| `vagrant reload --provision` | Restart and reprovision the VM                |
| `vagrant provision`          | Run provision scripts again (without restart) |
| `vagrant status`             | Show the current status of the VM             |
| `vagrant box list`           | List all locally installed Vagrant boxes      |

