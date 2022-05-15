#!/bin/bash
echo -n "Начало: " >> /var/log/Help-Buttons/log.txt
uptime -s >> /var/log/Help-Buttons/log.txt

echo -n "Конец: "  >> /var/log/Help-Buttons/log.txt
date >> /var/log/Help-Buttons/log.txt

echo -n "Всего: " >> /var/log/Help-Buttons/log.txt
uptime -p >> /var/log/Help-Buttons/log.txt
echo "" >> /var/log/Help-Buttons/log.txt

shutdown -P now