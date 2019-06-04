#!/bin/sh
echo ""
echo "Ubuntu 18.04.x LTS setup by Open Vision"
echo "First answer no to dash"
echo ""
sudo dpkg-reconfigure dash
echo ""
echo "Update package list first ..."
echo ""
sudo apt-get update
echo "Now install what we need, answer yes and wait for complete download"
echo ""
sudo apt-get install autoconf automake bison bzip2 cvs diffstat flex g++ gawk gcc gettext git gzip help2man ncurses-bin libncurses5-dev libc6-dev libtool make texinfo patch perl pkg-config subversion tar texi2html wget chrpath libxml2-utils xsltproc python-setuptools libc6 genromfs mtd-utils dpkg-dev sshpass poedit translate-toolkit xclip linux-firmware linux-headers-`uname -r` linux-headers-generic linux-image-generic linux-libc-dev linux-source u-boot-tools upx-ucl doxygen repo optipng python-dev libglib2.0-dev pngquant default-jdk android-tools-fastboot android-tools-fsutils libssl-dev
echo ""
echo "Done, now you can compile an Open Vision image!"
