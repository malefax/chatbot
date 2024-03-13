#!/usr/bin/bash
ifconfig > ifconfig.txt;
iface=$(wc -l ifconfig.txt > wordline.txt | cat wordline.txt | cut -d " " -f 1);
R='\033[0;31m' ;  #'0;31' is Red's ANSI color code
G='\033[0;32m';   #'0;32' is Green's ANSI color code
Y='\033[1;33m';   #'1;32' is Yellow's ANSI color code
B='\033[0;34m';   #'0;34' is Blue's ANSI color code
echo -e "${G}[*]welcome to linux chat bot--------------------------------------------------------------------------------\n"| lolcat;
cowsay -f daemon devilcorp | lolcat;
while [ true ];
	do 
		echo -e "${R}[*]select interface you want to chat with\n--------------------------------\n" | lolcat;
		sleep 1;
		if [[ $iface  -gt 19 ]]; then
			echo -e "${G}[*] avialable interfaces\n";
			INTERFACE1=$(sed -n "1p" ifconfig.txt | cut -d " " -f 1 | tr -d ":");
			echo -e "${B}[1] $INTERFACE1\n ";
			INTERFACE2=$(sed -n "20p" ifconfig.txt |cut -d " " -f 1 | tr -d ":");
			echo -e "${R}[2]  $INTERFACE2";
			read -s -p "select the interface" inet;
			if [[ $inet -eq 1 ]]; then
				ip_addr=$(sed -n "1p" ifconfig.txt | cut -d " " -f 10 );
				read -s -p "${G}[*]enter the port number:\n" port_number;
				nc -nvp $ip_addr $port_number;
			elif [[ $inet -eq 2 ]]; then
				ip_addr=$(sed -n "20p" ifconfig.txt | cut -d " " -f 10);
				read -s -p "${B}[*] enter the port number\n" port_number;
				nc -nvlp $ip_addr $port_number;
			else 
				echo -e "${R}you have enterd wrong credwntials -_-\n"
			fi
		else
			echo -e "${G}[*]available interfaces\n--------------------\n"| lolcat;	
			INTERFACE1=$(sed -n "1p" ifconfig.txt | cut -d " " -f 1 | tr -d ":");
			echo -e "${B}[1] $INTERFACE1\n"| lolcat;
			echo "[*]select an interface"|lolcat && read -s inet && echo -e "\n";
			if [[ $inet -eq 1 ]]; then
				ip_addr=$(sed -n "2p" ifconfig.txt | cut -d " " -f 10);
				echo "[*]enter the port number"|lolcat && read -s port_number && echo -e "\n";
				 nc -lv $ip_addr $port_number;
			else
				echo -e "${B}you have enterd wrong credential-_-\n"; 
			fi
		fi		
	done

