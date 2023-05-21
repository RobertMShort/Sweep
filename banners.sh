#!/bin/bash

logo () {
printf "\n"
cat .logo.txt                                     	 
}

line () {
    echo "--------------------------------------------------------------"
}
scanning_network () {
    printf "\nScanning Network...\n\n"
}

scanning_ports () {
    printf "\nScanning Ports...\n\n"
}

scanning_services () {
    printf "\nScanning Services...\n"
}

active_hosts () {
    echo "-------------------------Active Hosts-------------------------"
}

active_ports () {
    echo "------------------------Active Ports--------------------------"
}

service_info () {
    echo "-------------------------Service Info-------------------------"
}

agr_scan () {
    printf "\nRunning aggressive scan...\n"
}

aggressive_info () {
    echo "-------------------------Aggressive Scan Info-------------------------"
}

options () {
    printf "\nEnter 's' to run service scan on target, \n'a' for aggressive scan, \n'q' to quit: "
}
