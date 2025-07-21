# Note: This script is part of a personal DevOps lab setup.
# It is intended for local learning and testing only.
# Use at your own discretion.


#!/bin/bash

# Display installation start message
echo "Installing Jenkins..."

# Step 1: Update the package list to get latest available versions
sudo apt update -y

# Step 2: Install OpenJDK 21 (Java Development Kit)
# Jenkins requires Java to run - OpenJDK 21 is supported by Jenkins 2.419+
sudo apt install -y openjdk-21-jdk

# Step 3: Download Jenkins GPG key for repository authentication
# Modern approach using keyring (replaces deprecated apt-key method)
# This key ensures we're downloading authentic Jenkins packages
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Step 4: Add Jenkins official repository to system sources
# [signed-by=...] tells APT to use our downloaded key for verification
# This gives us access to official Jenkins packages
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Step 5: Update package list again to include Jenkins repository
sudo apt update -y

# Step 6: Install Jenkins and fontconfig
# fontconfig: Required for proper rendering of Jenkins UI elements
# jenkins: The main Jenkins automation server package
sudo apt install -y fontconfig jenkins

# Step 7: Configure Jenkins to start automatically on system boot
sudo systemctl enable jenkins

# Step 8: Start Jenkins service immediately
sudo systemctl start jenkins




##################################################################################################
## Uncomment the following lines if you want to install Docker as well
##################################################################################################

# #!/bin/bash
# echo "[*] Installing Jenkins..."

# # Java + Jenkins
# sudo apt update -y
# sudo apt install -y openjdk-21-jdk curl gnupg2

# curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
#   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
# echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
#   https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
#   /etc/apt/sources.list.d/jenkins.list > /dev/null

# sudo apt update
# sudo apt install -y jenkins

# # Start Jenkins
# sudo systemctl enable jenkins
# sudo systemctl start jenkins

# # Install Docker (for CI builds)
# echo "[*] Installing Docker..."
# sudo apt install -y ca-certificates gnupg lsb-release

# sudo mkdir -p /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
#   sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
#   https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# sudo apt update
# sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin

# # Add Jenkins user to Docker group
# sudo usermod -aG docker jenkins
# newgrp docker

# echo "[*] Jenkins and Docker setup complete!"
