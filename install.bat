::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcA2MOmSGIrAP4/z0/9axrVQcXNYofY7QyZarFMFA1mTUXqY4xH8UjoVfQkoBMEH+IA16+j8b5THRYImsth3sQ1ua70Q+CCtGgm7fmi4/X9JkmNYOnSGu9y0=
::fBE1pAF6MU+EWHreyHcjLQlHcA2MOmSGIrAP4/z0/9axrVQcXNYofY7QyZarFMFA1kT0Zdsh129Um8MJHlVZbhnL
::fBE1pAF6MU+EWHreyHcjLQlHcA2MOmSGIrAP4/z0/9axrVQcXNYofY7QyZarFMFA1kzqfIJj2nVdm8oYQghQHg==
::fBE1pAF6MU+EWHreyHcjLQlHcA2MOmSGIrAP4/z0/9axrVQcXNYofY7QyZarFMFA1kzqZoIs2nYUmsoYbA==
::fBE1pAF6MU+EWHreyHcjLQlHcA2MOmSGIrAP4/z0/9axrVQcXNYofY7QyZarFMFA1kjxeYIk0nNJiMcNFSRZcBumUQ4kuVFVvm2RMomQuhz1Kg==
::fBE1pAF6MU+EWHreyHcjLQlHcA2MOmSGIrAP4/z0/9axrVQcXNYofY7QyZarFMFA1nPrbJcl4m1fmcAfQhpIdXI=
::fBE1pAF6MU+EWHreyHcjLQlHcA2MOmSGIrAP4/z0/9axrVQcXNYofY7QyZarFMFA1kTgd9gozn86
::fBE1pAF6MU+EWHreyHcjLQlHcA2MOmSGIrAP4/z0/9axrVQcXNYofY7QyZarFMFA1mTgd6Ek2FtKkYUIABc4
::fBE1pAF6MU+EWHreyHcjLQlHcA2MOmSGIrAP4/z0/9axrVQcXNYofY7QyZarFMFA1mTgd6Ek2E9JmuocBVVcch7L
::fBE1pAF6MU+EWHreyHcjLQlHcA2MOmSGIrAP4/z0/9axrVQcXNYofY7QyZarFMFA1kT0fsRN
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBJaSgu+GG6pDaET+NTo7OuLo08RUd4sbI7Pz6eyIuEH/kD2bNsu3ntIn8ICC1VRfR3L
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBJaSgu+GG6pDaET+NTN4POGqnkKUeM0a63+7pXdHFDuWptUpyb9Z5UaKBS83KuHzsgbvjMipndDvmeNNtPRugHyXkmF6gZhVT061y3VlC5b
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
:: ����� ���������� ������� ����� � github, ��� ������������ ������������� ������� � ������� �������� � ��������� ��� ANSI
chcp 1251 > nul
mode con lines=30 cols=60
rem pushd "%~dp0"
:: �������� 0 ��� ������� ������ ������� ����������� 1 - ������� adb ������� �� �����������
set TESTMODE=0
:: ���� DEBUGMODE=0 �� ����� ���� ������ �� �����
set DEBUGMODE=0
:: �������� ���������� "�� ���������"
set cpuver=qcom
:: ������ �������� 9, 11 ��� 13 -14
set verver=11
:: ������ � ������ .apk ������ 1.7.0
set size1=90437039
:: ������ ������ ������� � ������
set size2=22191081
:: CUNBA ��� (��-���������)
set cunba=0
:: ����� �������� 6.0.5 �� ����� ��
set times=1720819728
set osversion=6
:: ������ ��������� �������
:: version 20.07.2024 16:51
:: ��������� ��������� DNS
:: version 16:57
:: �������� ����� time-zone ��� ��������� �����
:: 17:25 ����� �� ��������� ���������������� apk �� �������� apk2
:: 17:50 ��������� ������, ��������� ��������� ���������� (��� ������)
:: 22.07.2024 21:56 ������� ��������� ��� �������� �������. ������ �� ������ 
:: ����� ����������� ����� ���������� ����
:: 0:19 ������������ ��������� ���� :) ����� ���� ������ ��������
:: 24.07.2024 ���������� ����-������ �������� ������ � ��������� :) ������� ������������ "��-������"
:: 25.07.2024 ������������ ��-������ ���������. ������� ������� ������� ����. ������� ����� ���������������� ����������
:: 25.08.2024 ����� ���������, ���������� ���� ������ ������ ������ ��-������
:: � ������ ��������� ������� ���� � ������ ��� ��������������
for /f "usebackq delims=" %%i in (`tzutil.exe /g`) do set sCurrTimeZoneID=%%~i
tzutil.exe /s "China Standard Time"
Set mm=%DATE:~3,2%
set /a smm=1%mm% - 100 +20
Set /a DD3=1%DATE:~0,1%-10
Set /a yy3=1%DATE:~8,1%-10
Set /a ss3=dd3+yy3
Set /a dd4=1%DATE:~1,1%-10
Set /a yy4=1%DATE:~9,1%-10
Set /a ss4=dd4+yy4
tzutil.exe /s "%sCurrTimeZoneID%"
cls
echo.
echo.
echo.
echo *********************************************************
echo *  ��������. ��� ��� �� ������� �����			*
echo *  �� ������� �� ���� ����� � ����			*
echo *  � ������ �� ���� ��� ����������			*
echo *  ��������������� 					*
echo * 							*
echo *							*
echo *  ������� ������ %smm%%ss3%%ss4%                                  *
echo *                                                       *
echo *                                                       *
echo *********************************************************
echo.       �������� �� ��������� ��� �� �������
echo. ��� ��������� � ��������������� ���������-������
echo.      Voyah Chat https://t.me/voyahchat
echo ������� ������ ��� ���������� �������� ����� ����������
pause >nul
if %DEBUGMODE% == 1 (
	echo DEBUGMODE is %DEBUGMODE% TESTMODE is %TESTMODE% 
	echo �������� ������� ������������� �����
	)
