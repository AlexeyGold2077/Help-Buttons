#!/bin/bash
sudo echo "Запушено обновление" >> /var/log/Help-Buttons/log.txt
yes |sudo apt update 
yes |sudo apt upgrade 
yes |sudo apt dist-upgrade
yes |sudo apt autoclean 
yes |sudo apt clean 
yes |sudo apt autoremove 
clear 
echo 'Обновлено!' 
sleep 3
exit