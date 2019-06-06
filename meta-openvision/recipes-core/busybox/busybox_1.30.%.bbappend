FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
			file://mount_single_uuid.patch \
			file://mdev-mount.sh \
			file://inetd \
			file://inetd.conf \
			${@bb.utils.contains("MACHINE_FEATURES", "oldkernel", "file://old_kernel.patch", "", d)} \
			"