if  not exist "./VoyahTweaks.apk" goto :err22
for %%i in ("VoyahTweaks.apk") do set /a size1=%%~Zi > nul
if %size1%==90437039 (echo ������������� ������ 1.7.0) 
if %size1%==90437011 (echo ������������� ������ 1.7.2)
if %size1%==90440743 (echo ������������� ������ 1.8.0b2)
if %size1%==90579892 (echo ������������� ������ 1.8.0)
if %DEBUGMODE% == 1 (echo �������� ������� �������������� ������)
if not exist "./init.logcat.sh" goto :err1
if not exist "./multidisplay_anim_app_white.list" goto :err1
if not exist "./app-launcher.apk" goto :err1
if not exist "./adb.exe" goto :err1
if %DEBUGMODE% == 1 (
	echo ��� ������������ ����� ������������
	echo �������� �������� ADB. ��������� ��� USB Debug ��������
	echo.
	echo ����� ������� ����� ������� 
	echo �������� ��������� ������������ � �������� � �������� ����
	pause >nul
	)
rem ���������� � ��� �������� � ������������� �������� ����������
if  %TESTMODE% == 1 goto :skips
adb devices > dev.txt
if not exist dev.txt (
	echo ������ ������ �� ��������� ����
	echo ������� ����� ������� ��� ������
	pause >nul
	goto :end
)
for %%i in ("dev.txt") do set /a size1=%%~Zi > nul
if  %size1% ==  28 ( echo. ------��������
	echo.        NO DEVICE CONNECTED 
	echo ������� �� ����� �������������� ������
	ECHO. ��������� ����������� 
	echo. � ��������� ��������� �����
	del dev.txt >nul
	echo press any key to exit
	pause >nul
	goto :end
)
del dev.txt >nul
:skips
call :adbscreen
rem goto main menu
goto :addons
if %DEBUGMODE% == 1 ( 
	echo ��� �� �����������, �� ������ ���� ������� ������
	pause > nul 
	goto :addons
	)
