#!/bin/bash
echo "Начало установки..."

#создание директорий
echo "Создание директорий..."
if ! [ -d /usr/bin/Help-Buttons ] #создание /usr/bin/Help-Buttons
then
	mkdir /usr/bin/Help-Buttons
else
	rm -R /usr/bin/Help-Buttons
	mkdir /usr/bin/Help-Buttons
fi
if ! [ -d /usr/bin/Help-Buttons/Icons ] #создание /usr/bin/Help-Buttons/Icons
then
	mkdir /usr/bin/Help-Buttons/Icons
else
	rm -R /usr/bin/Help-Buttons/Icons
	mkdir /usr/bin/Help-Buttons/Icons
fi
if ! [ -d /var/log/Help-Buttons ] #создание /var/log/Help-Buttons
then
	mkdir /var/log/Help-Buttons
else
	rm -R /var/log/Help-Buttons
	mkdir /var/log/Help-Buttons
fi

#создание файлов
echo "Создание файлов..."
if ! [ -f /var/log/Help-Buttons/log.txt ] #создание log.txt
then
	> /var/log/Help-Buttons/log.txt
	chmod ugo+rwx /var/log/Help-Buttons/log.txt
else
	rm /var/log/Help-Buttons/log.txt
	> /var/log/Help-Buttons/log.txt
	chmod ugo+rwx /var/log/Help-Buttons/log.txt
fi
if ! [ -f /usr/bin/Help-Buttons/update.sh ] #создание update.sh
then
	> /usr/bin/Help-Buttons/update.sh
	chmod ugo+rwx /usr/bin/Help-Buttons/update.sh
else
	rm /usr/bin/Help-Buttons/update.sh 
	> /usr/bin/Help-Buttons/update.sh
	chmod ugo+rwx /usr/bin/Help-Buttons/update.sh
fi
if ! [ -f /usr/bin/Help-Buttons/shutdown.sh ] #создание shutdown.sh
then
	> /usr/bin/Help-Buttons/shutdown.sh
	chmod ugo+rwx /usr/bin/Help-Buttons/shutdown.sh
else
	rm /usr/bin/Help-Buttons/shutdown.sh
	> /usr/bin/Help-Buttons/shutdown.sh
	chmod ugo+rwx /usr/bin/Help-Buttons/shutdown.sh
fi
cp sources/Scripts/update.sh /usr/bin/Help-Buttons/update.sh #копирование update.sh
cp sources/Scripts/shutdown.sh /usr/bin/Help-Buttons/shutdown.sh #копирование shutdown.sh
cp -a sources/Icons/* /usr/bin/Help-Buttons/Icons #копирование Icons
rm -rf /home/lost+found
path=`find /  -maxdepth 3 -type d -name "Desktop" -o  -name "Рабочий стол"`
for user in /home/* #копирование desktop файлов
do
	echo "$path/"
	cp sources/Desktops/update.desktop "$path/"
	sudo chmod ugo+x "$path"/update.desktop
	cp sources/Desktops/shutdown.desktop "$path/"
	sudo chmod ugo+x "$path"/shutdown.desktop
done

#вывод результата установки
echo -n "Программа установлена " >> /var/log/Help-Buttons/log.txt
echo `date` >> /var/log/Help-Buttons/log.txt
if [ $? -eq 0 ]
then
	echo "Успешная установка!"
	sleep 1
	exit
else
	echo "Установка не удалась, посмотрите вывод выше и задайте вопрос разработчику!"
fi