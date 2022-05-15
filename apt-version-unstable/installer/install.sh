#!/bin/bash
echo "Начало установки..."

echo "Создание директорий..."
mkdir -p /usr/bin/Help-Buttons
mkdir -p /var/log/Help-Buttons

echo "Создание файлов..."
> /var/log/Help-Buttons/log.txt
chmod ugo+rwx /var/log/Help-Buttons/log.txt
echo -n "Программа установлена " >> /var/log/Help-Buttons/log.txt
echo `date` >> /var/log/Help-Buttons/log.txt
> /usr/bin/Help-Buttons/update.sh
chmod ugo+rwx /usr/bin/Help-Buttons/update.sh
> /usr/bin/Help-Buttons/shutdown.sh
chmod ugo+rwx /usr/bin/Help-Buttons/shutdown.sh
cp sources/update.sh /usr/bin/Help-Buttons/update.sh
cp sources/shutdown.sh /usr/bin/Help-Buttons/shutdown.sh
for user in /home/*
do
	cp sources/update.desktop ${user}/Рабочий\ стол/
	chmod ugo+rwx ${user}//Рабочий\ стол/update.desktop
	cp sources/shutdown.desktop ${user}/Рабочий\ стол/
	chmod ugo+rwx ${user}//Рабочий\ стол/shutdown.desktop
done

if [ $? -eq 0 ]; then
echo "Успешная установка!" 
else
echo "Установка не удалась, посмотрите вывод выше и задайте вопрос разработчику!"
fi
sleep 1
exit