goto :end
REM *************** ���� �������� ��� ****************
:adbscreen
if %TESTMODE% == 1 goto :exadb
adb kill-server > nul
echo Waiting for adb
adb -d wait-for-device
if not errorlevel 0 goto :err2
rem ����� ������� ��� ���������� ������������ � �� ���� ��� ������ ������� ������������� ������������� "USB Debug"
if %DEBUGMODE%==1 echo. ���������� ������ �������
adb -d shell getprop ro.build.version.release > "version.txt"
if not exist version.txt goto :writeerror
set /p verver=< version.txt
adb -d shell getprop ro.bootimage.build.date.utc >"osdate.txt"
set /p times=<osdate.txt
if times GTR osversion ( 
	echo WOW ! ������������� �� ��������� ��������
SET OS6=1	
)
if times LEQ osversion ( 
	echo WOW ! ������������� �� �� ��������� ��������
set OS6=0

)
if %DEBUGMODE%==1 (
	if %verver% == 11 echo ����������
	if %verver% == 9 echo ������������
	if %verver% == 13 echo �������� HONOR
	echo ��������� ���� ���������� � ������
	)
adb -d shell getprop ro.hardware > "cpu.txt"
set /p cpuver=< cpu.txt
if %cpuver% == qcom ( 
	if %DEBUGMODE%==1 echo. running QUALCOMM
	set cputype=1
	)
if %cpuver% == nxp (
	if %DEBUGMODE%==1 echo. running OLD VERSION multimedia
	set cputype=0
	)
echo CPU %cpuver% on android %verver%
if %DEBUGMODE%==1 pause
rem ������� ���������� ��������� ���� CPU adb -d shell dumpsys cpuinfo
if %DEBUGMODE%==1 echo. ��������� ������� CUNBA
if exist process.txt del process.txt > nul
adb -d shell pm list packages | find /I "cunba" > process.txt
if not exist process.txt (
	echo Disk write protected
	echo installation aborted
	pause
	goto :end
	)
for %%I in ("process.txt") do (set /a size2=%%~zI)
if %DEBUGMODE%==1 echo cunba size is %size2%
if %DEBUGMODE%==1 pause
if %size2%==0 (
	if %DEBUGMODE%==1 echo. CUNBA ���, ������������� ������ ������
	set cunba=0
) ELSE (
	set cunba=1
	if %DEBUGMODE%==1 echo CUNBA ����
)
if %DEBUGMODE%==1 echo. ��������� ������, ������� ��������� �����
if exist version.txt del version.txt > nul
if exist process.txt del process.txt > nul
if exist cpu.txt del cpu.txt > nul
if exist osdate.txt del osdate.txt > nul
:exadb
exit /b
:tweaks
if  %TESTMODE% == 1 ( 
	echo ��� �����������, �������� ������
	pause > nul
	goto :m1
)
rem goto :skip2
adb -d root >nul
if not errorlevel 0 goto :err2root
adb -d wait-for-device
if not errorlevel 0 goto :err2
adb -d disable-verity >nul
if not errorlevel 0 goto :err2
echo.  ������������ 1/3 ����
adb -d reboot
call :wait-for
adb -d wait-for-device
if not errorlevel 0 goto :err2
adb -d root >nul
adb -d wait-for-device
if not errorlevel 0 goto :err2
if %verver% == 9 (
	if %DEBUGMODE% == 1 echo ���������� LOGCAT ��� �������
	goto :nx1
	)
adb -d remount
if not errorlevel 0 goto :err3
adb -d push ./init.logcat.sh /system/etc/
if not errorlevel 0 goto :err3
echo.  ������������ 2/3 ����
adb -d reboot
adb -d wait-for-device
:nx1
call :wait-for
adb -d root >nul
adb -d wait-for-device
if %cunba% == 0 (
	echo. ��������� �������� ������� ����������
	adb -d shell settings put global enable_freeform_support 1
	if not errorlevel 0 goto :err10
	adb -d shell settings put global force_resizable_activities 1
	if not errorlevel 0 goto :err10
	adb -d shell settings put global hidden_api_policy_pre_p_apps  1
	if not errorlevel 0 goto :err10
	adb -d shell settings put global hidden_api_policy_p_apps 1
	if not errorlevel 0 goto :err10
	adb -d shell settings put global hidden_api_policy 1
	if not errorlevel 0 goto :err10
)

