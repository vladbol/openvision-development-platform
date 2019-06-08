DESCRIPTION = "Duktape is an embeddable Javascript engine, with a focus on portability and compact footprint."
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fddbe4ed8ac933555f193488d973da85"

SRC_URI = "https://raw.githubusercontent.com/OpenVisionE2/linux-firmwares/master/duktape-2.1.99.tar.xz"

SRC_URI[md5sum] = "af8d49fe1157d166f64ff704afc32eef"

do_compile() {
	oe_runmake -f Makefile.cmdline
}

do_install() {
	install -d ${D}${bindir}
	install -m 0755 ${S}/duk ${D}${bindir}/
}

FILES_${PN} = "${bindir}"
