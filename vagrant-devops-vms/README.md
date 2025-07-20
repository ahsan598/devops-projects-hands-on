# 💻 Vagrant-Based DevOps Lab Environment

This directory contains a collection of **Vagrant configurations** for quickly spinning up local virtual machines tailored to common **DevOps tools and workflows**. Each setup is modular, beginner-friendly, and designed for learning, testing, or experimentation.

These Vagrant files let you spin up **custom virtual machines**, where you can configure:

- ✅ IP addresses  
- ✅ RAM and CPU resources
- ✅ Port forwarding
- ✅ Tool-specific provisioning


---

### 🧰 Prerequisites

Make sure the following tools are installed:
- [Vagrant](https://www.vagrantup.com/downloads) – for VM provisioning
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) – as the VM provider
- Code Editor or Terminal – e.g., VS Code, Git Bash, or a native Linux terminal


### 🛠 Tools Used

| Tool         | Purpose                                         |
|--------------|-------------------------------------------------|
| Vagrant      | Automates VM provisioning and lifecycle         |
| VirtualBox   | VM provider used by Vagrant                     |
| Bash         | Used for provisioning and setup tasks           |


### 📦 Features

- Define multiple VMs using a single `Vagrantfile`
- Custom IP, memory, and CPU per VM
- Port forwarding support for SSH, HTTP, or any app
- Easy provisioning and teardown of local environments
- Simulate multi-node DevOps setups locally


### 📂 Project Structure

```sh
vagrant-devops-vms/
├── base-vm/                # Basic customizable Ubuntu VM
├── cicd-pipeline-setup/    # Multi-VM setup for CI/CD tools
├── k8s-cluster/            # (WIP) Local Kubernetes cluster
└── ansible-ready-vm/       # Ubuntu VM prepped for Ansible
```

---

### ▶️ How to Use

1. **Clone the repository**

```bash
git clone https://github.com/yourusername/vagrant-devops-vms.git
cd vagrant-devops-vms
```


**2. Customize Your VM Configuration**

All VM settings (memory, CPU, IP, and ports) are defined in `config.yaml`.

```sh
vim config.yaml
nano config.yaml
code config.yaml        # if using VS Code
```


3. **Provision the VMs**

```sh
vagrant up              # Start the VM(s)
vagrant ssh web         # SSH into the 'web' VM
vagrant destroy -f      # Destroy the VM(s) when done
```

> 💡 Add execution permission for scripts:
> ```sh
> chmod +x setup-scripts/*.sh
> ```


### 💡 Use Cases

- Installing and testing DevOps tools (e.g., Jenkins, Ansible)
- Simulating multi-node clusters or environments
- CI/CD pipeline experiments and local networking practice
- Offline sandboxing for isolated DevOps workflows


### 📌 Notes

- Vagrantfile dynamically reads from `config.yaml`
- Ideal for offline testing or quick rebuilds
- Not intended for production use
