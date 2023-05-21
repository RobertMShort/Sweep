#!/usr/bin/env bash

source ~/Documents/Sweep/banners.sh
source ~/Documents/Sweep/func.sh

sweep () {
	if ! type nmap > /dev/null; then
		echo "Nmap not installed...\n"
		echo "Install Nmap and come back!\n"
		echo "Try: sudo apt-get nmap"
	fi

	if [ "$1" == "-h" ]; then
		less ~/Sweep/help.txt
	elif [ "$1" == "" ] || [ "$1" == "-s" ] || [ "$1" == "-a" ]; then
		logo
		detect_OS
		make_dir
    		ip=$(ifconfig | awk '/broadcast/ {print $2}' | cut -c 1-9)
    		scanning_network
    		ip_for_loop "$ip"
    		sleep 1
    		active_hosts
    		cat ~/Sweep/ips.txt
    		printf "\n-Saved to ~/Sweep/ip.txt\n"
    		sleep 1
    		line
		scanning_ports

		select_scan "$1"

		active_ports

		cat ~/Sweep/ports.txt

   		printf "\n-Saved to ~/Sweep/ports.txt\n"

    		echo " " >> ~/Sweep/ips.txt
    			date >> ~/Sweep/ips.txt

		line
		options

		read run
		target_scan "$run"
   	 elif [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
   	 	logo
		detect_OS
   	 	make_dir
		scanning_network
		ip_for_loop "$1"
		sleep 1
    		active_hosts
    		cat ~/Sweep/ips.txt
    		printf "\n-Saved to ~/Sweep/ip.txt\n"
    		sleep 1
		line
		scanning_ports

		select_scan "$2"

		active_ports

		cat ~/Sweep/ports.txt

   		printf "\n-Saved to ~/Sweep/ports.txt\n"

    		echo " " >> ~/Sweep/ips.txt
    			date >> ~/Sweep/ips.txt

		line
		options

		read run

	    	target_scan "$run"
	else
		echo "Not a valid IP"
	fi
}

sweep "$1" "$2"
