SUMMARY = "UCL is a portable lossless data compression library written in ANSI C."
HOMEPAGE = "http://www.oberhumer.com/opensource/ucl/"
SECTION = "libs"
PRIORITY = "optional"
LICENSE = "GPL-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

inherit autotools-brokensep

SRC_URI = " \
	http://www.oberhumer.com/opensource/ucl/download/ucl-1.03.tar.gz \
	file://ucl_configure_fix.patch;patch=1 \
	"


SRC_URI[md5sum] = "852bd691d8abc75b52053465846fba34"
SRC_URI[sha256sum] = "b865299ffd45d73412293369c9754b07637680e5c826915f097577cd27350348"

BBCLASSEXTEND += "native nativesdk"
