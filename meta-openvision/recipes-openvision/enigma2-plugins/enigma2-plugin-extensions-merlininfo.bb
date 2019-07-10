DESCRIPTION = "MerlinInfo by DarkVolli modified by RAED"
MAINTAINER = "Open Vision Developers"
LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"

inherit gitpkgv distutils-openplugins

PV = "2.1+git${SRCPV}"
PKGV = "2.1+git${GITPKGV}"

RDEPENDS_${PN} = "smartmontools libcrypto-compat"

SRC_URI = "git://github.com/OpenVisionE2/merlininfo.git;protocol=git"

FILES_${PN} = "/usr/"

S = "${WORKDIR}/git"

do_compile() {
	python -O -m compileall ${S}/usr/lib/enigma2/python/Plugins/Extensions/MerlinInfo/
}

do_install() {
	install -d ${D}/usr
	cp -r ${S}/usr/* ${D}/usr/
}

FILES_${PN}-src = "\
	${libdir}/enigma2/python/Plugins/Extensions/MerlinInfo/*.py \
"

RDEPENDS_{PN}-src = "${PN}"

FILES_${PN}-src = "${libdir}/enigma2/python/Plugins/Extensions/MerlinInfo/*.py"
