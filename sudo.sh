#!/bin/bash

apt-get update
apt-get install -y --no-install-recommends sudo
echo "oioioi ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
rm -rf /var/lib/apt/lists/*
rm /tmp/sudo.sh
