@echo off
clear

echo Подготовливаем adb к работе
./adb -d wait-for-device
./adb -d root
./adb -d wait-for-device
./adb -d remount
echo adb к работе подготовлено

echo Обновляем список приложений для переноса между экранами
./adb -d push ./source/multidisplay_anim_app_white.list /system/etc/qinggan
echo Cписок приложений для переноса между экранами обновлён

read -p "Теперь это окно можно закрыть" -n1 -s

