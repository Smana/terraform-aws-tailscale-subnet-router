#!/bin/bash

echo "Tailscale init"

export DEBIAN_FRONTEND=noninteractive

# Install tailscale
# -------------------
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/noble.noarmor.gpg -o /usr/share/keyrings/tailscale-archive-keyring.gpg
apt update -qq
if [[ -n "${tailscale_version}" ]]; then
  apt install -y tailscale=${tailscale_version}
else
  apt install -y tailscale
fi

cat << EOF > /etc/sysctl.d/99-tailscale.conf
net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1
EOF
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf

# Workaround refer to this issue https://github.com/tailscale/tailscale/issues/13863#issuecomment-2752301262
echo "TS_DEBUG_FIREWALL_MODE=nftables" | tee -a /etc/default/tailscaled

TS_ARGS=${extra_args}

if ${tailscale_ssh_enabled}; then
TS_ARGS="$TS_ARGS --ssh"
fi
if [[ -n "${auth_key}" ]]; then
TS_ARGS="$TS_ARGS --authkey=${auth_key}"
fi

sudo tailscale up --advertise-routes="${advertise_routes}" $TS_ARGS

systemctl restart tailscaled
systemctl enable tailscaled

# Install Prometheus node exporter
# --------------------------------
if ${prom_exporter_enabled}; then
useradd --system --no-create-home --shell /usr/sbin/nologin prometheus

NODE_EXPORTER_VERSION=1.9.0
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
ExecReload=/bin/kill -HUP \$MAINPID
TimeoutStopSec=20s
SendSIGKILL=no

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start node-exporter
systemctl enable node-exporter
fi

# SSM
# ----
if ${ssm_enabled}; then
snap install amazon-ssm-agent --classic
systemctl start snap.amazon-ssm-agent.amazon-ssm-agent.service
systemctl enable snap.amazon-ssm-agent.amazon-ssm-agent.service
fi
