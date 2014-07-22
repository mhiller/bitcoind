#!/bin/bash
set -e -v

echo 'deb http://ppa.launchpad.net/bitcoin/bitcoin/ubuntu trusty main' > /etc/apt/sources.list.d/bitcoin.list
apt-key adv --keyserver 'hkp://pgp.mit.edu:80' --recv-keys 'C70EF1F0305A1ADB9986DBD8D46F45428842CE5E'
apt-get update

sudo apt-get install -fqy bitcoind

mkdir -p /etc/bitcoin
mkdir -p /var/lib/bitcoin

find /var/lib/apt/lists -maxdepth 1 -type f -name "*_Packages" -delete
find /var/lib/apt/lists -maxdepth 1 -type f -name "*_Sources" -delete
find /var/lib/apt/lists -maxdepth 1 -type f -name "*_Release" -delete
find /var/lib/apt/lists -maxdepth 1 -type f -name "*_Release.gpg" -delete
find /var/lib/apt/lists -maxdepth 1 -type f -name "*_Translation-*" -delete

find /var/cache/apt/archives -type f -name "*.deb" -delete
find /var/cache/apt -type f -name "*.bin" -delete

for in_path in /usr/share/doc-base /usr/share/doc /usr/share/man /usr/share/groff /usr/share/info; do
  if [ -d "$in_path" ]; then
    find $in_path -type f -exec rm -rf \{\} \;
  fi
done

for in_path in /var/cache/man /var/tmp /tmp /run; do
  if [ -d "$in_path" ]; then
    find $in_path -mindepth 1 -maxdepth 1 -exec rm -rf \{\} \;
  fi
done
