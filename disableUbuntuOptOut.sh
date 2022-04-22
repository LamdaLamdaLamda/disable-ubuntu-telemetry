#!/bin/bash
################ Description: ###################
# This script will disable all opt-out under 
# Ubuntu 18.04.1 LTS (Codename: bionic).
# At first the telemetry domains will be resolved 
# to the local host and second all malicious services
# will be removed from the system.
# The following work has a system-wide effect not just
# for a single user.
################ Parameter: #####################
# None
################ Implementation: ################
clear

if test `id -u` -ne 0
then
  echo -e "[-] Missing privileges..."
  exit 1
fi

# resolving to localhost:
echo "[*] Resolving \"metrics.ubuntu.com\" to localhost"
echo 127.0.0.1 www.metrics.ubuntu.com >>/etc/hosts
echo 127.0.0.1 metrics.ubuntu.com >>/etc/hosts

echo "[*] Resolving \"popcon.ubuntu.com\" to localhost"
echo 127.0.0.1 www.popcon.ubuntu.com >>/etc/hosts
echo 127.0.0.1 popcon.ubuntu.com >>/etc/hosts

# Removing telemetry services:
echo "[*] Removing telemetry services"
sudo apt purge ubuntu-report popularity-contest apport whoopsie apport-symptoms && sudo apt-mark hold ubuntu-report popularity-contest apport whoopsie apport-symptoms >/dev/null 2>&1

if test $? -eq 0 
then
    echo "[+] Telemtry services successfully removed."
    exit 0
else
    echo "[-] Removing of telemtry services failed."
    exit 1
fi

echo "[*] Decline telemetry"
ubuntu-report -f send no