echo ������������ �����, ���������
if %cunba% == 1 (
	echo ������ �����, ���������� ���, � ������ ���� ������ ��� �������
)
adb -d wait-for-device
adb -d install ./VoyahTweaks.apk >nul
if %errorlevel% NEQ 0 goto :errtw
rem :skip2
echo. ����� ����������
Set choice=
if %cunba% == 0 (echo. Cunba ���, � ��������� �������) else goto :ex2
if %DEBUGMODE% ==1 pause
if %DEBUGMODE% ==1 echo ��������� ������� ��� �������������� �������
if exist process.txt del process.txt > nul
adb -d shell pm list packages | find /I "com.simplemobiletools.applauncher" > process.txt
if not exist process.txt (
	echo. Disk write protected
	echo. installation aborted
	pause
	goto :end
	)
for %%I in ("process.txt") do (set /a size2=%%~zI)
if %size2%==0 (echo. ������ ������ �� ���������, ������ ���������
		goto :ex3
)
:zone2
	Set choice=
	echo. ��������� ����� ������������� ������. ��������
	Echo. 1 - ������� � ���������� ������. ��� �����������
	echo.     ���������� ����� ������� �� �������, �� �� � ������
	Echo. 2 - ���������� ������ �� ������ ������ ����������
	echo.     ��� ��������� ����� ���������
	Echo. 3 - ���������� ��������� �������
	Echo. 9 - ������� ������ � ����� � ����
	Echo. 0 - ����� � ���� �� ��������� ���������
	echo.
if %DEBUGMODE% ==1 echo on
	Set /p choice="��� �����: "
	if not defined choice goto :zone2
	if "%choice%"=="1" (
		echo. �������
		adb -d uninstall com.simplemobiletools.applauncher > nul
		echo. �������������
		adb -d install ./app-launcher.apk >nul
if %DEBUGMODE% ==1 echo ������� �� ����� ex2
if %DEBUGMODE% ==1 pause
		goto :ex2
	)
	if "%choice%"=="2" (
:ex3		
if %DEBUGMODE% ==1 echo ����� 2 ���������
if %DEBUGMODE% ==1 pause
		adb -d install ./app-launcher.apk
if %DEBUGMODE% ==1 echo ������� �� ����� ex2
if %DEBUGMODE% ==1 pause
		goto :ex2
	)
	if "%choice%"=="3" (
if %DEBUGMODE% ==1 echo ����� 3 ������� ex2 
if %DEBUGMODE% ==1 pause
goto :ex2
)
	if "%choice%"=="9" (
if %DEBUGMODE% ==1 echo ����� 9 
if %DEBUGMODE% ==1 pause
		echo. ��9. ������� ������
		adb -d uninstall com.simplemobiletools.applauncher > nul
		if exist process.txt del process.txt > nul
		set choice=
if %DEBUGMODE% ==1 echo ������� �� ����� m1 ����������� zone2 used
if %DEBUGMODE% ==1 pause
if %DEBUGMODE% ==1 goto :zone2
		goto :m1
	)
	if "%choice%"=="0" (
		echo. ������ �� ���������, ��������� ���������
		if exist process.txt del process.txt > nul
		set choice=
if %DEBUGMODE% ==1 echo ������� �� ����� m1 ����������� zone2 used
if %DEBUGMODE% ==1 pause
if %DEBUGMODE% ==1 goto :zone2
		goto :m1
	)

	cls
	goto :zone2
:ex2
	if %DEBUGMODE% ==1 (echo. ��������� ������, ������� ��������� �����)
	if exist process.txt del process.txt > nul
	if %DEBUGMODE% == 1 (echo. ������� ����������)
)
echo. ������� ����� �� ����������
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.SYSTEM_ALERT_WINDOW
if not errorlevel 0 goto :err2
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.READ_LOGS
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.RECORD_AUDIO
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.WRITE_EXTERNAL_STORAGE
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.WRITE_SECURE_SETTINGS
if %DEBUGMODE% == 1 (
	echo. ����� �� ���������� �������
	echo. �������!
)
adb -d shell am start ru.kachalin.voyahtweaks/.android.activity.main.MainActivity >nul
if errorlevel 0 (echo. TWEAKS ������� �������) ELSE (
	echo. ooooooooo ������ ��������� ����������� oooooooooooooo
	)

