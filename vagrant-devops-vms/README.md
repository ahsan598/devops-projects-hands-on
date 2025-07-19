# 💻 DevOps Project: Vagrant VM Provisioning

This project contains **Vagrant configuration files** to spin up **custom Virtual Machines (VMs)** with user-defined:

- ✅ IP addresses  
- ✅ RAM  
- ✅ CPU cores  
- ✅ Port forwarding  

Useful for **DevOps practice**, local test environments, and reproducible infrastructure setups.



### 🧰 Tools Used

| Tool       | Purpose                                  |
|------------|------------------------------------------|
| Vagrant    | Automates VM provisioning and management |
| VirtualBox | VM provider used with Vagrant            |
| GitBash    | Bash terminal for provisioning scripts   |



### 📦 Features

- Define multiple VMs using a single `Vagrantfile`
- Custom IP, memory, and CPU per VM
- Port forwarding support for SSH, HTTP, or app-specific ports
- Easy to bring up and destroy local environments
- Great for simulating multi-node DevOps labs

---

## 🚀 Getting Started

### 🔧 Prerequisites

- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [GIT](https://git-scm.com/downloads)


### 📂 Project Structure

```sh
vagrant-vms/
│
├── README.md
├── .gitignore
│
├── base-vm/
│   └── Vagrantfile         # A basic single VM with configurable IP, RAM, CPU, ports
│   └── config.yaml         # (Optional) For external config if you support it
│
├── cicd-pipeline-setup/
│   └── Vagrantfile         # Multi-VM setup: Jenkins, SonarQube, Nexus
│   └── setup-scripts/
│       ├── jenkins.sh
│       ├── sonar.sh
│       └── nexus.sh
│
├── k8s-cluster/
│   └── Vagrantfile         # (Optional future setup for Kubernetes local cluster)
│
└── ansible-ready-vm/
    └── Vagrantfile         # VM prepped with Ansible for provisioning
```


---

### ▶️ How to Use

1. **Clone the repository**

```bash
git clone https://github.com/yourusername/vagrant-devops-vms.git
cd vagrant-devops-vms
```

2. **Customize the Vagrantfile**

Edit VM settings like below:

```ruby
config.vm.define "web" do |web|
  web.vm.box = "ubuntu/bionic64"
  web.vm.network "private_network", ip: "192.168.56.10"
  web.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 2
  end
  web.vm.network "forwarded_port", guest: 80, host: 8080
end
```

To Edit use:
```sh
vim Vagrantfile
nano Vagrantfile
```

3. **Provision the VMs**

```sh
vagrant up              # Start the VMs
vagrant ssh web         # SSH into VMs
vagrant destroy -f      # Destroy VMs when done
```


### 💡 Use Cases
- DevOps tool installations (e.g., Jenkins, Docker, Ansible)
- Kubernetes multi-node simulations
- CI/CD and networking practice
- Offline testing and isolated environments


### 📌 Notes
- You can define multiple VMs in one Vagrantfile using `config.vm.define`.
- Make sure your host-only adapter doesn't conflict with existing network interfaces.
- Ideal for repeatable local environments.