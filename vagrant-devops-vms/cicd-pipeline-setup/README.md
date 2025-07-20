# 🛠️ CI/CD Pipeline Setup (Jenkins + SonarQube + Nexus)

This Vagrant setup launches a basic multi-VM lab environment to simulate a DevOps CI/CD pipeline using open-source tools.

### 🔍 What’s Inside?

| VM Name   | Tool Installed |
|-----------|----------------|
| jenkins   | Jenkins        |
| sonar     | SonarQube      |
| nexus     | Nexus OSS      |

> Ubuntu 22.04 used for all VMs.


### 🚀 Getting Started

**1. Prerequisites**

Make sure you have the following installed:

- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [GIT](https://git-scm.com/downloads)



**2. Navigate to Directory**

```bash
cd cicd-pipeline-setup
vagrant up
```

This will:
- Download Ubuntu box (if not already downloaded)
- Launch 3 VMs based on the configuration defined in the `config.yaml` file.



**3. Access Tools in Browser**

| Tool      | URL                               |
| --------- | ----------------------------------|
| Jenkins   | http://192.168.56.10:8080         |
| SonarQube | http://192.168.56.11:9000         |
| Nexus     | http://192.168.56.12:8081         |


**4. Managing Your VMs**

```sh
vagrant ssh jenkins     # SSH into Jenkins VM
vagrant halt            # Shut down all VMs
vagrant destroy         # Destroy all VMs
```

### ⚙️ Configuration

Edit the `config.yaml` to update:
- CPU & memory
- IP address
- port forwards

```yml
# Resources
memory: 2048
cpus: 2
```

---

### 📁 Quick VM Commands (Single & Multi-VM)

- Run these commands from the folder containing the Vagrantfile to manage, provision, or restart your VMs.

| Command                      | Description                                   |
| ---------------------------- | --------------------------------------------- |
| `vagrant up`                 | Start all VMs                                 |
| `vagrant up vm1 vm2`         | Start specific VMs                            |
| `vagrant ssh`                | SSH into default VM (if only one)             |
| `vagrant ssh vm_name`        | SSH into a specific VM                        |
| `vagrant halt`               | Stop all VMs                                  |
| `vagrant destroy`            | Destroy all VMs                               |
| `vagrant destroy vm_name`    | Destroy a specific VM                         |
| `vagrant reload --provision` | Restart and reprovision all VMs               |
| `vagrant provision`          | Run provision scripts again (without restart) |
| `vagrant status`             | Show the current status of the VMs            |
| `vagrant box list`           | List all locally installed Vagrant boxes      |
