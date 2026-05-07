#!/bin/sh
set -eu

: "${RADICALE_USER:=admin}"
: "${RADICALE_PASSWORD:?RADICALE_PASSWORD is required}"

mkdir -p /data/collections

python - <<EOF
import bcrypt
import os

username = os.environ["RADICALE_USER"]
password = os.environ["RADICALE_PASSWORD"].encode("utf-8")

hashed = bcrypt.hashpw(password, bcrypt.gensalt()).decode("utf-8")

with open("/config/users", "w") as f:
    f.write(f"{username}:{hashed}\n")
EOF

exec radicale --config /config/config
