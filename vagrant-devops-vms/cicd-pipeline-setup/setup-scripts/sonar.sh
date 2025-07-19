#!/bin/bash
echo "[*] Installing SonarQube..."

# Install dependencies
sudo apt update -y
sudo apt install -y unzip openjdk-21-jdk wget

# Create sonar user & directories
sudo useradd -m -d /opt/sonarqube -r -s /bin/bash sonar

# Download & extract SonarQube
cd /opt
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.4.1.88267.zip
sudo unzip sonarqube-10.4.1.88267.zip
sudo mv sonarqube-10.4.1.88267 sonarqube
sudo chown -R sonar:sonar /opt/sonarqube

# Create systemd service
cat <<EOF | sudo tee /etc/systemd/system/sonarqube.service
[Unit]
Description=SonarQube service
After=syslog.target network.target

[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF

# Start SonarQube
sudo systemctl daemon-reexec
sudo systemctl enable sonarqube
sudo systemctl start sonarqube

echo "[*] SonarQube setup complete!"
