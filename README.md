debos Disk Image Configs
========================

These are some example configuration files and notes around how to easily build
Debian (and derivatives) disk images using the
[debos](https://github.com/go-debos/debos) tool.

These have been tested on a x86_64 host PC running Debian Bookworm with debos
installed, but should work on any current Debian-derivative distribution, too:

```
sudo apt install debos
```

To build the x86_64 Debian Bookworm disk image, run `debos` like:

```
debos x86_64-uefi-bookworm.yaml
```

It will build a disk image and bmap-tools files named:

```
x86_64-uefi-bookworm.img
x86_64-uefi-bookworm.bmap
```

You can then directly boot the image as a VM which uses UEFI firmware or write
it to a disk to boot on a real machine.  Using `bmaptool` to write the image to
a real disk will be MUCH faster than using `dd`.


## Details

You'll need at least debos version 1.0.0+git20201203.e939090-4, which if you're
using Debian is the version which ships in the bullseye Debian release.

If you're building Debian Bullseye targets, you'll need to have QEMU version
&gt;=5.0 on your build system due to changes to Bullseye's glibc package which
enabled static PIE.  The symptom when you have a too old QEMU is a segfault
during the second stage of debootstrapping.

If you're building Ubuntu targets, you'll need to run `debos` with its `-m`
switch to specify more memory, as the default 2048MB is too small to build the
generic Linux kernel initrd, like: `debos -m 4096MB x86_64-uefi-focal.yaml`

Please see each configuration for information on which bootloader (grub versus
systemd-boot) and network configuration mechanism (ifupdown versus netplan) are
used.  They are not consistent across configurations due to various nuances of
each distribution.
