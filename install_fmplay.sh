@echo off
clear

echo Подготовливаем adb к работе
./adb -d wait-for-device
echo adb к работе подготовлено

echo Устанавливаем Telegram X
./adb install -g ./apk/FMPlay_2.3.5.apk
echo Telegram X установлен

read -p "Теперь это окно можно закрыть" -n1 -s

