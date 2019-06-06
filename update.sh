#!/bin/sh
echo ""
if [ $# -eq 0 ]
then
	BUILDDIR="build"
else
	BUILDDIR="$1"
fi
RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
echo "Open Vision by"
echo "https://github.com/orgs/OpenVisionE2/people"
echo ""
echo "Each time you run this script all git repositories will get updated to their latest versions!"
echo ""
echo "For extra RC support you need to add your STB files to https://github.com/OpenVisionE2/extra_rc_models"
echo ""
echo -e "${RED}Is there a merge conflict with repos?"
echo -e "Answers are in ${GREEN}green:${NC}"
echo -e ""
echo -e "${GREEN}No ${NC}- ${GREEN}Yes"
echo -e ""
echo -e "${RED}Enter conflict mode:${NC}"
echo -e "${GREEN}"
read CONFLICTMODE
echo -e "${NC}"
if [ $CONFLICTMODE != "Yes" -a $CONFLICTMODE != "No" ]
then
	echo -e "${RED}Not a valid answer!${NC}"
	echo -e ""
	exit 0
fi
echo -e "${RED}Updating from git, please wait ...${NC}"
echo ""
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd "${SCRIPTPATH}"
git pull
git submodule sync
git submodule update --init
echo ""
echo -e "${RED}Done!${NC}"
echo ""
METAS="$( ls | grep meta- | tr '\n' ' ' | sed 's/ $//g' )"
if [ $CONFLICTMODE = "No" ]
then
	git pull
fi
if [ $CONFLICTMODE = "Yes" ]
then
	# Lets restore everything first.
	git checkout .
	# Clear the modifications we've done to the submodules before updating.
	git submodule foreach git checkout .
	git pull --rebase
fi
sed -i "s#BUILD_DIR = \$(CURDIR)/.*#BUILD_DIR = \$(CURDIR)/${BUILDDIR}#g" Makefile
echo ""
echo -e "${YELLOW}Check for BOX_BRAND required changes ...${NC}"
echo ""
if grep -Fqi "BOX_BRAND" meta-amiko/conf/machine/include/amiko.inc
then
    echo -e "${BLUE}You have BOX_BRAND in amiko.inc${NC}"
else
    echo -e "${YELLOW}We need to modify amiko.inc${NC}"
    echo $'BOX_BRAND = "amiko"' >> meta-amiko/conf/machine/include/amiko.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-formuler/conf/machine/include/formuler.inc
then
    echo -e "${BLUE}You have BOX_BRAND in formuler.inc${NC}"
else
    echo -e "${YELLOW}We need to modify formuler.inc${NC}"
    echo $'BOX_BRAND = "formuler"' >> meta-formuler/conf/machine/include/formuler.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-gfutures/conf/machine/include/hd-essential.inc
then
    echo -e "${BLUE}You have BOX_BRAND in hd-essential.inc${NC}"
else
    echo -e "${YELLOW}We need to modify hd-essential.inc${NC}"
    echo $'BOX_BRAND = "gfutures"' >> meta-gfutures/conf/machine/include/hd-essential.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-gi/conf/machine/include/et7000mini.inc
then
    echo -e "${BLUE}You have BOX_BRAND in et7000mini.inc${NC}"
else
    echo -e "${YELLOW}We need to modify et7000mini.inc${NC}"
    echo $'BOX_BRAND = "ultramini"' >> meta-gi/conf/machine/include/et7000mini.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-gi/conf/machine/include/et1x000.inc
then
    echo -e "${BLUE}You have BOX_BRAND in et1x000.inc${NC}"
else
    echo -e "${YELLOW}We need to modify et1x000.inc${NC}"
    echo $'BOX_BRAND = "xtrend"' >> meta-gi/conf/machine/include/et1x000.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-gigablue/conf/machine/include/gigablue.inc
then
    echo -e "${BLUE}You have BOX_BRAND in gigablue.inc${NC}"
else
    echo -e "${YELLOW}We need to modify gigablue.inc${NC}"
    echo $'BOX_BRAND = "gigablue"' >> meta-gigablue/conf/machine/include/gigablue.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-maxytec/conf/machine/include/maxytec-essential.inc
then
    echo -e "${BLUE}You have BOX_BRAND in maxytec-essential.inc${NC}"
else
    echo -e "${YELLOW}We need to modify maxytec-essential.inc${NC}"
    echo $'BOX_BRAND = "maxytec"' >> meta-maxytec/conf/machine/include/maxytec-essential.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-miraclebox/conf/machine/include/miraclebox.inc
then
    echo -e "${BLUE}You have BOX_BRAND in miraclebox.inc${NC}"
else
    echo -e "${YELLOW}We need to modify miraclebox.inc${NC}"
    echo $'BOX_BRAND = "ini"' >> meta-miraclebox/conf/machine/include/miraclebox.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-qviart-5/conf/machine/include/qviart-wifi.inc
then
    echo -e "${BLUE}You have BOX_BRAND in qviart-wifi.inc${NC}"
else
    echo -e "${YELLOW}We need to modify qviart-wifi.inc${NC}"
    echo $'BOX_BRAND = "dags"' >> meta-qviart-5/conf/machine/include/qviart-wifi.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-sab/conf/machine/include/alphatriplehd.inc
then
    echo -e "${BLUE}You have BOX_BRAND in alphatriplehd.inc${NC}"
else
    echo -e "${YELLOW}We need to modify alphatriplehd.inc${NC}"
    echo $'BOX_BRAND = "broadmedia"' >> meta-sab/conf/machine/include/alphatriplehd.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-spycat/conf/machine/include/build-extras.inc
then
    echo -e "${BLUE}You have BOX_BRAND in build-extras.inc${NC}"
else
    echo -e "${YELLOW}We need to modify build-extras.inc${NC}"
    echo $'BOX_BRAND = "xcore"' >> meta-spycat/conf/machine/include/build-extras.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-vuplus/conf/machine/include/vuxxo.inc
then
    echo -e "${BLUE}You have BOX_BRAND in vuxxo.inc${NC}"
else
    echo -e "${YELLOW}We need to modify vuxxo.inc${NC}"
    echo $'BOX_BRAND = "vuplus"' >> meta-vuplus/conf/machine/include/vuxxo.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-vuplus/conf/machine/include/vuxxo2.inc
then
    echo -e "${BLUE}You have BOX_BRAND in vuxxo2.inc${NC}"
else
    echo -e "${YELLOW}We need to modify vuxxo2.inc${NC}"
    echo $'BOX_BRAND = "vuplus"' >> meta-vuplus/conf/machine/include/vuxxo2.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-vuplus/conf/machine/include/vuxxo4k.inc
then
    echo -e "${BLUE}You have BOX_BRAND in vuxxo4k.inc${NC}"
else
    echo -e "${YELLOW}We need to modify vuxxo4k.inc${NC}"
    echo $'BOX_BRAND = "vuplus"' >> meta-vuplus/conf/machine/include/vuxxo4k.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-xp/conf/machine/include/xp.inc
then
    echo -e "${BLUE}You have BOX_BRAND in xp.inc${NC}"
else
    echo -e "${YELLOW}We need to modify xp.inc${NC}"
    echo $'BOX_BRAND = "xp"' >> meta-xp/conf/machine/include/xp.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-xpeedc/conf/machine/include/xpeedc.inc
then
    echo -e "${BLUE}You have BOX_BRAND in xpeedc.inc${NC}"
else
    echo -e "${YELLOW}We need to modify xpeedc.inc${NC}"
    echo $'BOX_BRAND = "ultramini"' >> meta-xpeedc/conf/machine/include/xpeedc.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-xsarius.pli5/conf/machine/include/xsarius-wifi.inc
then
    echo -e "${BLUE}You have BOX_BRAND in xsarius-wifi.inc${NC}"
else
    echo -e "${YELLOW}We need to modify xsarius-wifi.inc${NC}"
    echo $'BOX_BRAND = "dags"' >> meta-xsarius.pli5/conf/machine/include/xsarius-wifi.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-xtrend/conf/machine/include/et.inc
then
    echo -e "${BLUE}You have BOX_BRAND in et.inc${NC}"
else
    echo -e "${YELLOW}We need to modify et.inc${NC}"
    echo $'BOX_BRAND = "xtrend"' >> meta-xtrend/conf/machine/include/et.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-xtrend/conf/machine/include/et7k.inc
then
    echo -e "${BLUE}You have BOX_BRAND in et7k.inc${NC}"
else
    echo -e "${YELLOW}We need to modify et7k.inc${NC}"
    echo $'BOX_BRAND = "xtrend"' >> meta-xtrend/conf/machine/include/et7k.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
if grep -Fqi "BOX_BRAND" meta-zgemma/conf/machine/include/zgemma-essential.inc
then
    echo -e "${BLUE}You have BOX_BRAND in zgemma-essential.inc${NC}"
else
    echo -e "${YELLOW}We need to modify zgemma-essential.inc${NC}"
    echo $'BOX_BRAND = "airdigital"' >> meta-zgemma/conf/machine/include/zgemma-essential.inc
    echo -e "${BLUE}Done, now you can use BOX_BRAND${NC}"
fi
echo ""
echo -e "${RED}Let us fix the image names ...${NC}"
echo ""
find -maxdepth 1 -name "meta-am*" -type d -exec find {} -type f \( -iname \*.conf -o -iname \*.inc \) \; | xargs -L1 sed -i 's|${DISTRO_NAME}-${DISTRO_VERSION}-${MACHINE}|${IMAGE_NAME}|g'
find -maxdepth 1 -name "meta-f*" -type d -exec find {} -type f \( -iname \*.conf -o -iname \*.inc \) \; | xargs -L1 sed -i 's|${DISTRO_NAME}-${DISTRO_VERSION}-${MACHINE}|${IMAGE_NAME}|g'
find -maxdepth 1 -name "meta-gf*" -type d -exec find {} -type f \( -iname \*.conf -o -iname \*.inc \) \; | xargs -L1 sed -i 's|${DISTRO_NAME}-${DISTRO_VERSION}-${MACHINE}|${IMAGE_NAME}|g'
find -maxdepth 1 -name "meta-gi*" -type d -exec find {} -type f \( -iname \*.conf -o -iname \*.inc \) \; | xargs -L1 sed -i 's|${DISTRO_NAME}-${DISTRO_VERSION}-${MACHINE}|${IMAGE_NAME}|g'
find -maxdepth 1 -name "meta-ma*" -type d -exec find {} -type f \( -iname \*.conf -o -iname \*.inc \) \; | xargs -L1 sed -i 's|${DISTRO_NAME}-${DISTRO_VERSION}-${MACHINE}|${IMAGE_NAME}|g'
find -maxdepth 1 -name "meta-mir*" -type d -exec find {} -type f \( -iname \*.conf -o -iname \*.inc \) \; | xargs -L1 sed -i 's|${DISTRO_NAME}-${DISTRO_VERSION}-${MACHINE}|${IMAGE_NAME}|g'
find -maxdepth 1 -name "meta-qv*" -type d -exec find {} -type f \( -iname \*.conf -o -iname \*.inc \) \; | xargs -L1 sed -i 's|${DISTRO_NAME}-${DISTRO_VERSION}-${MACHINE}|${IMAGE_NAME}|g'
find -maxdepth 1 -name "meta-sa*" -type d -exec find {} -type f \( -iname \*.conf -o -iname \*.inc \) \; | xargs -L1 sed -i 's|${DISTRO_NAME}-${DISTRO_VERSION}-${MACHINE}|${IMAGE_NAME}|g'
find -maxdepth 1 -name "meta-sp*" -type d -exec find {} -type f \( -iname \*.conf -o -iname \*.inc \) \; | xargs -L1 sed -i 's|${DISTRO_NAME}-${DISTRO_VERSION}-${MACHINE}|${IMAGE_NAME}|g'
find -maxdepth 1 -name "meta-vu*" -type d -exec find {} -type f \( -iname \*.conf -o -iname \*.inc \) \; | xargs -L1 sed -i 's|${DISTRO_NAME}-${DISTRO_VERSION}-${MACHINE}|${IMAGE_NAME}|g'
find -maxdepth 1 -name "meta-xp*" -type d -exec find {} -type f \( -iname \*.conf -o -iname \*.inc \) \; | xargs -L1 sed -i 's|${DISTRO_NAME}-${DISTRO_VERSION}-${MACHINE}|${IMAGE_NAME}|g'
find -maxdepth 1 -name "meta-z*" -type d -exec find {} -type f \( -iname \*.conf -o -iname \*.inc \) \; | xargs -L1 sed -i 's|${DISTRO_NAME}-${DISTRO_VERSION}-${MACHINE}|${IMAGE_NAME}|g'
echo -e "${RED}Done!${NC}"
