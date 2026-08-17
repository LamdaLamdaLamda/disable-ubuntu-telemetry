#!/bin/bash
set -e

./disableUbuntuOptOut.sh

grep -q "metrics.ubuntu.com" /etc/hosts
grep -q "popcon.ubuntu.com" /etc/hosts
echo "[+] hosts file entries present"

for pkg in ubuntu-report popularity-contest apport whoopsie apport-symptoms; do
  status=$(dpkg-query -W -f='${Status}' "$pkg" 2>/dev/null || true)
  if [ "$status" = "install ok installed" ]; then
    echo "[-] $pkg is still installed"
    exit 1
  fi
done
echo "[+] All telemetry packages removed"
