SUMMARY = "E2i Player for E2"
DESCRIPTION = "E2i Player for E2"
SECTION = "multimedia"
LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"

SRC_URI = "git://github.com/persianpros/e2iplayer.git;protocol=http"

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
