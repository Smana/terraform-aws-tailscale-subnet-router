#!/bin/bash

echo "Tailscale init"

export DEBIAN_FRONTEND=noninteractive

# Install tailscale
# -------------------
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/lunar.noarmor.gpg -o /usr/share/keyrings/tailscale-archive-keyring.gpg
apt update -qq
apt install -y tailscale

cat << EOF > /etc/sysctl.d/99-tailscale.conf
net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1
EOF
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf

if [[ -z "${auth_key}" ]]; then
sudo tailscale up --advertise-routes="${advertise_routes}"
else
sudo tailscale up --advertise-routes="${advertise_routes}" --authkey="${auth_key}"
fi

systemctl start tailscale
systemctl enable tailscale

# Install Prometheus node exporter
# --------------------------------
useradd --system --no-create-home --shell /usr/sbin/nologin prometheus

NODE_EXPORTER_VERSION=1.6.1
wget -O /tmp/node_exporter.tar.gz https://github.com/prometheus/node_exporter/releases/download/v$NODE_EXPORTER_VERSION/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz
tar -xzf /tmp/node_exporter.tar.gz -C /tmp
mv /tmp/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64/node_exporter /usr/local/bin/node_exporter

cat << EOF > /etc/systemd/system/node-exporter.service
[Unit]
Description=Prometheus exporter for server metrics

[Service]
Restart=always
User=prometheus
ExecStart=/usr/local/bin/node_exporter
ExecReload=/bin/kill -HUP $MAINPID
TimeoutStopSec=20s
SendSIGKILL=no

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start node-exporter
systemctl enable node-exporter


# SSM
# ----
snap install amazon-ssm-agent --classic
systemctl start snap.amazon-ssm-agent.amazon-ssm-agent.service
systemctl enable snap.amazon-ssm-agent.amazon-ssm-agent.service