# Note: This script is part of a personal DevOps lab setup.
# It is intended for local learning and testing only.
# Use at your own discretion.

#!/bin/bash
echo "Installing Nexus..."

# Update system packages
sudo apt update -y
sudo apt install -y openjdk-8-jdk wget

# Create nexus user with proper settings
sudo useradd -r -m -U -d /opt/nexus -s /bin/bash nexus

# Download specific Nexus version (replace latest-unix.tar.gz)
cd /opt
sudo wget https://download.sonatype.com/nexus/3/nexus-3.82.0-08-unix-x64.tar.gz

# Extract and rename
sudo tar -xvzf nexus-3.82.0-08-unix-x64.tar.gz
sudo mv nexus-3.* nexus

# Set proper ownership for both directories
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work

# Configure Nexus to run as nexus user
echo 'run_as_user="nexus"' | sudo tee /opt/nexus/bin/nexus.rc

# Clean up downloaded archive
sudo rm nexus-3.82.0-08-unix-x64.tar.gz

echo "Nexus installation completed. Configure systemd service as needed."




##################################################################################################
## Uncomment below line to Create systemd service
##################################################################################################


# #!/bin/bash
# echo "[*] Installing Nexus..."

# # Java + user
# sudo apt update -y
# sudo apt install -y openjdk-21-jdk wget

# sudo useradd -r -m -U -d /opt/nexus -s /bin/bash nexus

# # Download Nexus
# cd /opt
# sudo wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
# sudo tar -xvzf latest-unix.tar.gz
# sudo mv nexus-* nexus
# sudo chown -R nexus:nexus /opt/nexus

# # Create systemd service
# cat <<EOF | sudo tee /etc/systemd/system/nexus.service
# [Unit]
# Description=Nexus Repository Manager
# After=network.target

# [Service]
# Type=forking
# LimitNOFILE=65536
# ExecStart=/opt/nexus/bin/nexus start
# ExecStop=/opt/nexus/bin/nexus stop
# User=nexus
# Restart=on-abort

# [Install]
# WantedBy=multi-user.target
# EOF

# sudo systemctl daemon-reexec
# sudo systemctl enable nexus
# sudo systemctl start nexus

# echo "[*] Nexus setup complete!"
