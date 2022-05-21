#!/bin/bash
yes |sudo apt update
yes |sudo apt upgrade
yes |sudo apt dist-upgrade
yes |sudo apt autoclean
yes |sudo apt clean
yes |sudo apt autoremove

if [ $? -eq 0 ]
then
	clear
	echo 'Все процессы выполнены успешно!'
	sleep 5
	exit
else
	echo 'В процессе возникли ошибки! Проверьте вывод выше!'
fi