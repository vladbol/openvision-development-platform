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
