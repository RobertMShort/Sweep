# Sweep
Ping sweep and port scanner


 ███████╗██╗    ██╗███████╗███████╗██████╗
 ██╔════╝██║    ██║██╔════╝██╔════╝██╔══██╗
 ███████╗██║ █╗ ██║█████╗  █████╗  ██████╔╝
 ╚════██║██║███╗██║██╔══╝  ██╔══╝  ██╔═══╝ 
 ███████║╚███╔███╔╝███████╗███████╗██║     
 ╚══════╝ ╚══╝╚══╝ ╚══════╝╚══════╝╚═╝ 

HELP

Simple Overview: 

Pings the entire network to identify active hosts.
Performs port scans on active hosts.
Displays relevant results right in the terminal.
Saves full scan output to files for review/records. 

Requirements:

- Must have Nmap installed.
- Works on Linux 
- Made for Bash

- This is a work in progress...

Features:

Will scan your internal network by itself with no switches or input. 
Takes private IP network portion and scans automatically.

You can specify a network manually by entering network portion of IP.

Can run a service or aggressive scan at start or after intial default scan.
(More scan options to come.)

Examples:

./sweep.sh  : Runs basic ping and port scans using private network.

./sweep.sh 192.168.1 : Runs basic ping and port scan on 192.168.1

./sweep.sh -s : Runs ping scan and service port scan

./sweep.sh -a : Runs ping scan and aggressive port scan

./sweep.sh 192.168.1 -s : Runs service port scan on 192.168.1

./sweep.sh 192.168.1 -a : Runs aggressive port scan on 192.168.1

Help:

./sweep.sh -h

or help file located in IPsweep/help.txt 


More coming soon....
