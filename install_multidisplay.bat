@echo off
chcp 1251
cls

echo �������������� adb � ������
adb -d wait-for-device
adb -d root
adb -d wait-for-device
adb -d remount
echo adb � ������ ������������

echo ��������� ������ ���������� ��� �������� ����� ��������
adb -d push ./source/multidisplay_anim_app_white.list /system/etc/qinggan
echo C����� ���������� ��� �������� ����� �������� �������

echo ������ ��� ���� ����� �������
pause

