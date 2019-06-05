SRC_URI = "git://github.com/OpenVuPlus/dvbapp.git;protocol=http;branch=${BRANCH};tag=${SRCREV}"

do_install() {
	install -d  ${D}/usr/lib/enigma2/python/Plugins/SystemPlugins/ManualFancontrol
	install -d  ${D}/usr/lib/enigma2/python/Plugins/SystemPlugins/LEDBrightnessSetup

	install -m 0644 ${S}/lib/python/Plugins/SystemPlugins/ManualFancontrol/*.py \
	${D}/usr/lib/enigma2/python/Plugins/SystemPlugins/ManualFancontrol

	install -m 0644 ${S}/lib/python/Plugins/SystemPlugins/LEDBrightnessSetup/*.py \
	${D}/usr/lib/enigma2/python/Plugins/SystemPlugins/LEDBrightnessSetup
	
	python -O -m compileall ${D}/usr/lib/enigma2/python/Plugins/
}

FILES_enigma2-plugin-systemplugins-manualfancontrol = "/usr/lib/enigma2/python/Plugins/SystemPlugins/ManualFancontrol"
FILES_enigma2-plugin-systemplugins-ledbrightnesssetup = "/usr/lib/enigma2/python/Plugins/SystemPlugins/LEDBrightnessSetup"

PACKAGES = "\
	enigma2-plugin-systemplugins-manualfancontrol \
	enigma2-plugin-systemplugins-ledbrightnesssetup \
	"
