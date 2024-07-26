clear

echo Начинаем установку

echo Подготовливаем adb к работе
./adb -d wait-for-device
./adb -d root
./adb -d wait-for-device
./adb -d disable-verity
./adb -d reboot
./adb -d wait-for-device
./adb -d root
./adb -d wait-for-device
./adb -d remount
./adb -d push ./source/init.logcat.sh /system/etc/
./adb -d reboot
./adb -d wait-for-device
./adb -d root
./adb -d wait-for-device
echo adb к работе подготовлено

echo Разрешаем менять размеры приложения
./adb -d shell settings put global enable_freeform_support 1
./adb -d shell settings put global force_resizable_activities 1
./adb -d shell settings put global hidden_api_policy_pre_p_apps  1
./adb -d shell settings put global hidden_api_policy_p_apps 1
./adb -d shell settings put global hidden_api_policy 1
echo Изменение размеров приложений разрешено

echo Устанавливаем Твикс
./adb install ./apk/VoyahTweaks.apk
echo Твикс установлен

echo Устанавливаем лаунчер
./adb uninstall com.simplemobiletools.applauncher > /dev/null 2>&1
./adb install ./apk/app-launcher.apk
echo Лаунчер установлен

echo Раздаём права на приложение
./adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.SYSTEM_ALERT_WINDOW
./adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.READ_LOGS
./adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.RECORD_AUDIO
./adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.WRITE_EXTERNAL_STORAGE
./adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.WRITE_SECURE_SETTINGS
echo Права на приложение раздали

echo Запускаем VoyahTweaks
./adb -d shell am start ru.kachalin.voyahtweaks/.android.activity.main.MainActivity

read -p "Теперь это окно можно закрыть" -n1 -s

