@echo off
chcp 1251
cls

echo �������������� adb � ������
adb -d wait-for-device
echo adb � ������ ������������

echo ������������� Telegram X
adb install -g ./apk/Telegram-X-0.26.7.1708-arm64-v8a.apk
echo Telegram X ����������

echo ����� ����� ��������� ����������
adb -d shell appops set org.thunderdog.challegram REQUEST_INSTALL_PACKAGES allow
echo ����� ��������� ���������� �������

echo ������ ��� ���� ����� �������
pause

