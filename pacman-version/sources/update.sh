#!/bin/bash
sudo echo "Запушено обновление" >> /var/log/Help-Buttons/log.txt

yes |sudo pacman -Suy
if pacman -Qi yay > /dev/null #проверка наличия yay в системе
then
	yes |yay -Suy
fi

if [ $? -eq 0 ]; then
clear 
echo 'Обновлено!' 
sleep 3
exit
else
echo "Обновление не удалось, посмотрите вывод выше и задайте вопрос разработчику!"
fi