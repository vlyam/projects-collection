#!/bin/bash

read -p "Введите адрес для пинга: " address
read -p "Введите количество запросов для проверки: " count
ping_result=$(ping -c $count $address)
#echo $ping_result
avg_ping=$(echo "$ping_result" | awk -F'/' '/^rtt/ { print $5 }')
echo "Среднее время пинга до $address составляет: $avg_ping мс"
