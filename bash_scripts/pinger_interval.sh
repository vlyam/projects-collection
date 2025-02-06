#!/bin/bash
read -p "Введите адрес для пинга: " ADDRESS
failed_attempts=0
while true
do
        PING_OUTPUT=$(ping -c 1 -W 1 $ADDRESS)
        if [[ $? -ne 0 ]]; then
                ((failed_attempts++))
        else
                failed_attempts=0
                TIME=$(echo "$PING_OUTPUT" | awk -F'/' '/^rtt/ { print $5 }')
                if (( $(echo "$TIME > 100" | bc -l) )); then
                        echo "Время запроса к $ADDRESS превысило 100 мс: $TIME мс"
                else
                        echo "Время запроса к $ADDRESS равно: $TIME мс"
                fi
        fi
        if (( failed_attempts >= 3 )); then
                echo "3 запроса подряд к $ADDRESS были безуспешны."
                break
        fi
        sleep 1
done