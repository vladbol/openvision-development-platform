#!/bin/sh
echo ""
echo "Ubuntu 18.04.x LTS setup by Open Vision"
echo ""
echo "First answer no to dash"
echo ""
sudo dpkg-reconfigure dash
echo ""
echo "Update package list first ..."
echo ""
sudo apt-get update
echo ""
echo "Remove useless packages ..."
echo ""
sudo apt autoremove -y
echo ""
echo ""
echo "Upgrade packages ..."
echo ""
sudo apt-get upgrade -y
echo ""
echo "Get latest LTS changes ..."
echo ""
sudo apt-get install -y --install-recommends linux-generic-hwe-18.04 xserver-xorg-hwe-18.04
echo ""
echo "Now install what we need, answer yes and wait for complete download"
echo ""
sudo apt-get install -y autoconf automake bison bzip2 cvs diffstat flex g++ gawk gcc gettext git git-lfs gzip help2man ncurses-bin libncurses5-dev libc6-dev libtool make texinfo patch perl pkg-config subversion tar texi2html wget chrpath libxml2-utils xsltproc python-setuptools libc6 genromfs mtd-utils dpkg-dev sshpass poedit translate-toolkit xclip linux-firmware linux-headers-`uname -r` linux-headers-generic linux-image-generic linux-libc-dev linux-source u-boot-tools upx-ucl doxygen repo optipng python-dev libglib2.0-dev pngquant default-jdk android-tools-fastboot android-tools-fsutils libssl-dev libc6-dev-i386 lib32z1 m4 liborbit2-dev intltool ccache zlib1g zlib1g-dev liblzo2-dev tcl dpkg asciidoc texlive-latex-base dblatex xutils-dev gparted openssh-server nfs-common nfs-kernel-server lintian git-doc git-gui gitk indent tofrodos fakeroot meld atftpd sharutils manpages-dev manpages-posix manpages-posix-dev linux-doc
echo ""
echo "Done, now you can compile an Open Vision image!"
