@echo off
chcp 1251
cls

echo �������������� adb � ������
adb -d wait-for-device
echo adb � ������ ������������

echo ������������� FMPlay
adb install -g ./apk/FMPlay_2.3.5.apk
echo FMPlay ����������

echo ������ ��� ���� ����� �������
pause

