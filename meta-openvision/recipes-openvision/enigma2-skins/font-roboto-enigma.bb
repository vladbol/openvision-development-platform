SUMMARY = "font-roboto-enigma"
MAINTAINER = "oea"
require conf/license/license-gplv2.inc
inherit allarch

PV = "1.0"

PACKAGES = "font-roboto-enigma"
PROVIDES = "font-roboto-enigma"

SRC_URI = "file://Roboto-Black.ttf file://Roboto-BlackItalic.ttf file://Roboto-Bold.ttf file://Roboto-BoldItalic.ttf"

FILES_${PN} = "/usr/*"

S = "${WORKDIR}"

do_install() {
    install -d ${D}/usr/share/fonts
    install -m 0644 ${WORKDIR}/*.ttf ${D}/usr/share/fonts
}
