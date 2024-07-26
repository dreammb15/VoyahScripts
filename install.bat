@echo off
chcp 1251 > nul
:: �������� 0 ��� ������� ������ ������� ����������� 1 - ������� adb ������� �� �����������
set TESTMODE=1
:: ���� DEBUGMODE=0 �� ����� ���� ������ �� �����
set DEBUGMODE=1
:: �������� ���������� "�� ���������"
set cpuver=qcom
:: ������ �������� 9, 11 ��� 13 -14
set verver=11
:: ������ � ������ .apk ������ 1.7.0
set size1=90437039
:: CUNBA ��� (��-���������)
set cunba=0
::
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
echo *                                                       *
echo *                                                       *
echo *                                                       *
echo *********************************************************
echo.       �������� �� ��������� ��� �� �������
echo.
echo ������� ������ ��� ���������� �������� ����� ����������
pause >nul
if %DEBUGMODE% == 1 (
	echo DEBUGMODE is %DEBUGMODE% TESTMODE is %TESTMODE%
	echo �������� ������� ������������� �����
	)
if  exist "./apk/VoyahTweaks.apk" (cd ./apk) else goto :err22
for %%i in ("VoyahTweaks.apk") do set /a size1=%%~Zi > nul
if  %size1% ==  90437039 (echo ������������� ������ 1.7.0) else goto :err23
cd "..\"
if %DEBUGMODE% == 1 (echo �������� ������� �������������� ������)
if not exist "./source/init.logcat.sh" goto :err1
if not exist "./source/multidisplay_anim_app_white.list" goto :err1
if not exist "./apk/app-launcher.apk" goto :err1
if exist "./platform-tools/adb.exe" (cd ./platform-tools) else goto :err1
if %DEBUGMODE% == 1 (
	echo ��� ������������ ����� ������������
	echo �������� �������� ADB. ��������� ��� USB Debug ��������
	echo.
	echo ����� ������� ����� ������� �������� � �������� ����
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
	echo NO DEVICE CONNECTED ������� �� ����� �������������� ������
	ECHO ��������� ����������� � ��������� ������ �����
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
:tweaks
rem call :adbscreen ������, �� ��� � ������� ������ ���������
if  %TESTMODE% == 1 ( 
	echo ��� �����������, �������� ������
	pause > nul
	goto :m1
)
adb -d root
if not errorlevel 0 goto :err2root
adb -d wait-for-device
if not errorlevel 0 goto :err2
adb -d disable-verity
if not errorlevel 0 goto :err2
adb -d reboot
adb -d wait-for-device
if not errorlevel 0 goto :err2
adb -d root
adb -d wait-for-device
if not errorlevel 0 goto :err2
if %verver% == 9 (
	if %DEBUGMODE% == 1 (echo ���������� LOGCAT ��� �������)
	goto :nx1
	)
adb -d remount
if not errorlevel 0 goto :err3
adb -d push ./../source/init.logcat.sh /system/etc/
if not errorlevel 0 goto :err3
adb -d reboot
adb -d wait-for-device
:nx1
adb -d root
adb -d wait-for-device
if %cunba% == 0 (
	echo. ��������� ��������� ������� ����������
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

echo ������������ �����
if %cunba% == 1 (
	echo ������ �����, ���������� ���, � ������ ���� ������ ��� �������
)
adb install ./../apk/VoyahTweaks.apk
if not errorlevel 0 goto :errtw
echo ����� ����������
if %cunba% == 0 (
	echo ������������ �������
	adb uninstall com.simplemobiletools.applauncher > nul
	adb install ./../apk/app-launcher.apk
	if %DEBUGMODE% == 1 (echo ������� ����������)
)
echo ������� ����� �� ����������
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.SYSTEM_ALERT_WINDOW
if not errorlevel 0 goto :err2
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.READ_LOGS
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.RECORD_AUDIO
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.WRITE_EXTERNAL_STORAGE
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.WRITE_SECURE_SETTINGS
if %DEBUGMODE% == 1 (
	echo ����� �� ���������� �������
	echo �������! (�)
)
adb -d shell am start ru.kachalin.voyahtweaks/.android.activity.main.MainActivity
if errorlevel 0 (echo �������) ELSE (
	echo oooooooooooo ������ ��������� ����������� ooooooooooooooooo
	)

echo.
echo.
echo ����� ������������ �������� � ������ �� �� ��������������� ������ ������� � ��������� ������
echo.
pause
echo ������� ����� ������� ��� ������������ ����������� � �����������
echo.
pause >nul
adb -d reboot
rem goto :addons
:addons
rem reserved for future use
rem ���� �������� ���� 
cls
:m1
set choice=
cls
if %DEBUGMODE% == 1 (
echo.     CPU %cpuver% on android %verver% cunba %cunba%
)
Echo �������� ����������� ��������� ���������:
Echo.
if %cunba% == 0 (
	Echo 1 - ��������� TWEAKS + LAUNCHER
	) else (
	Echo 1 - ��������� TWEAKS ��� LAUNCHER'a
)
Echo 2 - ��������� ���������� APKPURE
Echo 3 - ��������� ��������� ����
if %cunba% == 0 Echo 4 - ��������� ���������� �������������� �������� �� ����� ���������
Echo 5 - ��������� DNS ��� ���������� ������ ����������
Echo 6 - ��������� ���������������� ����������
if %cunba% == 1 Echo 7 - �������� CUNBA � ����������
Echo 8 - ���������/��������� ���������� ����������
Echo 0 - �����
 
echo.
Set /p choice="��� �����: "
if not defined choice goto m1
if "%choice%"=="3" (call :zone)
if %cunba% == 0 if "%choice%"=="4" (call :free)
if "%choice%"=="2" (call :apkpure)
if "%choice%"=="1" (goto tweaks)
if "%choice%"=="5" (call :setdns)
if "%choice%"=="6" (call :userapk)
if %cunba% == 1 if "%choice%"=="7" (call :delcunba)
if "%choice%"=="8" (call :keyb)
if "%choice%"=="0" goto :end
goto m1

:zone
set choice=
cls
echo timezone settings
echo ����� ���������, ���� ����������� ������������� ����� ������������ 
Echo �������� ���������:
Echo.
Echo 1 - GMT+1 Europe/Belgrade
Echo 2 - GMT+2 Europe/Kaliningrad
Echo 3 - GMT+3 ������
Echo 4 - GMT+4 �����/�����������
Echo 5 - GMT+5 Europe/Samara
Echo 8 - GMT+8 �����/�����������
Echo 0 - ������� � ���������� ����
 
echo.
Set /p choice="��� �����: "
if %TESTMODE% ==1 (
	echo ������ ����� %choice%
	echo ������� ����� ������� ��� �������� � ������� ����
	pause >nul
	goto :m1
)
if not defined choice goto :zone
if "%choice%"=="1" (adb -d shell settings put global time_zone Europe/Belgrade)
if "%choice%"=="2" (adb -d shell setprop persist.sys.timezone "Europe/Kaliningrad")
if "%choice%"=="3" (adb -d shell setprop persist.sys.timezone "Europe/Moscow")
if "%choice%"=="4" (adb -d shell setprop persist.sys.timezone "Asia/Tomsk")
if "%choice%"=="5" (adb -d shell setprop persist.sys.timezone "Europe/Samara")
if "%choice%"=="8" (adb -d shell setprop persist.sys.timezone "Asia/Vladivostok")
if "%choice%"=="0" (goto :m1)
adb -d reboot
goto :zone
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
adb -d push ./../source/multidisplay_anim_app_white.list /system/etc/qinggan
:free_end
if errorlevel 0 (
	echo C����� ���������� ��� �������� ����� �������� �������, ������� ����� �������
	) else (
	echo oooooooooooo ������ ����������� ����� ooooooooooooooooo
)
pause > nul
exit /b

:apkpure
chcp 1251
cls
if %TESTMODE% == 1 goto :apkpure_end
if %DEBUGMODE% ==1 (echo Waiting for adb)
if not exist ./adb.exe (cd ./platform-tools)
adb -d wait-for-device
if %DEBUGMODE% ==1 echo (������������ APKPure)
adb -d install -g ./../apk/APKPure.v.3.19.35.b.3193547.Permissions.Removed_album.apk
if %DEBUGMODE% ==1 (
	echo APKPure �����������
	echo ����� ����� ��������� ����������
	)
adb -d shell appops set com.apkpure.aegon REQUEST_INSTALL_PACKAGES allow
:apkpure_end
if %DEBUGMODE% ==1 ( echo APKPURE �����������, RIGHTS ������)
echo ����� ��������� ���������� �������
echo ������� ����� ������� ��� �����������
pause > nul
exit /b

:adbscreen
if %TESTMODE% == 1 goto :exadb
if not exist adb.exe (cd ./platform-tools)
adb kill-server > nul
echo Waiting for adb
adb -d wait-for-device
if not errorlevel 0 goto :err2
rem ����� ������� ��� ���������� ������������ � �� ���� ��� ������ ������� ������������� ������������� "USB Debug"
if %DEBUGMODE% ==1 (echo "���������� ������ �������")
adb -d shell getprop ro.build.version.release > "version.txt"
if not exist version.txt goto :writeerror
set /p verver=< version.txt
if %DEBUGMODE% ==1 (
	if %verver% == 11 echo REST
	if %verver% == 9 echo do_REST
	if %verver% == 13 echo HONOR
	echo ��������� ���� ���������� � ������
	)
adb -d shell getprop ro.hardware > "cpu.txt"
set /p cpuver=< cpu.txt
if %cpuver% == qcom ( 
	if %DEBUGMODE% ==1 (echo "you running QUALCOMM")
	set cputype =1
	)
if %cpuver% == nxp (
	if %DEBUGMODE% ==1 (echo "you running OLD VERSION multimedia")
	set cputype = 0
	)
echo CPU %cpuver% on android %verver%
if %DEBUGMODE% ==1 pause
rem ������� ���������� ��������� ���� CPU adb -d shell dumpsys cpuinfo
if %DEBUGMODE% ==1 (echo "��������� ������� CUNBA")
if exist process.txt del process.txt > nul
adb -d shell pm list packages | find /I "cunba" > process.txt
if not exist process.txt (
	echo Disk write protected
	echo installation aborted
	pause
	goto :end
	)
for %%i in ("process.txt") do set /a size2=%%~Zi > nul
if %size2% ==  0 (echo CUNBA ���, ������������� ������ ������) ELSE (set cunba = 1)
if %DEBUGMODE% ==1 (echo "��������� ������, ������� ��������� �����")
if exist version.txt del version.txt > nul
if exist process.txt del process.txt > nul
f exist cpu.txt del cpu.txt > nul
:exadb
exit /b
:setdns
if not exist "./adb.exe" (cd ./platform-tools)
echo.
echo.
SET /P pass=������� 1 ��� common.dot.dns.yandex.net ��� 2 ��� dns10.quad.net:
if %TESTMODE% == 1 (
	echo ������� %pass%
	echo ������� ����� �������
	pause >nul
	goto :setdns_ex
)
adb -d shell settings put global private_dns_mode hostname
rem testtesttest
adb -d shell settings put global private_dns_default_mode hostname
rem test_end
if %pass% == 1 (
	adb -d shell settings put global private_dns_specifier common.dot.dns.yandex.net
	adb -d shell settings put global captive_portal_fallback_url http://api.browser.yandex.ru/generate_204
	adb -d shell settings put global captive_portal_http_url http://api.browser.yandex.ru/generate_204
	adb -d shell settings put global captive_portal_https_url https://api.browser.yandex.ru/generate_204
	adb -d shell settings put global captive_portal_other_fallback_urls http://www.google.com/generate_204
) else  adb -d shell settings put global private_dns_specifier dns10.quad.net
:setdns_ex
echo ����������� ��������� DNS
echo ������� ����� ������� ��� �����������
pause > nul
exit /b
:userapk
cls
if %DEBUGMODE% ==1 (echo �������� ������� �������� � ������������)
if not exist ".././apk2" (
	echo.
	echo ������� ���������������� ������ ./apk2 ����������� 
	echo ������� ����� ������� ��� �������� � �������� ����
	pause >nul
	exit /b
)
echo. �������� ���������
echo ������ ��������� ���������������� ����������. 
echo ������ �����������. �� �� ����� ������� ���������������
echo.
echo. �������� ����
echo ----------------------
echo ����� ����������� ��������� ���� ���������� �� ����������� apk2
echo ����� ���������, ��� ���������� ���������� ������� �������� � ������ � ������� ������ "+" � �������
echo. 
echo. ��������������� ����� ���������� ��� ������ � ������
echo. 1. yn.apk - ������.���������. �������� ��������� ���� �� �����, ��� ���������� ��������� ������ ���������
echo. 2. HUD+SPEED - "�������-���������". (������� ������������ ���������)
echo. 3. FMPLAY �������� ����� ������� FM-���������. ������� ��������
echo. 4. gmaps.apk Google Maps ��� ��� ��� � ���� ��������. �������� ��� ����-��������. �� ���������.
echo. 5. KinoPoisk.apk - ����������� ���������, ������� ������� �������� ������.����
echo. 
echo. ����� �� ����������� ������������ ����� �������, ��� ���������������� ����� �����������
rem �� ����� ������� � cunba.ru/apk ��� � 4pda ��� � AppGallery
rem ���� � ��� � ���� ��������� - ���������� � ������ "������� ������"
pause
if %TESTMODE% == 1 (
	for %%i in (.././apk2/*.apk) do (echo adb -d install -g .././apk2/%%i)
) ELSE (
	for %%i in (.././apk2/*.apk) do (adb -d install -g .././apk2/%%i)
	adb -d shell appops set com.lixiang.chat.store REQUEST_INSTALL_PACKAGES allow > nul
	)
echo ������� ����� ������� ��� �������� � �������� ����
pause > nul
exit /b
goto :end

:delcunba
cls
echo preraring to remove cunba
echo �����������, ������� ����� �������
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
cls
if not exist "./adb.exe" (cd ./platform-tools)
echo.
echo.
SET /P pass=������� 1 ��� ��������� ��� 2 ��� ��������� ������ ����������:
if %TESTMODE% == 1 (
	echo ������� %pass%
	echo ������� ����� �������
	pause >nul
	goto :kbend
)
if %pass% == 1 (
	echo. ��������������� ���������� ��� ������ ����������
	adb -d shell pm enable com.qinggan.app.qgime
	adb -d shell pm enable com.qinggan.app.qgime.second
	adb -d shell pm enable com.android.inputmethod.latin
) else (
	echo. ��������� ������ ����������
	adb -d shell pm disable com.qinggan.app.qgime
	adb -d shell pm disable com.qinggan.app.qgime.second
	adb -d shell pm disable com.android.inputmethod.latin
)
echo ������� ����� �������, ��� �����������, ����������� ������������ ��������� ����������
pause >nul
if %TESTMODE% == 0 adb -d reboot
:kbend
exit /b
goto :end
rem ������ ��������� ������
:err1
echo off
cls
echo. 
echo.
echo. 
color 04
echo ����������� ������� ������� ��������� � ./platform-tools/adb.exe
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
