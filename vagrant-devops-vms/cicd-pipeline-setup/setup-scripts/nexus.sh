#!/bin/bash
echo "[*] Installing Nexus..."

# Java + user
sudo apt update -y
sudo apt install -y openjdk-21-jdk wget

sudo useradd -r -m -U -d /opt/nexus -s /bin/bash nexus

# Download Nexus
cd /opt
sudo wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
sudo tar -xvzf latest-unix.tar.gz
sudo mv nexus-* nexus
sudo chown -R nexus:nexus /opt/nexus

# Create systemd service
cat <<EOF | sudo tee /etc/systemd/system/nexus.service
[Unit]
Description=Nexus Repository Manager
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reexec
sudo systemctl enable nexus
sudo systemctl start nexus

echo "[*] Nexus setup complete!"
