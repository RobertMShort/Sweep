#!/bin/bash

exit_sweep () {
    echo "exiting..."
	  sleep 1
	  exit
}

make_dir () {
    if [ ! -d ~/Sweep_Docs ]
     	then
    	mkdir ~/Sweep_Docs
    fi
}

ip_for_loop () {
    for h in `seq 1 254`; do
         	ping -c 1 $1.$h | grep "64 bytes" | cut -d " " -f 4 | tr -d ":"&
    	done > ~/Sweep_Docs/ips.txt
}

select_scan () {
    if [ "$1" == "" ]; then
   	  sudo nmap -iL ~/Sweep_Docs/ips.txt > ~/Sweep_Docs/ports.txt
    elif [ "$1" == "-s" ]; then
   	  sudo nmap -sV -v -iL ~/Sweep_Docs/ips.txt > ~/Sweep_Docs/ports.txt
    elif [ "$1" == "-a" ]; then
   	  sudo nmap -A -v -iL ~/Sweep_Docs/ips.txt > ~/Sweep_Docs/ports.txt
    fi
}

target_scan () {
    if [ "$1" == "s" ]; then
   	  printf "\nEnter Target IP:\n"
  	  read target
    	scanning_services
    	sudo nmap -sV -v "$target" > ~/Sweep_Docs/services.txt
    	service_info
    	cat ~/Sweep_Docs/services.txt
    	printf "\n-Saved to ~/Sweep_Docs/services.txt\n"
    	line
    elif [ "$1" == "a" ]; then
    	printf "\nEnter Target IP:\n"
    	read target
    	agr_scan
    	sudo nmap -A -v "$target" > ~/Sweep_Docs/aggressive.txt
    	aggressive_info
  		cat ~/Sweep/aggressive.txt
    	printf "\n-Saved to ~/Sweep_Docs/services.txt\n"
    elif [ "$1" == "q" ]; then
    	exit_sweep
    else
  		echo "Not a valid selection"
    fi

}

detect_OS () {
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		echo " For Linux"
	elif [[ "$OSTYPE" == "darwin"* ]]; then
        	echo " For Mac"
	fi
}
