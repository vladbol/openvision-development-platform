#!/bin/sh
echo ""
RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'
echo "This is only for Open Vision Developers with push access"
echo ""
echo -e "First choose what kind of submodule update do you want?"
echo -e "Answers are in ${GREEN}green:${NC}"
echo -e "${GREEN}All ${NC}- ${GREEN}Specific"
echo -e ""
echo -e "${NC}Enter submodule type:${GREEN}"
echo -e ""
read SUBMODULETYPE
echo -e "${NC}"
if [ $SUBMODULETYPE != "All" -a $SUBMODULETYPE != "Specific" ]
then
	echo -e "${RED}Not a valid answer!${NC}"
	echo -e ""
	exit 0
fi
echo "Stage 1: git pull for new changes"
echo ""
if [ $SUBMODULETYPE = "Specific" ]
then
	echo -e "${NC}Enter submodule name without meta-:${GREEN}"
	echo -e ""
	read SUBMODULENAME
	echo -e "${NC}"
	cd meta-${SUBMODULENAME}
	echo "Checking out meta-${SUBMODULENAME} develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	echo "Stage 2: git add for new changes"
	echo ""
	git add meta-${SUBMODULENAME}
	git commit --dry-run
	read -p "The above changes will be committed and pushed to Open Vision, [A]bort [P]roceed: " choice
	if [ "$choice" = "P" -o "$choice" = "p" ];then
		git commit -S -m "Update meta-${SUBMODULENAME} submodule using submodule.sh"
		echo "Stage 3: git push for new changes"
		echo ""
		git push
		echo "Done: the repository got updated to its latest version!"
		echo ""
	else 
		exit 0
	fi
fi
if [ $SUBMODULETYPE = "All" ]
then
	cd meta-amiko
	echo "Checking out meta-amiko master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-ax
	echo "Checking out meta-ax develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-azbox
	echo "Checking out meta-azbox develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-beyonwiz
	echo "Checking out meta-beyonwiz develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-blackbox
	echo "Checking out meta-blackbox develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-broadmedia
	echo "Checking out meta-broadmedia develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-ceryon
	echo "Checking out meta-ceryon develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-clap
	echo "Checking out meta-clap develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-cube
	echo "Checking out meta-cube develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-dags
	echo "Checking out meta-dags develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-dinobot
	echo "Checking out meta-dinobot develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-dream
	echo "Checking out meta-dream develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-ebox
	echo "Checking out meta-ebox develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-edision
	echo "Checking out meta-edision develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-entwopia
	echo "Checking out meta-entwopia develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-formuler
	echo "Checking out meta-formuler master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-gb
	echo "Checking out meta-gb develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-gfutures
	echo "Checking out meta-gfutures master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-gi
	echo "Checking out meta-gi master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-gigablue
	echo "Checking out meta-gigablue master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-hd
	echo "Checking out meta-hd master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-hypercube
	echo "Checking out meta-hypercube develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-ini
	echo "Checking out meta-ini develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-ixuss
	echo "Checking out meta-ixuss develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-linkdroid
	echo "Checking out meta-linkdroid develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-maxytec
	echo "Checking out meta-maxytec master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-minix
	echo "Checking out meta-minix develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-miraclebox
	echo "Checking out meta-miraclebox master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-octagon
	echo "Checking out meta-octagon develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-odin
	echo "Checking out meta-odin develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-odroid
	echo "Checking out meta-odroid develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-protek
	echo "Checking out meta-protek develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-qviart-5
	echo "Checking out meta-qviart-5 master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-raspberrypi
	echo "Checking out meta-raspberrypi develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-sab
	echo "Checking out meta-sab master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-sh4
	echo "Checking out meta-sh4 develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-spycat
	echo "Checking out meta-spycat master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-tiviar
	echo "Checking out meta-tiviar develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-tripledot
	echo "Checking out meta-tripledot develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-uclan
	echo "Checking out meta-uclan develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-v8plus
	echo "Checking out meta-v8plus develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-viper
	echo "Checking out meta-viper develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-vuplus
	echo "Checking out meta-vuplus master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-wetek
	echo "Checking out meta-wetek develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-xcore
	echo "Checking out meta-xcore develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-xp
	echo "Checking out meta-xp master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-xpeedc
	echo "Checking out meta-xpeedc master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-xsarius.pli5
	echo "Checking out meta-xsarius.pli5 master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-xt
	echo "Checking out meta-xt develop branch:"
	git checkout develop
	git pull
	echo -e "\n"
	cd ..
	cd meta-xtrend
	echo "Checking out meta-xtrend master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	cd meta-zgemma
	echo "Checking out meta-zgemma master branch:"
	git checkout master
	git pull
	echo -e "\n"
	cd ..
	echo "Stage 2: git add for new changes"
	echo ""
	git add meta-*
	git commit --dry-run
	read -p "The above changes will be committed and pushed to Open Vision, [A]bort [P]roceed: " choice
	if [ "$choice" = "P" -o "$choice" = "p" ];then
		git commit -S -m "Update submodules using submodule.sh"
		echo "Stage 3: git push for new changes"
		echo ""
		git push
		echo "Done: all git repositories got updated to their latest versions!"
		echo ""
	else 
		exit 0
	fi
fi
