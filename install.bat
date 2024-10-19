@echo off

cd ./platform-tools
chcp 1251

echo �������� ���������

echo �������������� adb � ������
echo ���� ��� �������:
echo 1 ��������� ������� �� USB Debugging, https://voyahchat.ru/common/usb-debugging
echo 2 ��������� �������� �� ������, https://voyahchat.ru/common/cable
echo 3 ������������� ��������� � ��������� ������ ������
adb wait-for-device
adb root
adb wait-for-device
adb disable-verity
adb reboot
adb wait-for-device
adb root
adb wait-for-device
adb remount
adb push ./../source/init.logcat.sh /system/etc/
adb reboot
adb wait-for-device
adb root
adb wait-for-device
echo adb � ������ ������������

echo ��������� ��������� ������� ����������
adb shell settings put global enable_freeform_support 1
adb shell settings put global force_resizable_activities 1
adb shell settings put global hidden_api_policy_pre_p_apps  1
adb shell settings put global hidden_api_policy_p_apps 1
adb shell settings put global hidden_api_policy 1
echo ��������� �������� ���������� ���������

echo ������������� �����
adb install ./../apk/VoyahTweaks.apk
echo ����� ����������

echo ������������� �������
adb install ./../apk/app-launcher.apk
echo ������� ����������

echo ������ ����� �� ����������
adb shell pm grant ru.kachalin.voyahtweaks android.permission.SYSTEM_ALERT_WINDOW
adb shell pm grant ru.kachalin.voyahtweaks android.permission.READ_LOGS
adb shell pm grant ru.kachalin.voyahtweaks android.permission.RECORD_AUDIO
adb shell pm grant ru.kachalin.voyahtweaks android.permission.WRITE_EXTERNAL_STORAGE
adb shell pm grant ru.kachalin.voyahtweaks android.permission.WRITE_SECURE_SETTINGS
echo ����� �� ���������� �������

echo ��������� VoyahTweaks
adb shell am start ru.kachalin.voyahtweaks/.android.activity.main.MainActivity

echo ������ ��� ���� ����� �������
pause
