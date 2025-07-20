# 🧱 Base Ubuntu VM with Vagrant

This is a minimal Vagrant setup to spin up a base Ubuntu virtual machine — ideal for DevOps testing, provisioning, and quick experiments.


### 🔧 Features

- Ubuntu 22.04 LTS (can be customized)
- SSH access
- Easily configurable resources (CPU, RAM, IP)
- Shared folder support


### 🚀 Getting Started

**1. Prerequisites**

Make sure you have the following installed:

- Vagrant + VirtualBox
- Optional: VS Code, Git Bash, or native Linux terminal


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
    # config.yaml
    memory: 2048
    cpus: 2
    ip: "192.168.56.20"
    ports:
    - guest: 80
        host: 8080
    - guest: 22
        host: 2222
    ```

> **💡 Tip:** Leave ports empty if no forwarding is needed.

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


### 🧪 Debug Tips:

- Check logs during failures:
    ```sh
    vagrant up --debug | tee vagrant-debug.log
    ```