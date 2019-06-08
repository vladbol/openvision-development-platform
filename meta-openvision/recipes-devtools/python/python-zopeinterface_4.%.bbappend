include python-package-split.inc

RDEPENDS_{PN}-src = "${PN}"
FILES_${PN}-src += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.py"
FILES_${PN}-src += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*/*.py"

# some txt files which should go into -doc
FILES_${PN}-doc += "${PYTHON_SITEPACKAGES_DIR}/*-info"
