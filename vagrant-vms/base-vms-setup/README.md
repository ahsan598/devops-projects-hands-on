# 🧱 Vagrant VM Playground (Single + Multi-VM)

This repo provides a ready-to-use **Vagrant environment** for spinning up virtual machines using **VirtualBox** or other providers. It's structured to support both **single VM** and **multi-VM** setups for DevOps testing, provisioning, and sandboxing.

---

### 🔧 Features

- Ubuntu 24.04 LTS (can be customized)
- SSH access
- Easily configurable resources (CPU, RAM, IP)
- Shared folder support


### 🚀 Getting Started

**1. Requirements**

- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

Terminal:
- Git Bash, VS Code terminal, or Linux/macOS shell


**2. How to Provision Your VM**

    ```bash
    cd single-vm-setup
    vagrant up
    ```

This will:
- Download Ubuntu box (if not already downloaded)
- Launch a VM with the given configuration: Port forwarding, IPs, etc..


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


### 🧪 Debug Tips:

- Check logs during failures:
    ```sh
    vagrant up --debug | tee vagrant-debug.log
    ```


### 📌 Notes

- `multi-vm/provisions/*.sh` contains the setup scripts for each VM role (e.g., web server, database).

You can disable provisioning by removing the `provision:` key from the config file for that VM.

Use static IPs in `192.168.56.x` or `192.168.33.x` to avoid network conflicts.


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


---

### 📦 Popular Vagrant Boxes (Base Images)

| OS / Distro     | Box Name              | Provider   |
| --------------- | --------------------- | ---------- |
| Ubuntu 20.04    | `ubuntu/focal64`      | VirtualBox |
| Ubuntu 22.04    | `ubuntu/jammy64`      | VirtualBox |
| Ubuntu 24.04    | `ubuntu/noble64`      | VirtualBox |
| CentOS 7        | `centos/7`            | VirtualBox |
| CentOS Stream 8 | `centos/stream8`      | VirtualBox |
| Rocky Linux 8   | `rockylinux/8`        | VirtualBox |
| Debian 12       | `debian/bookworm64`   | VirtualBox |
| AlmaLinux 9     | `almalinux/9`         | VirtualBox |
| Red Hat (Trial) | `generic/rhel9`       | VirtualBox |
| Arch Linux      | `archlinux/archlinux` | VirtualBox |



> You can search more at: https://app.vagrantup.com/boxes/search