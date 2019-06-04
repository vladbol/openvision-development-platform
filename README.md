# Open Vision enigma2 images

![alt tag](https://raw.github.com/OpenVisionE2/openvision-oe/develop/recipes-openvision/bootlogo/openvision-bootlogo/bootlogo.jpg)

# Download

You could download our builds from https://openvision.tech/stb-images/
* How to use sdcard images (E.g. raspberrypi):

You could use https://sourceforge.net/projects/win32diskimager/ or similar tools to write the image on a sdcard.

# Support

Please use our forum at https://forum.openvision.tech or our issue page at https://github.com/OpenVisionE2/openvision-oe/issues

# FAQ

* Are you allowed to compile development versions? Yes!
* Are you allowed to distribute development versions? No!
* Are you allowed to make our images compatible with clones? Yes!
* Are you allowed to distribute cloned images? Yes but only with "clone-version" tag and no development versions.
* Do we support clones? No!
* Are you allowed to make backup of our images? Yes!
* Are you allowed to distribute backup images? Yes but only with "backup-version" tag and no development versions.
* Do we provide support for self-building? No! We prefer to work on our projects.
* Do we need more Vision Developers? Absolutely yes! Contribute to our git and we contact you!
* Do we need more Vision Testers? Absolutely yes! Test our images and report bugs, help us grow you'll see the title flows.

If you see your model in https://github.com/OpenVisionE2/openvision-oe/blob/develop/README.md it means there will be Open Vision for it otherwise read https://forum.openvision.tech/viewtopic.php?f=2&t=30 and don't spam the board!

---

# Compile
You could compile Open Vision for so many brands/models:
* PLi-metas: https://github.com/OpenVisionE2/openvision-oe/blob/develop/PLi-metas.md
* Vision-metas: https://github.com/OpenVisionE2/openvision-oe/blob/develop/Vision-metas.md

# Ubuntu 18.04.x LTS setup
* Run our ltsubuntu.sh

# How to get latest Ubuntu 18.04.x updates
```
sudo apt-get update
sudo apt-get install --install-recommends linux-generic-hwe-18.04 xserver-xorg-hwe-18.04
```
# How to use Xfce 4 desktop on Ubuntu
(as GNOME 3 wastes so many resources)

1- Disable wayland:
```
sudo gedit /etc/gdm3/custom.conf
```
(Change "#WaylandEnable=false" to "WaylandEnable=false")
```
sudo reboot
```
2- Install Xfce 4:
```
sudo apt-get install xfce4
```
# How to build an Open Vision image
1. Clone openpli-oe-core somewhere:
```
git clone -b develop --depth 1 https://github.com/OpenPLi/openpli-oe-core.git
```
2. Enter the openpli-oe-core directory:
```
cd openpli-oe-core
```
3. Clone openvision-oe:
```
git clone --depth 1 https://github.com/OpenVisionE2/openvision-oe.git
```
4. Run our image.sh script:
```
cd openvision-oe
./image.sh
```
# Hints for multiple architectures
* Removing the "build" directory solves most of the errors. For a fast remove use "rm -rf build".
(If you just want to reduce the build size use "cleanup.sh".)
* If you want to compile images for old machines like dm800/cube/su980, first build for them.
* If you want to compile images for x64 machines like alienx/kxpx series, first build for them.
* If you want to compile images for 4K machines with ARM architecture and you get error each time, try compile for a Mipsel machine like dm7020hd first then compile your ARM images.
