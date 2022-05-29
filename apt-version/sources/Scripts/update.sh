#!/bin/bash
sudo echo "Запушено обновление" >> /var/log/Help-Buttons/log.txt
yes |sudo apt update
yes |sudo apt upgrade
yes |sudo apt dist-upgrade
yes |sudo apt autoclean
yes |sudo apt clean
yes |sudo apt autoremove

if [ $? -eq 0 ]
then
	for i in 5 4 3 2 1 0
	do
		clear
		echo "Все процессы выполнены успешно! [$i]"
		sleep 1
	done
	exit
else
	echo 'В процессе возникли ошибки! Проверьте вывод выше!'
fi