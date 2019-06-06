SUMMARY = "Firmware files for RPi broadcom"
LICENSE = "CLOSED"
require conf/license/license-close.inc

PACKAGE_ARCH = "all"


SRC_URI = "https://raw.githubusercontent.com/OpenVisionE2/linux-firmwares/master/rpi-brcm-firmwares.zip"

SRC_URI[md5sum] = "12dfcfa2587981d4de9fa9b12f58d228"
SRC_URI[sha256sum] = "fc9b83f87d93120e9c435e95c33368334983b53649ba5a11a2b72a8c351bd6ce"

S = "${WORKDIR}"

PACKAGES = "${PN}"
FILES_${PN} += "${base_libdir}/firmware/brcm"

do_install() {
    install -d ${D}${base_libdir}/firmware/brcm
    install -m 0644 *.bin ${D}${base_libdir}/firmware/brcm/
    install -m 0644 *.hcd ${D}${base_libdir}/firmware/brcm/
    install -m 0644 *.txt ${D}${base_libdir}/firmware/brcm/
}
