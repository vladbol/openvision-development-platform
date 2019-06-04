DESCRIPTION = "Open Vision Extra RC Models"
MAINTAINER = "Open Vision Developers"
LICENSE = "Proprietary"
LIC_FILES_CHKSUM = "file://LICENSE;beginline=3;endline=8;md5=17213e93942fd27819359eebdf0341b7"

SRC_URI = "git://github.com/OpenVisionE2/extra_rc_models.git"

S = "${WORKDIR}/git"

inherit gitpkgv allarch

PV = "1.0+git${SRCPV}"
PKGV = "1.0+git${GITPKGV}"

do_install() {
	install -d ${D}/openvision-extra-rc-models
	cp  -R ${S}/* ${D}/openvision-extra-rc-models/
}

FILES_${PN} = "*"
