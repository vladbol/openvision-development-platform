SECTION = "kernel/modules"
LICENSE = "CLOSED"
PRIORITY = "required"
MAINTAINER = "Open Vision Developers"

PACKAGE_ARCH = "${MACHINE_ARCH}"

SRC_URI = "file://openvisionmodule.c file://Makefile"

S = "${WORKDIR}"

inherit module machine_kernel_pr

EXTRA_OEMAKE = "KSRC=${STAGING_KERNEL_BUILDDIR}"

do_compile() {
	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
	oe_runmake -C "${STAGING_KERNEL_BUILDDIR}" M="${S}" modules
}

do_install () {
    install -d ${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/openvisionmodule
    install -m 0644 ${S}/openvisionmodule.ko ${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/openvisionmodule
    install -d ${D}/${sysconfdir}/modules-load.d
    echo openvisionmodule >> ${D}/${sysconfdir}/modules-load.d/zzopenvisionmodule.conf
}

FILES_${PN} += "${sysconfdir}/modules-load.d/zzopenvisionmodule.conf"
