cd platform-tools
chmod +x adb
xattr -d com.apple.quarantine adb > /dev/null 2>&1
export PATH=$PATH:.

clear

echo Начинаем установку

echo Подготовливаем adb к работе
adb wait-for-device
adb root
adb wait-for-device
adb disable-verity
adb reboot
adb wait-for-device
adb root
adb wait-for-device
adb remount
adb push ../source/init.logcat.sh /system/etc/
adb reboot
adb wait-for-device
adb root
adb wait-for-device
echo adb к работе подготовлено

echo Разрешаем менять размеры приложения
adb shell settings put global enable_freeform_support 1
adb shell settings put global force_resizable_activities 1
adb shell settings put global hidden_api_policy_pre_p_apps  1
adb shell settings put global hidden_api_policy_p_apps 1
adb shell settings put global hidden_api_policy 1
echo Изменение размеров приложений разрешено

echo Устанавливаем Твикс
adb install ../apk/VoyahTweaks.apk
echo Твикс установлен

echo Устанавливаем лаунчер
adb uninstall com.simplemobiletools.applauncher > /dev/null 2>&1
adb install ../apk/app-launcher.apk
echo Лаунчер установлен

echo Раздаём права на приложение
adb shell pm grant ru.kachalin.voyahtweaks android.permission.SYSTEM_ALERT_WINDOW
adb shell pm grant ru.kachalin.voyahtweaks android.permission.READ_LOGS
adb shell pm grant ru.kachalin.voyahtweaks android.permission.RECORD_AUDIO
adb shell pm grant ru.kachalin.voyahtweaks android.permission.WRITE_EXTERNAL_STORAGE
adb shell pm grant ru.kachalin.voyahtweaks android.permission.WRITE_SECURE_SETTINGS
echo Права на приложение раздали

echo Запускаем VoyahTweaks
adb shell am start ru.kachalin.voyahtweaks/.android.activity.main.MainActivity

read -p "Теперь это окно можно закрыть" -n1 -s
