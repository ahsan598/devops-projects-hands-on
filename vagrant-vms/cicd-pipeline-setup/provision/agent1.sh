# Note: This script is part of a personal DevOps lab setup.
# It is intended for local learning and testing only.
# Use at your own discretion.


#!/bin/bash
set -e

echo "[INFO] Installing Java for SonarQube..."

# Update system and install dependencies
sudo apt update -y
sudo apt install -y unzip openjdk-21-jdk wget

# Create sonar user (if not exists)
if ! id sonar >/dev/null 2>&1; then
  echo "[INFO] Creating sonar user..."
  sudo useradd -m -d /opt/sonarqube -r -s /bin/bash sonar
fi

# Download and extract SonarQube
cd /opt && sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.4.1.88267.zip
sudo unzip sonarqube-*.zip && sudo mv sonarqube-* sonarqube

# Set ownership and permissions
sudo chown -R sonar:sonar /opt/sonarqube
sudo chmod +x /opt/sonarqube/bin/linux-x86-64/sonar.sh

# Configure system limits
echo 'sonar   -   nofile   131072' | sudo tee -a /etc/security/limits.conf
echo 'sonar   -   nproc    8192' | sudo tee -a /etc/security/limits.conf
echo 'vm.max_map_count=524288' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Cleanup
sudo rm /opt/sonarqube-*.zip


echo "[INFO] SonarQube installed successfully."
echo "➡️  To run it: sudo -u sonar /opt/sonarqube/bin/linux-x86-64/sonar.sh start"




##################################################################################################
## Optional Systemd Service Setup
##################################################################################################

# - If you want Sonar to run as a service:

# ```sh
# sudo vim /etc/systemd/system/sonar.service
# ```

# - Paste:

# ```ini
# [Unit]
# Description=SonarQube service
# After=syslog.target network.target

# [Service]
# Type=forking
# ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
# ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
# User=sonar
# Group=sonar
# Restart=always
# LimitNOFILE=65536

# [Install]
# WantedBy=multi-user.target
# ```

# - Start SonarQube
# sudo systemctl daemon-reexec
# sudo systemctl enable sonarqube
# sudo systemctl start sonarqube
# sudo systemctl status sonarqube

# echo "[*] SonarQube setup complete!"
