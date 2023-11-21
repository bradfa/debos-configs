debos Disk Image Configs
========================

These are some example configuration files and notes around how to easily build
Debian (and derivatives) disk images using the
[debos](https://github.com/go-debos/debos) tool.

You'll need at least debos version 1.0.0+git20201203.e939090-4, which if you're
using Debian is the version which ships in the bullseye Debian release.

If you're building Debian Bullseye targets, you'll need to have QEMU version
>=5.0 on your build system due to changes to Bullseye's glibc package which
enabled static PIE.  The symptom when you have a too old QEMU is a segfault
during the second stage of debootstrapping.
