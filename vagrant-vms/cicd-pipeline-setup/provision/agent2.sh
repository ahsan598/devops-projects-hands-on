# Note: This script is part of a personal DevOps lab setup.
# It is intended for local learning and testing only.
# Use at your own discretion.

#!/bin/bash
set -e

echo "[INFO] Installing Nexus Repository Manager..."

# Install Java 8 (required for Nexus 3.x)
sudo apt update -y
sudo apt install -y openjdk-8-jdk wget

# Create 'nexus' user (if not exists)
if ! id nexus >/dev/null 2>&1; then
  echo "[INFO] Creating 'nexus' user..."
  sudo useradd -r -m -U -d /opt/nexus -s /bin/bash nexus
fi

# Download Nexus (change version if needed)
cd /opt
NEXUS_VERSION="3.82.0-08"
NEXUS_FILE="nexus-${NEXUS_VERSION}-unix-x64.tar.gz"
NEXUS_URL="https://download.sonatype.com/nexus/3/${NEXUS_FILE}"

if [ ! -f "$NEXUS_FILE" ]; then
  echo "[INFO] Downloading Nexus ${NEXUS_VERSION}..."
  sudo wget "$NEXUS_URL"
fi

# Extract and rename
sudo tar -xzf "$NEXUS_FILE"
sudo mv "nexus-${NEXUS_VERSION}" nexus

# Set ownership
sudo chown -R nexus:nexus /opt/nexus

# Handle sonatype-work directory if created
if [ -d "/opt/sonatype-work" ]; then
  sudo chown -R nexus:nexus /opt/sonatype-work
fi

# Set Nexus to run as 'nexus' user
echo 'run_as_user="nexus"' | sudo tee /opt/nexus/bin/nexus.rc > /dev/null

# Cleanup archive
sudo rm -f "$NEXUS_FILE"

echo "[INFO] Nexus installed successfully."
echo "➡️  To run it: sudo -u nexus /opt/nexus/bin/nexus start"




##################################################################################################
## Optional Systemd Service Setup
##################################################################################################

# - If you want Nexus to run as a service:

# ```sh
# sudo vim /etc/systemd/system/nexus.service
# ```

# - Paste:

# ```ini
# [Unit]
# Description=nexus service
# After=network.target

# [Service]
# Type=forking
# LimitNOFILE=65536
# User=nexus
# Group=nexus
# ExecStart=/opt/nexus/bin/nexus start
# ExecStop=/opt/nexus/bin/nexus stop
# Restart=on-abort

# [Install]
# WantedBy=multi-user.target
# ```

# - Start Nexus
# sudo systemctl daemon-reexec
# sudo systemctl enable nexus
# sudo systemctl start nexus
# sudo systemctl status nexus

# echo "[*] Nexus setup complete!"
