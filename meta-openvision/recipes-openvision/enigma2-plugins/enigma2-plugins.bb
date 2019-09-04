SUMMARY = "Original plugins for Enigma2"
MAINTAINER = "Open Vision Developers"
LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"

PROVIDES = "${PN} \
    enigma2-plugin-extensions-fancontrol2 \
    "

inherit autotools-brokensep gitpkgv pythonnative pkgconfig gettext

PV = "git${SRCPV}"
PKGV = "git${GITPKGV}"

SRC_URI = "git://github.com/OpenVisionE2/enigma2-plugins.git;protocol=http"

S = "${WORKDIR}/git"

DEPENDS = "\
    enigma2 \
    python-pyopenssl \
    python-gdata \
    streamripper \
    python-mutagen \
    python-twisted \
    python-daap \
    python-google-api-client \
    python-httplib2 \
    python-youtube-dl \
    dvdbackup \
    libav \
    libshowiframe \
    libcddb \
    libtirpc \
    nmap \
    "

RDEPENDS_${PN} = "python-ctypes"

EXTRA_OECONF = "\
    BUILD_SYS=${BUILD_SYS} \
    HOST_SYS=${HOST_SYS} \
    STAGING_INCDIR=${STAGING_INCDIR} \
    STAGING_LIBDIR=${STAGING_LIBDIR} \
    --without-debug \
    --with-po \
    --with-boxtype=${MACHINE} \
    --with-boxbrand=${BOX_BRAND} \
    --with-gstversion=${GST_VERSION} \
    "

CFLAGS += "-I${STAGING_INCDIR}/tirpc"
LDFLAGS += "-ltirpc"
CXXFLAGS = " -std=c++11"

RREPLACES_enigma2-plugin-skincomponents-eventlist = "enigma2-plugin-components-eventlist"
RCONFLICTS_enigma2-plugin-skincomponents-eventlist = "enigma2-plugin-components-eventlist"

CONFFILES_${PN} += "${sysconfdir}/enigma2/movietags"
FILES_${PN} += " ${datadir}/enigma2 ${datadir}/fonts "
FILES_${PN}-meta = "${datadir}/meta"
FILES_enigma2-plugin-extensions-bmediacenter += " ${libdir}/enigma2/python/Components/Renderer/LizWatches.pyo ${libdir}/enigma2/python/Components/Converter/LizExtraNumText.pyo"
FILES_enigma2-plugin-extensions-bmediacenter-src += " ${libdir}/enigma2/python/Components/Renderer/LizWatches.py ${libdir}/enigma2/python/Components/Converter/LizExtraNumText.py"
FILES_enigma2-plugin-skincomponents-channelselectionshorttitle += " ${libdir}/enigma2/python/Components/Converter/ChannelSelectionShortTitle.pyo"
FILES_enigma2-plugin-skincomponents-channelselectionshorttitle-src += " ${libdir}/enigma2/python/Components/Converter/ChannelSelectionShortTitle.py"
FILES_enigma2-plugin-skincomponents-eventlist += " ${libdir}/enigma2/python/Components/Renderer/EventListDisplay.pyo ${libdir}/enigma2/python/Components/Converter/EventList.pyo"
FILES_enigma2-plugin-skincomponents-eventlist-src += " ${libdir}/enigma2/python/Components/Renderer/EventListDisplay.py ${libdir}/enigma2/python/Components/Converter/EventList.py"
FILES_enigma2-plugin-skincomponents-eventposition += " ${libdir}/enigma2/python/Components/Converter/EventPosition.pyo"
FILES_enigma2-plugin-skincomponents-eventposition-src += " ${libdir}/enigma2/python/Components/Converter/EventPosition.py"
FILES_enigma2-plugin-skincomponents-weathercomponent += " ${libdir}/enigma2/python/Components/WeatherMSN.pyo ${libdir}/enigma2/python/Components/Converter/MSNWeather.pyo ${libdir}/enigma2/python/Components/Sources/MSNWeather.pyo ${libdir}/enigma2/python/Components/Renderer/MSNWeatherPixmap.pyo"
FILES_enigma2-plugin-skincomponents-weathercomponent-src += " ${libdir}/enigma2/python/Components/WeatherMSN.py ${libdir}/enigma2/python/Components/Converter/MSNWeather.py ${libdir}/enigma2/python/Components/Sources/MSNWeather.py ${libdir}/enigma2/python/Components/Renderer/MSNWeatherPixmap.py"
FILES_enigma2-plugin-skincomponents-reftopiconname += " ${libdir}/enigma2/python/Components/Converter/RefToPiconName.pyo"
FILES_enigma2-plugin-skincomponents-reftopiconname-src += " ${libdir}/enigma2/python/Components/Converter/RefToPiconName.py"

PACKAGES += "${PN}-meta ${PN}-build-dependencies enigma2-plugin-skincomponents-channelselectionshorttitle-src enigma2-plugin-skincomponents-eventlist-src enigma2-plugin-skincomponents-eventposition-src enigma2-plugin-skincomponents-weathercomponent-src enigma2-plugin-skincomponents-reftopiconname enigma2-plugin-skincomponents-reftopiconname-src"

do_compile_append() {
    python -O -m compileall ${S}
}

do_install_append() {
    # remove unused .pyc files
    find ${D}${libdir}/enigma2/python/ -name '*.pyc' -exec rm {} \;
    # make scripts executable
    find "${D}" -name '*.sh' -exec chmod a+x '{}' ';'
}

do_package_qa() {
}

python populate_packages_prepend() {
    enigma2_plugindir = bb.data.expand('${libdir}/enigma2/python/Plugins', d)
    do_split_packages(d, enigma2_plugindir, '^(\w+/\w+)/[a-zA-Z0-9_]+.*$', 'enigma2-plugin-%s', '%s', recursive=True, match_path=True, prepend=True)
    do_split_packages(d, enigma2_plugindir, '^(\w+/\w+)/.*\.py$', 'enigma2-plugin-%s-src', '%s (source files)', recursive=True, match_path=True, prepend=True)
    do_split_packages(d, enigma2_plugindir, '^(\w+/\w+)/.*\.la$', 'enigma2-plugin-%s-dev', '%s (development)', recursive=True, match_path=True, prepend=True)
    do_split_packages(d, enigma2_plugindir, '^(\w+/\w+)/.*\.a$', 'enigma2-plugin-%s-staticdev', '%s (static development)', recursive=True, match_path=True, prepend=True)
    do_split_packages(d, enigma2_plugindir, '^(\w+/\w+)/(.*/)?\.debug/.*$', 'enigma2-plugin-%s-dbg', '%s (debug)', recursive=True, match_path=True, prepend=True)
    do_split_packages(d, enigma2_plugindir, '^(\w+/\w+)/.*\/.*\.po$', 'enigma2-plugin-%s-po', '%s (translations)', recursive=True, match_path=True, prepend=True)
}
