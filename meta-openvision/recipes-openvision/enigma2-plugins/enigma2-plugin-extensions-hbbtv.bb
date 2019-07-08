DESCRIPTION = "VU+ HBBTV plugin"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=c9e255efa454e0155c1fd758df7dcaf3"
BRANCH = "vuplus_experimental"
S = "${WORKDIR}/git"
SRC_URI = "git://github.com/OpenVuPlus/dvbapp.git;protocol=http;branch=${BRANCH} \
        file://move-youtube-menu-entry.patch \
"

inherit gitpkgv

PV = "git${SRCPV}"
PKGV = "git${GITPKGV}"

RDEPENDS_${PN}  = "vuplus-opera-browser vuplus-hbbtv-dumpait"
FILES_${PN}     = "${libdir}/enigma2/python/Plugins/Extensions/HbbTV/* \
        ${libdir}/enigma2/python/Components/Sources/* \
        ${libdir}/enigma2/python/Components/Converter/* \
"

do_install() {
	install -d ${D}${libdir}/enigma2/python/Plugins/Extensions/HbbTV
	install -m 0644 ${S}/lib/python/Plugins/Extensions/HbbTV/*.py ${D}${libdir}/enigma2/python/Plugins/Extensions/HbbTV
	install -m 0644 ${S}/lib/python/Plugins/Extensions/HbbTV/keymap.xml ${D}${libdir}/enigma2/python/Plugins/Extensions/HbbTV

	install -d ${D}${libdir}/enigma2/python/Components/Sources
	install -m 0644 ${S}/lib/python/Components/Sources/HbbtvApplication.py ${D}${libdir}/enigma2/python/Components/Sources
	install -d ${D}${libdir}/enigma2/python/Components/Converter
	install -m 0644 ${S}/lib/python/Components/Converter/HbbtvApplicationInfo.py ${D}${libdir}/enigma2/python/Components/Converter

	install -m 0755 -d ${D}${libdir}/enigma2/python/Plugins/Extensions/HbbTV/locale
	cp -av ${S}/lib/python/Plugins/Extensions/HbbTV/locale/*.po ${D}${libdir}/enigma2/python/Plugins/Extensions/HbbTV/locale

	python -O -m compileall ${D}${libdir}/enigma2/python/Plugins/
}

do_install_append() {
	rm -rf ${D}/usr/src
}
