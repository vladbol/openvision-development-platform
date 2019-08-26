SUMMARY = "Enigma2 Skin UniverseHD"
MAINTAINER = "Open Vision Developers"
SECTION = "base"
PRIORITY = "required"
LICENSE = "proprietary"

require conf/license/license-gplv2.inc

inherit gitpkgv allarch

PV = "git${SRCPV}"
PKGV = "git${GITPKGV}"

SRC_URI="git://github.com/OpenVisionE2/UniverseHD-skin.git;protocol=git"

S = "${WORKDIR}/git"

FILES_${PN} = "/usr"

do_package_qa[noexec] = "1"

do_install() {
    cp -r  --preserve=mode,links ${S}/usr ${D}/
}

do_install_append() {
    # remove unused .pyc files
    find ${D}${libdir}/enigma2/python/ -name '*.pyc' -exec rm {} \;
}

do_compile_append() {
    python -O -m compileall ${S}
}

FILES_${PN}-src = "\
    ${libdir}/enigma2/python/*/*.py \
    ${libdir}/enigma2/python/*/*/*.py \
    ${libdir}/enigma2/python/*/*/*/*.py \
    ${libdir}/enigma2/python/*/*/*/*/*.py \
    ${libdir}/enigma2/python/*/*/*/*/*/*.py \
    "

CONFFILES_${PN} = " \
    /usr/share/enigma2/GBUniverseHD/construct/backgrounds/background-infobar.png \
    /usr/share/enigma2/GBUniverseHD/construct/backgrounds/background-symbol.png \
    /usr/share/enigma2/GBUniverseHD/construct/backgrounds/background-window.png \
    /usr/share/enigma2/GBUniverseHD/construct/backgrounds/background-window-details.png \
    /usr/share/enigma2/GBUniverseHD/construct/backgrounds/background-window-title.png \
    "
