@echo off
chcp 1251
cls

echo �������������� adb � ������
adb -d wait-for-device
echo adb � ������ ������������

echo ������������� APKPure
adb install -g ./apk/APKPure.v.3.19.35.b.3193547.Permissions.Removed_album.apk
echo APKPure �����������

echo ����� ����� ��������� ����������
adb -d shell appops set com.apkpure.aegon REQUEST_INSTALL_PACKAGES allow
echo ����� ��������� ���������� �������

echo ������ ��� ���� ����� �������
pause

