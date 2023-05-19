#!/bin/bash

exit_sweep () {
    echo "exiting..."
	  sleep 1
	  exit
}

make_dir () {
    if [ ! -d IPsweep ]
     	then
    	mkdir IPsweep
    fi
}

ip_for_loop () {
    for h in `seq 1 254`; do
         	ping -c 1 $1.$h | grep "64 bytes" | cut -d " " -f 4 | tr -d ":"&
    	done > IPsweep/ips.txt
}

select_scan () {
    if [ "$1" == "" ]; then
   	  sudo nmap -iL IPsweep/ips.txt > IPsweep/ports.txt
	  elif [ "$1" == "-s" ]; then
   	  sudo nmap -sV -v -iL IPsweep/ips.txt > IPsweep/ports.txt
	  elif [ "$1" == "-a" ]; then
   	  sudo nmap -A -v -iL IPsweep/ips.txt > IPsweep/ports.txt
	  fi
}

target_scan () {
    if [ "$1" == "s" ]; then
   	  printf "\nEnter Target IP:\n"
  	  read target
    	scanning_services
    	sudo nmap -sV -v "$target" > IPsweep/services.txt
    	service_info
    	cat IPsweep/services.txt
    	printf "\n-Saved to IPsweep/services.txt\n"
    	line
	elif [ "$1" == "a" ]; then
    	printf "\nEnter Target IP:\n"
    	read target
    	agr_scan
    	sudo nmap -A -v "$target" > IPsweep/aggressive.txt
    	aggressive_info
  		cat IPsweep/aggressive.txt
    	printf "\n-Saved to IPsweep/services.txt\n"
	elif [ "$1" == "n" ]; then
    	exit_sweep
  else
  		echo "Not a valid selection"
	fi

}