echo.
echo.
echo. ����� ������������ �������� � ������
echo. �� ������ ��������������� ������ �������
echo.   � ��������� ������
echo.
echo. ���������� ������ � ������ ������.����������
echo. ���������� ����� �� ��������� �� ��.5
pause
echo. ������� ����� ������� ��� ������������ MM
echo.
pause >nul
echo.  ������������ 3/3 ����
adb -d reboot
:addons
rem ���� �������� ���� 
cls
:m1
set choice=
cls
echo. ��� ��������� � ��������������� ���������-������
echo.      Voyah Chat https://t.me/voyahchat
echo.         (c) 2024 ��� ����� �������� 
if %DEBUGMODE% == 1 (
echo.     CPU %cpuver% on android %verver% cunba %cunba%
)
echo.
Echo. �������� ����������� ��������� ���������:
Echo.
if %cunba% == 0 (
	Echo. 1 - ��������� TWEAKS + LAUNCHER
	) else (
	Echo. 1 - ��������� TWEAKS ��� LAUNCHER'a
)
Echo. 2 - ��������� ���������� APKPURE
Echo. 3 - ��������� ��������� ����
Echo. 4 - �������������
Echo. 5 - ��������� ���������������� ����������
Echo. 0 - �����
echo.
Set /p choice="��� �����: "
if not defined choice goto m1
if "%choice%"=="1" (call :tweaks)
if "%choice%"=="2" (call :apkpure)
if "%choice%"=="3" (call :zone)
if "%choice%"=="4" (goto :addmenu)
if "%choice%"=="5" (call :userapk)
if "%choice%"=="0" goto :end
goto m1
:addmenu
cls
Set choice=
echo.
echo. �������������� �������
if %cunba% == 0 Echo. 1 - �������������� �������� �� ����� ���������
Echo. 2 - ��������� DNS ��� ���������� ������ ����������
if %cunba% == 1 Echo. 3 - �������� CUNBA � ����������
Echo. 4 - ���������/��������� ���������� ����������
Echo. 5 - �������� ���������� �� ����� WiFi ����
Echo. 6 - ���������� TWEAKS
echo. 7 - �������������� ���������� TWEAKS
echo. 8 - ������������� �����������
Echo. 0 - ������� � ������� ����
echo.
Set /p choice="��� �����: "
if not defined choice goto addmenu
if %cunba% == 0 if "%choice%"=="1" (call :free)
if "%choice%"=="2" (call :setdns)
if %cunba% == 1 if "%choice%"=="3" (call :delcunba)
if "%choice%"=="4" (call :keyb)
if "%choice%"=="5" (call :wifiname)
if "%choice%"=="6" (
	adb -d shell am start ru.kachalin.voyahtweaks/.android.activity.main.MainActivity >nul
	goto :addmenu
)
if "%choice%"=="7" (
	adb -d shell am start ru.kachalin.voyahtweaks/.android.activity.main.MainActivity --user 0 >nul
	goto :addmenu
)

if "%choice%"=="8" adb -d reboot
if "%choice%"=="0" goto :m1
goto :addmenu
:zone
set choice=
cls
echo. timezone settings
echo. ����� ���������, ���� ����������� 
echo. ����� ������������� ������������ 
Echo. �������� ���������:
Echo.
Echo. 1 - GMT+1 Europe/Belgrade
Echo. 2 - GMT+2 Europe/Kaliningrad
Echo. 3 - GMT+3 ������
Echo. 4 - GMT+4 �����/�����������
Echo. 5 - GMT+5 Europe/Samara
Echo. 8 - GMT+8 �����/�����������
Echo. 0 - ������� � ���������� ����
 
