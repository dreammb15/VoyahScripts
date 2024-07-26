@echo off
chcp 1251
cls

echo Подготовливаем adb к работе
adb -d wait-for-device
echo adb к работе подготовлено

echo Устанавливаем FMPlay
adb install -g ./apk/FMPlay_2.3.5.apk
echo FMPlay установлен

echo Теперь это окно можно закрыть
pause

