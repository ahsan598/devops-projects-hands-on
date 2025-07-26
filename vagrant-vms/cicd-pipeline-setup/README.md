# ⚙️ Jenkins CI/CD Pipeline Lab (Multi-VM Setup)

This lab provisions a local **multi-VM Jenkins environment** using Vagrant — including:

- `master`: Jenkins controller
- `agent1`: Jenkins agent + SonarQube server
- `agent2`: Jenkins agent + Nexus repository manager

Each VM is preconfigured through provisioning scripts.

---

### 🧱 VM Overview

| VM Name        | Role                | IP Address       | Services              |
|----------------|---------------------|------------------|------------------------|
| master         | Jenkins Master      | `192.168.56.11`  | Jenkins UI (port 8080) |
| agent1         | Jenkins Agent #1    | `192.168.56.12`  | SonarQube (port 9000)  |
| agent2         | Jenkins Agent #2    | `192.168.56.13`  | Nexus (port 8081)      |



### 🚀 How to Use

**1. Start the Environment**

```bash
cd cicd-pipeline-setup
vagrant up
```


**2. Access Jenkins UI**
- Open: http://192.168.56.11:8080
- Get admin password:

```bash
vagrant ssh jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```


**3. Setup SSH-Based Jenkins Agents (from Jenkins UI)**

Step-by-step:
  1. Go to Manage Jenkins → Nodes → New Node
  2. Name: `sonar-agent` or `nexus-agent`
  3. Type: "**Permanent Agent**"
  4. Remote root directory: `/home/jenkins`
  5. Launch method: SSH
  6. Host:
    - `192.168.56.12` for Sonar
    - `192.168.56.13` for Nexus
  7. Credentials:
    - Username: `jenkins`
    - Password: `jenkins`
      (or use SSH key copied via `ssh-copy-id`)


### 🔐 (Optional) SSH Setup for Agent Access

To allow Jenkins master to connect to agents via SSH:

```sh
# On Jenkins master
ssh-keygen                         # if not already
ssh-copy-id jenkins@192.168.56.12  # sonar-agent
ssh-copy-id jenkins@192.168.56.13  # nexus-agent
```


### 🧰 Notes
- You can customize ports and resources in `config.yaml`
- Provision scripts located in `provision/` folder
- Agents run SonarQube/Nexus alongside Jenkins agent user
- Use vagrant halt or vagrant destroy to stop or clean the lab


---

## ✅ How to Make a Jenkins Agent on sonar (agent1):

- Add this at the end of your agent1.sh (Sonar VM provision script):

### 📦 agent1.sh (append below SonarQube setup)
```bash
# --------- Jenkins Agent Setup (via SSH) ---------

echo "[INFO] Setting up Jenkins agent requirements..."

# Create jenkins user
sudo useradd -m -s /bin/bash jenkins
echo "jenkins:jenkins" | sudo chpasswd

# Add SSH key for Jenkins master (optional: to allow passwordless login)
mkdir -p /home/jenkins/.ssh
chmod 700 /home/jenkins/.ssh

# You can later copy public key from Jenkins master:
# ssh-copy-id jenkins@192.168.56.12

echo "[INFO] Jenkins agent user created. Ready for SSH connection."
```

- Next, follow the above steps to generate the SSH key and configure Jenkins agents via the UI.


### 🔧 Tips:

- Make sure `openssh-server` is installed on agent VM
```sh
sudo apt install openssh-server
```
- Ensure port `22` is open or forwarded if needed (usually default works fine on **private_network**)


---

### 📁 Quick VM Commands (Multi-VM)

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
| `vagrant global-status`      | Show the current status of the VMs            |
| `vagrant box list`           | List all locally installed Vagrant boxes      |
| `vagrant global-status --prune`  | To refresh stale info                     |