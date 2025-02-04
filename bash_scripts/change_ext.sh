#!/bin/bash

# Запрос директории у пользователя
read -p "Введите директорию для работы (или нажмите Enter для использования текущей): " directory

# Если директория не указана, используем текущую
if [ -z "$directory" ]; then
    directory="."
fi

# Проверка, существует ли указанная директория
if [ ! -d "$directory" ]; then
    echo "Директория '$directory' не существует или недоступна."
    exit 1
fi

# Запрос текущего расширения и нового расширения
read -p "Введите текущее расширение файлов: " current_extension
read -p "Введите новое расширение файлов: " new_extension

# Переходим в указанную директорию
cd "$directory" || exit

# Меняем расширение файлов
for file in *.$current_extension; do
    # Проверка, существует ли файл с текущим расширением
    if [ -e "$file" ]; then
        # Получаем имя файла без расширения
        filename=$(basename "$file" ".$current_extension")
        # Меняем расширение файла
        mv "$file" "$filename.$new_extension"
        echo "Изменено расширение файла: $file -> $filename.$new_extension"
    fi
done

echo "Готово."