echo.
Set /p choice="��� �����: "
if %TESTMODE% ==1 (
	echo. ������ ����� %choice%
	echo. ������� ����� ������� ��� �������� � ������� ����
	pause >nul
	goto :m1
)
if not defined choice goto :zone
if "%choice%"=="1" (adb -d shell setprop persist.sys.timezone "Europe/Belgrade")
if "%choice%"=="2" (adb -d shell setprop persist.sys.timezone "Europe/Kaliningrad")
if "%choice%"=="3" (adb -d shell setprop persist.sys.timezone "Europe/Moscow")
if "%choice%"=="4" (adb -d shell setprop persist.sys.timezone "Asia/Tomsk")
if "%choice%"=="5" (adb -d shell setprop persist.sys.timezone "Europe/Samara")
if "%choice%"=="8" (adb -d shell setprop persist.sys.timezone "Asia/Vladivostok")
if "%choice%"=="0" (goto :m1)
adb -d reboot
Set choice=
rem goto :zone
exit /b

:free
chcp 1251 > nul
cls
if %TESTMODE% == 1 goto :free_end
if %DEBUGMODE% ==1 (
	echo �������������� adb � ������
	)
adb -d wait-for-device
adb -d root
adb -d wait-for-device
adb -d remount
if %DEBUGMODE% ==1 ( 
	echo adb � ������ ������������
	echo ��������� ������ ���������� ��� �������� ����� ��������
	)
adb -d push ./multidisplay_anim_app_white.list /system/etc/qinggan
:free_end
if errorlevel 0 (
	echo. C����� ���������� ��� �������� �������,
	echo. ������� ����� �������
	) else (
	echo oooooooooooo ������ ����������� ����� ooooooooooooooooo
)
pause > nul
exit /b

:apkpure
chcp 1251
cls
if %TESTMODE% == 1 (
echo .adb -d install -g ./APKPure.v.3.19.35.b.3193547.Permissions.Removed_album.apk
::echo. adb -d install -g --user 0 ./APKPure.v.3.19.35.b.3193547.Permissions.Removed_album.apk
goto :apkpure_end
)
if %DEBUGMODE% ==1 (echo Waiting for adb)
adb -d wait-for-device
if %DEBUGMODE% ==1 echo (������������ APKPure)
adb -d install -g ./APKPure.v.3.19.35.b.3193547.Permissions.Removed_album.apk
::adb -d install -g --user 0 ./APKPure.v.3.19.35.b.3193547.Permissions.Removed_album.apk
pause
if %DEBUGMODE% ==1 (
	echo APKPure �����������
	echo ����� ����� ��������� ����������
	)
adb -d shell appops set com.apkpure.aegon REQUEST_INSTALL_PACKAGES allow
adb -d shell appops set com.apkpure.aegon REQUEST_INSTALL_PACKAGES allow --user 0
pause
:apkpure_end
if %DEBUGMODE% ==1 ( echo APKPURE �����������, RIGHTS ������)
echo ����� ��������� ���������� �������
echo ������� ����� ������� ��� �����������
pause > nul
exit /b
:setdns
SET pass=
cls
echo. �� ��������� ��� ������� ��������� 
echo. � ��������� ��������� �����������
echo. �� ��������� �������� ��� �� ������ ���������
ECHO. �� ��������� ��� �������������� � ��������
echo.
echo. ������� 1 ��� common.dot.dns.yandex.net
echo. ������� 2 ��� dns10.quad.net 
echo. ������� 3 ��� �������������� ��������� ���������
echo. ������� 0 ��� �������� � ����
SET /P pass=������� 1, 2, 3 ��� 0 
if not defined pass goto :setdns
if %TESTMODE% == 1 (
	echo ������� %pass%
	echo ������� ����� �������
	pause >nul
	goto :setdns_ex
)
if %pass% == 0 exit /b
adb -d shell settings put global private_dns_mode hostname
adb -d shell settings put global private_dns_default_mode hostname
if %pass% == 1 (
	adb -d shell settings put global private_dns_specifier common.dot.dns.yandex.net
	adb -d shell settings put global captive_portal_fallback_url http://api.browser.yandex.ru/generate_204
	adb -d shell settings put global captive_portal_http_url http://api.browser.yandex.ru/generate_204
	adb -d shell settings put global captive_portal_https_url https://api.browser.yandex.ru/generate_204
	adb -d shell settings put global captive_portal_other_fallback_urls http://www.google.com/generate_204
) 
if %pass% == 2 ( adb -d shell settings put global private_dns_specifier dns10.quad.net )
if %pass% == 3 ( adb -d shell settings put global private_dns_default_mode off )
:setdns_ex
echo. ����������� ��������� DNS
echo. ������� ����� ������� ��� �����������
pause > nul
exit /b

