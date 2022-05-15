#!/bin/bash
sudo echo "Запушено обновление" >> /var/log/Help-Buttons/log.txt

yes |sudo pacman -Suy
yes |yay -Suy #сделать поиск установлен ли yay или еще какой либо менеджер!

if [ $? -eq 0 ]; then
clear 
echo 'Обновлено!' 
sleep 3
exit
else
echo "Обновление не удалось, посмотрите вывод выше и задайте вопрос разработчику!"
fi