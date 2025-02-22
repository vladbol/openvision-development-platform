DESCRIPTION = "WeatherPlugin2 by Dr.Best modified by RAED"
MAINTAINER = "Open Vision Developers"
LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"

inherit gitpkgv distutils-openplugins gettext

PV = "1.0+git${SRCPV}"
PKGV = "1.0+git${GITPKGV}"

SRC_URI = "git://github.com/OpenVisionE2/WeatherPlugin2.git;protocol=git"

FILES_${PN} = "/usr/"

S = "${WORKDIR}/git"

do_compile() {
	python -O -m compileall ${S}${libdir}/enigma2/python/
}

do_install() {
	install -d ${D}/usr
	cp -r ${S}/usr/* ${D}/usr/
}

FILES_${PN}-src = "\
	${libdir}/enigma2/python/Plugins/Extensions/WeatherPlugin2/*.py \
	${libdir}/enigma2/python/Plugins/SystemPlugins/WeatherComponentHandler/*.py \
	${libdir}/enigma2/python/Components/*.py \
	${libdir}/enigma2/python/Components/Sources/*.py \
	${libdir}/enigma2/python/Components/Renderer/*.py \
	${libdir}/enigma2/python/Components/Converter/*.py \
"
