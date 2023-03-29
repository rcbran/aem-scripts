#!/bin/bash

FULL_BUILD='mvn clean install -PautoInstallSinglePackage'

main() {
    if [ "$#" -eq 0  ]; then
	    usage
    fi

    for var in "$@"
	do
    	case $var in
			BTD | btd | Btd)
	  			build_btd
	  			;;

			mrboston | MrBoston | mb | MB)
	  			build_bost
	  			;;

			fb | FB | fireball | Fireball)
	  			build_fb
	  			;;

			*)
				usage
				;;
		esac
	done
}

build_btd() {
	echo -e "\n[+] building global + btd";
	(cd ./global; $FULL_BUILD;)
    	(cd ./buffalotracedistillery; $FULL_BUILD;)
}

build_fb() {
	echo -e "\n[+] building global + fireball";
	(cd ./global; $FULL_BUILD;)
    	(cd ./fireball; $FULL_BUILD;)
}

build_bost() {
	echo -e "\n[+] building global + mrboston";
	(cd ./global; $FULL_BUILD;)
	(cd ./mrboston; $FULL_BUILD;)
}

usage() {
	echo -e "\nFailed to parse args"
	echo -e " - available args: fb, btd, mrboston\n"
	exit 1;
}

main "$@"
