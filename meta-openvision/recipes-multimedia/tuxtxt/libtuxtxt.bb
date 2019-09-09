SUMMARY = "tuxbox libtuxtxt"
LICENSE = "LGPLv2.1"
MAINTAINER = "Open Vision Developers"
LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"

PACKAGE_ARCH = "${MACHINE_ARCH}"

DEPENDS = "libpng freetype zlib"

inherit gitpkgv autotools pkgconfig

SRC_URI = "\
	git://github.com/OpenVisionE2/tuxtxt.git;protocol=git \
	${@bb.utils.contains_any("MACHINE", "spycat spycatmini spycatminiplus osmini osminiplus", "file://tuxtxt_clear_screen.patch", "", d)} \
	"

S = "${WORKDIR}/git/libtuxtxt"

PV = "2.0.1+git${SRCPV}"
PKGV = "2.0.1+git${GITPKGV}"

FILES_${PN} = "${libdir}/libtuxtxt.so.*"
FILES_${PN}-dev += "${libdir}/libtuxtxt.la ${libdir}/pkgconfig/tuxbox-tuxtxt.pc"

