#!/bin/bash
# Log all output to a file for debugging
exec > >(tee -a /var/log/userdata.log) 2>&1

# Update package lists
apt update || { echo "apt update failed"; exit 1; }

# Install Apache
apt install -y apache2 || { echo "apache2 install failed"; exit 1; }

# Get the instance ID using IMDSv2
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600") || { echo "Failed to get metadata token"; exit 1; }
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id) || { echo "Failed to get instance ID"; exit 1; }
# Verify INSTANCE_ID is not empty
if [ -z "$INSTANCE_ID" ]; then
  echo "INSTANCE_ID is empty; failed to retrieve instance ID"
  exit 1
fi

# Create index.html
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>My Portfolio</title>
  <style>
    @keyframes colorChange {
      0% { color: red; }
      50% { color: green; }
      100% { color: blue; }
    }
    h1 {
      animation: colorChange 2s infinite;
    }
  </style>
</head>
<body>
  <h1>Terraform Project Server 1</h1>
  <h2>Instance ID: <span style="color:green">$INSTANCE_ID</span></h2>
  <p>Welcome to website 1</p>
</body>
</html>
EOF

# Set correct permissions for index.html
chown www-data:www-data /var/www/html/index.html || { echo "Failed to set ownership"; exit 1; }
chmod 644 /var/www/html/index.html || { echo "Failed to set permissions"; exit 1; }

# Start and enable Apache
systemctl start apache2 || { echo "apache2 start failed"; exit 1; }
systemctl enable apache2 || { echo "apache2 enable failed"; exit 1; }

# Verify Apache is running and serving the page
curl http://localhost || { echo "Apache failed to serve page"; exit 1; }