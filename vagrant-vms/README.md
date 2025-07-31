# 💻 Vagrant-Based DevOps Lab

This directory contains modular **Vagrant environments** to spin up local VMs for DevOps tool exploration and hands-on practice.

Each setup is built with configurable options for VM resources, networking, and provisioning.

---

### 🧰 Requirements

Install the following tools before getting started:

- [Vagrant](https://www.vagrantup.com/downloads) – for VM provisioning
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) – as the VM provider
- Code Editor or Terminal – (e.g., VS Code, Git Bash, or a native Linux terminal)


### 🔧 Key Features

- Single and multi-VM setups via `Vagrantfile`
- Customizable CPU, Memory, IP, and Port forwarding
- Basic provisioning using Bash scripts
- Ideal for simulating local DevOps clusters
- Quick teardown and rebuilds


### 📂 Project Structure

```sh
vagrant-vms/
├── base-vm/                  # Single minimal reusable VM (Ubuntu)
├── cicd-pipeline-setup/      # Multi-VM: Jenkins + agents + (can reuse 1 VM for app/db tests)
├── ansible-ready-vm/         # Only if you're testing Ansible
├── k8s-cluster/              # Your orchestration playground
```


###  🚀 Quick Usage

```sh
# Start VM(s)
vagrant up

# SSH into a specific VM
vagrant ssh <vm-name>

# Tear down
vagrant destroy -f
```


### 💡 Use Cases

- Practice with tools like Jenkins, Ansible, etc.
- Simulate multi-node infra for CI/CD or Kubernetes
- Run experiments in an isolated local sandbox


### 📌 Notes

- All configurations are local-only and offline-friendly
- Not intended for production use
- `Vagrantfile` reads settings from `config.yaml` dynamically
