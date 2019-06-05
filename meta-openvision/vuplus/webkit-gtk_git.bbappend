SRC_URI = "git://github.com/OpenVuPlus/webkit-r95199-base.git;protocol=http;branch=${BRANCH};rev=${SRCREV} \
    file://0001-bison-3.patch \
    file://0001-fix-build-with-gcc-6.20.patch \
    file://0001-fix-build-issue-with-cglib-2.2.4.patch \
    file://webkit-gtk_fixed_crash_error.patch \
    file://maketokenizer.patch \
"
