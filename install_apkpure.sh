@echo off
clear

echo Подготовливаем adb к работе
./adb -d wait-for-device
echo adb к работе подготовлено

echo Устанавливаем APKPure
./adb install -g ./apk/APKPure.v.3.19.35.b.3193547.Permissions.Removed_album.apk
echo APKPure установлено

echo Выдаём права установки приложений
./adb -d shell appops set com.apkpure.aegon REQUEST_INSTALL_PACKAGES allow
echo Права установки приложений раздали

read -p "Теперь это окно можно закрыть" -n1 -s

