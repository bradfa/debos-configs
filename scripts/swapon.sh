#!/bin/bash

# The swap partition is the 2nd GPT partition.
# When executing within debos, the disk is /dev/vda.

# Format the swap partition
mkswap /dev/vda2

# Get the UUID for the swap partition
SWAP_UUID=`swaplabel /dev/vda2 | sed -e "s/ //g" | cut -f2 -d:`

# Populate the swap partition to the end of /etc/fstab
echo UUID=${SWAP_UUID} none swap sw 0 0 >> /etc/fstab
