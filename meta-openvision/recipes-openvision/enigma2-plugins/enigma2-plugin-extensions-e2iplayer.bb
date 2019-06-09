SUMMARY = "E2i Player for E2"
DESCRIPTION = "E2i Player for E2"
HOMEPAGE = "http://www.iptvplayer.gitlab.io/"
SECTION = "multimedia"
LICENSE = "PD"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
SRC_URI = "git://github.com/OpenVisionE2/e2iplayer-for-e2.git;protocol=http"

S = "${WORKDIR}/git"

inherit gitpkgv

PV = "git${SRCPV}"
PKGV = "git${GITPKGV}"

inherit allarch distutils-openplugins gettext

RCONFLICTS_${PN} = "enigma2-plugin-extensions-iptvplayer"
RREPLACES_${PN} = "enigma2-plugin-extensions-iptvplayer"

DEPENDS = "gettext-native python"
RRECOMMENDS_${PN} = " \
	enigma2-plugin-extensions-e2iplayer-deps \
	python-compression \
	python-core \
	python-e2icjson \
	python-html \
	python-json \
	python-shell \
	python-subprocess \
	python-textutils \
	"

RDEPENDS_{PN}-src = "${PN}"
FILES_${PN}-src = " \
	${libdir}/enigma2/python/Plugins/*/*.py \
	${libdir}/enigma2/python/Plugins/*/*/*.py \
	${libdir}/enigma2/python/Plugins/*/*/*/*.py \
	${libdir}/enigma2/python/Plugins/*/*/*/*/*.py \
	${libdir}/enigma2/python/Plugins/*/*/*/*/*/*.py \
	${libdir}/enigma2/python/Plugins/*-py2.7.egg-info/* \
	${libdir}/enigma2/python/Plugins/*/locale/*/LC_MESSAGES/*.po \
	"

deltask package_qa
