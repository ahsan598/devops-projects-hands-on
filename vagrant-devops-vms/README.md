# 💻 Vagrant-Based DevOps Lab Environment

This repository provides a collection of **Vagrant configurations** to quickly create local virtual machines tailored for common **DevOps tools and workflows**. Each setup is modular, beginner-friendly, and designed for learning, testing, or experimentation.

With these Vagrant files, you can spin up **custom virtual machines** by specifying:

- ✅ IP addresses  
- ✅ RAM and CPU resources
- ✅ Port forwarding
- ✅ Tool-specific provisioning

Each VM is customizable and defined via a `config.yaml` file.


---

### 🧰 Stack

- Vagrant + VirtualBox
- Bash provisioning scripts
- Optional: VS Code / Git Bash / Linux terminal


### 🧰 Tools Used

| Tool                    | Purpose                                                 |
| ----------------------- | ------------------------------------------------------- |
| Vagrant                 | Automates VM provisioning and management                |
| VirtualBox              | VM provider used with Vagrant                           |
| Terminall               | Optional: VS Code / Git Bash / Linux terminal           |



### 📦 Features

- Define multiple VMs using a single `Vagrantfile`
- Custom IP, memory, and CPU per VM
- Port forwarding support for SSH, HTTP, or app-specific ports
- Easy to bring up and destroy local environments
- Great for simulating multi-node DevOps labs


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

All VM resources like memory, CPU, IP, and port forwarding are defined in the `config.yaml` file.

Example:

```yaml
vms:
  web:
    ip: "192.168.56.10"
    memory: 1024
    cpus: 2
    ports:
      - guest: 80
        host: 8080
```

Make edits using any editor, or open in VS Code.

```sh
vim config.yaml
nano config.yaml
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
- DevOps tool installations (e.g., Jenkins, Docker, Ansible)
- Kubernetes multi-node simulations
- CI/CD and networking practice
- Offline testing and isolated environments


### 📌 Notes

- Vagrantfile dynamically reads from config.yaml
- Ideal for offline testing or quick rebuilds
- Not meant for production use

---

> 📘 **Note:** This setup is part of my personal DevOps lab for experimentation and hands-on learning. Use with caution in real environments.
