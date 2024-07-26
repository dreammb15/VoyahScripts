@echo off
clear

echo Подготовливаем adb к работе
./adb -d wait-for-device
echo adb к работе подготовлено

echo Устанавливаем Telegram X
./adb install -g ./apk/Telegram-X-0.26.7.1708-arm64-v8a.apk
echo Telegram X установлен

echo Выдаём права установки приложений
./adb -d shell appops set org.thunderdog.challegram REQUEST_INSTALL_PACKAGES allow
echo Права установки приложений раздали

read -p "Теперь это окно можно закрыть" -n1 -s