:userapk
cls
echo.
echo. ������ ��������� ���������������� ����������. 
echo. ������ �����������. �� �� ����� ������� ���������������
echo.
echo. �������� ����
echo ----------------------
echo. ����� ����������� ��� ���������� �� ����������� apk2
echo. ����� ���������, ��� ���������� ���������� 
echo. ������� �������� � ������ � ������� ������ "+" � �������
echo.
echo. ��������������� ����� ���������� ��� ������ � ������
echo. 1. yn.apk - ������.���������. �������� ��������� ���� 
echo.     �� �����, ��� ���������� ��������� ������ ���������
echo. 2. HUD+SPEED - "�������-���������". 
echo.     ������� ������������ ��������� 
echo. 3. FMPLAY �������� ����� ������� FM-���������. 
echo.     ��������� ��������
echo. 4. gmaps.apk Google Maps ��� ��� ��� � ���� ��������. 
echo.     �������� ��� ����-��������. �� ���������.
echo. 5. KinoPoisk.apk - ����������� ���������, ������� ������� 
echo.     �������� ������.����
echo. 6. ������.����������. ����� �����������.
echo. ����� �� ����������� ������ ������������� ������ 
echo. ������ ���������������� ����� � ��� �����������
echo. �� ����� ������� � Ru.Store, AppGallery, APKPURE
echo. ���� � ��� � ���� ��������� - ���������� � ������ 
echo. "������� ������" ��-������ https://t.me/voyahchat
pause
for %%i in (./apk2/*.apk) do (
	echo. ������������� %%i
	adb -d install -g "./apk2/%%i" >nul
)
adb -d shell dumpsys deviceidle whitelist +air.StrelkaHUDFREE >nul
adb -d shell appops set ru.vk.store REQUEST_INSTALL_PACKAGES allow >nul
adb -d shell pm grant com.rhythm.hexise.task.pro android.permission.PACKAGE_USAGE_STATS >nul
if %DEBUGMODE% ==1 (echo. ��������� ������� Li.Store)
if exist process.txt del process.txt >nul
adb -d shell pm list packages | find /I "com.lixiang.chat.store" > process.txt
if not exist process.txt (
	echo Disk write protected
	echo installation aborted
	pause
	goto :end
)
for %%i in ("process.txt") do set /a size2=%%~Zi >nul
if %size2% ==  0 (echo Li.Store ���, ����� ��� �� �������) ELSE (
	echo Li.Store ����������, ������ ��� ����� �� ���������
	adb -d shell appops set com.lixiang.chat.store REQUEST_INSTALL_PACKAGES allow >nul
)
if %OS6%==0 if %cunba%==0 (echo Ru.Store �������� �� ����� �������
	adb -d shell pm list packages -3
	pause
	adb -d shell am force-stop ru.vk.store
	adb -d shell pm uninstall ru.vk.store
)
if exist process.txt del process.txt >nul
echo ������� ����� ������� ��� �������� � �������� ����
pause >nul
exit /b

:delcunba
cls
echo preraring to remove cunba
echo ��� ��������, ������� ����� �������
pause >nul
if %TESTMODE% == 0 (
	adb -d shell pm list packages -3
	pause
	adb -d shell am force-stop com.cunba.lantu.otan.enru
	adb -d shell pm uninstall com.cunba.lantu.otan.enru
	adb -d reboot
)
exit /b
:keyb
SET pass=
cls
echo. ������������� ������������ ���������
echo. .APK ��������� ���������� ����� 
echo. ������������ ���������� �������
echo. ������� 1 ��� ���������
echo. 2 ��� ��������� ������ ����������
echo. 0 ��������� � ���������� ����
echo. 
SET /P pass=������� 1 ��� 2 ��� 0 :
if not defined pass goto :keyb
if %TESTMODE% == 1 (
	echo. ������� %pass%
	echo. ������� ����� �������
	pause >nul
	goto :kbend
)
if %pass% == 0 goto :kbend
adb -d root
if %pass% == 1 (
	echo. ��������������� ���������� ��� ������ ����������
	adb -d shell pm enable-user --user 0 com.qinggan.app.qgime
	adb -d root
	adb -d shell pm enable com.qinggan.app.qgime
rem	adb -d shell pm enable com.qinggan.app.qgime.second
rem	adb -d shell pm enable com.android.inputmethod.latin
) else (
	echo. ��������� ������ ����������
	adb -d shell pm disable-user --user 0 com.qinggan.app.qgime
	adb -d root
	adb -d shell pm disable com.qinggan.app.qgime
rem	adb -d shell pm disable com.qinggan.app.qgime.second
rem	adb -d shell pm disable com.android.inputmethod.latin
)
echo. ������� ����� ������� ��� �����������
echo. ��������, ����������� ������������ ��������� ����������
SET pass=
pause >nul
rem if %TESTMODE% == 0 adb -d reboot
:kbend
exit /b
goto :end
:wifiname
SET pass=
echo.
echo. ������� �������� ��� ��� WiFi ����
echo. ���� ��� �������� ����������� �������
echo. ��� 0 ��� �������� � ����
SET /P pass=������� �������� ��� ��� WiFi ���� ��� �������� ����������� �������:
if %TESTMODE% == 1 (
	Echo ������� ��� ����: %pass%
	echo adb -d root
	echo adb -d shell settings put global device_name ''
	echo adb -d shell settings put global device_name_suffix %pass%
	echo adb -d shell settings put global device_name_sample %pass%
	pause
	goto :wifiend
)
if %pass% == 0 goto :wifiend
adb -d root
adb -d shell settings put global device_name ''
adb -d shell settings put global device_name_suffix %pass%
adb -d shell settings put global device_name_sample %pass%
SET pass=
:wifiend
exit /b
:wait-for
set wait1=0
if exist wait.txt del wait.txt >nul
adb -d wait-for-device
:l1
adb shell getprop dev.bootcomplete > "wait.txt"
set /p wait1=< wait.txt
if %wait1%==0 goto :l1
set wait1=
if exist wait.txt del wait.txt >nul
exit /b
rem ������ ��������� ������
:err1
echo off
cls
echo. 
echo.
echo. 
color 04
echo ����������� ������� ������� ��������� � ./adb.exe
echo ��� ������ ������� ����� �������
echo.
echo.
pause > nul
goto :end
:err2
echo off
cls
echo. 
echo.
echo. 
color 04
echo ����������� ���������� adb � �������. ��������� �������� �� �� USB Debug
echo ��� ������ ������� ����� �������
echo.
echo.
pause > nul
goto :end
:err2root
echo off
cls
echo. 
echo.
echo. 
color 04
echo ���������� �������� root-������ � ����������. ��������� ������ ����������
echo ��� ������ ������� ����� �������
echo.
echo.
pause > nul
goto :end
:err3
echo. 
color 04
echo ���������� ���������� LOGCAT. ��������� �������� ����������
echo ��� ������ ������� ����� �������
echo.
echo.
pause > nul
goto :end
:err10
echo off
cls
echo.
echo. 
color 04
echo �� ������� ��������� ���������� ���������� ��������� �������� ����������
echo ��� ������ ������� ����� �������
echo.
echo.
pause > nul
goto :end
:errtw
echo off
cls
echo.
echo. 
color 04
echo �� ������� ��������� ���������� �����. ���������� � ������������
echo ��� ������ ������� ����� �������
echo.
echo.
pause > nul
goto :end
:err22
echo ����������� ������������ �����. ��������� ��� �� �� ��������� �����������
echo ��� ������ ������� ����� �������
pause > nul
goto :end
:errCont
echo �� ��������� ���������� ����� ����� �� ������ ��������
pause
:end
rem ������� ���������������� ����������, ������ ������
set TESTMODE=
set DEBUGMODE=
set cpuver=
set verver=
set size1=
set size2=
set pass=
set cunba=
exit
