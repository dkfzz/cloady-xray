#!/bin/sh
set -e
cat > /etc/xray/config.json <<EOF
{
  "log": {"loglevel": "warning"},
  "inbounds": [
    {
      "port": ${PORT:-3000},
      "protocol": "vless",
      "settings": {
        "clients": [{"id": "${UUID}", "level": 0}],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "security": "none",
        "wsSettings": {"path": "${WS_PATH}"}
      }
    }
  ],
  "outbounds": [{"protocol": "freedom"}]
}
EOF
exec /usr/bin/xray -config /etc/xray/config.json
























