## 📁 Getting Started with project

- From inside a folder with a Vagrantfile, you can just run:

    | Command           | Description        |
    | ----------------- | ------------------ |
    | `vagrant up`      | Start your VM      |
    | `vagrant ssh`     | Login into your VM |
    | `vagrant halt`    | Stop your VM       |
    | `vagrant destroy` | Destroy your VM    |


## 🧠 Optional Commands

- **To provision or restart your VM**

    | Command                      | Description                                   |
    | ---------------------------- | --------------------------------------------- |
    | `vagrant reload --provision` | Restart and reprovision the VM                |
    | `vagrant provision`          | Run provision scripts again (without restart) |
    | `vagrant status`             | Show the current status of the VM             |
    | `vagrant box list`           | List all locally installed Vagrant boxes      |


- **For Multi-VM Setups:**

    | Command               | Description            |
    | --------------------- | ---------------------- |
    | `vagrant up vm1 vm2`  | Start specific VMs     |
    | `vagrant destroy vm1` | Destroy a specific VM  |
    | `vagrant ssh vm2`     | SSH into a specific VM |
