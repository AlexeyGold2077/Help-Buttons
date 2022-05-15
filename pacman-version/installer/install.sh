#!/bin/bash
echo "Начало установки..."

#создание директорий
echo "Создание директорий..."
if ! [ -d /usr/bin/Help-Buttons ]
then
	mkdir /usr/bin/Help-Buttons
else
	rm -R /usr/bin/Help-Buttons
	mkdir /usr/bin/Help-Buttons
fi
if ! [ -d /var/log/Help-Buttons ]
then
	mkdir /var/log/Help-Buttons
else
	rm -R /var/log/Help-Buttons
	mkdir /var/log/Help-Buttons
fi

#создание файлов
echo "Создание файлов..."
if ! [ -f /var/log/Help-Buttons/log.txt ]
then
	> /var/log/Help-Buttons/log.txt
	chmod ugo+rwx /var/log/Help-Buttons/log.txt
else
	rm /var/log/Help-Buttons/log.txt
	> /var/log/Help-Buttons/log.txt
	chmod ugo+rwx /var/log/Help-Buttons/log.txt
fi
if ! [ -f /usr/bin/Help-Buttons/update.sh ]
then
	> /usr/bin/Help-Buttons/update.sh
	chmod ugo+rwx /usr/bin/Help-Buttons/update.sh
else
	rm /usr/bin/Help-Buttons/update.sh 
	> /usr/bin/Help-Buttons/update.sh
	chmod ugo+rwx /usr/bin/Help-Buttons/update.sh
fi
if ! [ -f /usr/bin/Help-Buttons/shutdown.sh ]
then
	> /usr/bin/Help-Buttons/shutdown.sh
	chmod ugo+rwx /usr/bin/Help-Buttons/shutdown.sh
else
	rm /usr/bin/Help-Buttons/shutdown.sh
	> /usr/bin/Help-Buttons/shutdown.sh
	chmod ugo+rwx /usr/bin/Help-Buttons/shutdown.sh
fi
cp sources/update.sh /usr/bin/Help-Buttons/update.sh
cp sources/shutdown.sh /usr/bin/Help-Buttons/shutdown.sh
for user in /home/* #поиск домашнего каталога
do
	cp sources/update.desktop ${user}/Рабочий\ стол/
	chmod ugo+rwx ${user}//Рабочий\ стол/update.desktop
	cp sources/shutdown.desktop ${user}/Рабочий\ стол/
	chmod ugo+rwx ${user}//Рабочий\ стол/shutdown.desktop
done

#вывод результата установки
echo -n "Программа установлена " >> /var/log/Help-Buttons/log.txt
echo `date` >> /var/log/Help-Buttons/log.txt
if [ $? -eq 0 ]; then
echo "Успешная установка!" 
else
echo "Установка не удалась, посмотрите вывод выше и задайте вопрос разработчику!"
fi
sleep 1
exit