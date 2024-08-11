@echo off
:: После скачивания данного файла с github, его настоятельно рекомендуется открыть с помощью нотепада и сохранить как ANSI
chcp 1251 > nul
mode con lines=30 cols=60
pushd "%~dp0"
:: ВКЛЮЧИТЬ 0 для боевого режима ПРОБЕЛЫ НЕДОПУСТИМЫ 1 - никакие adb команды не выполняются
set TESTMODE=0
:: если DEBUGMODE=0 не будет кучи вывода на экран
set DEBUGMODE=1
:: значения переменных "по умолчанию"
set cpuver=qcom
:: версия андроида 9, 11 или 13 -14
set verver=11
:: размер в байтах .apk версии 1.7.0
set size1=90437039
:: размер нового ланчера в байтах
set size2=22191081
:: CUNBA нет (по-умолчанию)
set cunba=0
:: время создания 6.0.5 за сутки до
set times=1720819728
set osversion=6
::
:: version 20.07.2024 16:51
:: добавлено изменение DNS
:: version 16:57
:: добавлен выбор time-zone при коррекции часов
:: 17:25 планы по установке пользовательских apk из каталога apk2
:: 17:50 подчищены ошибки, добавлена установка приложений (все скопом)
:: 22.07.2024 21:56 внесены изменения для удобства отладки. убраны не нужные 
:: более комментарии строк выполнения кода
:: 0:19 пересмотрена концепция кода :) могут быть редкие недочеты
:: 24.07.2024 исправлена пара-тройка десятков ошибок и недочетов :) методом тестирования "по-живому"
:: 25.07.2024 тестирование по-живому закончено. Изменен порядок пунктов меню. Изменен набор пользовательских приложений
cls
echo.
echo.
echo.
echo *********************************************************
echo *  ВНИМАНИЕ. ВСЕ ЧТО ВЫ ДЕЛАЕТЕ ДАЛЕЕ			*
echo *  ВЫ ДЕЛАЕТЕ НА СВОЙ СТРАХ И РИСК			*
echo *  И БЕРЕТЕ НА СЕБЯ ВСЮ ДАЛЬНЕЙШУЮ			*
echo *  ОТВЕТСТВЕННОСТЬ 					*
echo * 							*
echo *							*
echo *                                                       *
echo *                                                       *
echo *                                                       *
echo *********************************************************
echo.       надеемся вы понимаете что вы делаете
echo. При поддержке и попустительстве телеграмм-канала
echo.      Voyah Chat https://t.me/voyahchat
echo НАЖМИТЕ ПРОБЕЛ ДЛЯ ВЫПОЛНЕНИЯ ПРОВЕРОК ПЕРЕД УСТАНОВКОЙ
pause >nul
if %DEBUGMODE% == 1 (
	echo DEBUGMODE is %DEBUGMODE% TESTMODE is %TESTMODE%
	echo проверка размера установочного файла
	)
if  exist "./apk/VoyahTweaks.apk" (cd ./apk) else goto :err22
for %%i in ("VoyahTweaks.apk") do set /a size1=%%~Zi > nul
if %size1%==90437039 (echo устанавливаем версию 1.7.0) 
if %size1%==90437011 (echo устанавливаем версию 1.7.2)
if %size1%==90440743 (echo устанавливаем версию 1.8.0)
rem goto :err23
cd "..\"
if %DEBUGMODE% == 1 (echo проверка наличия дополнительных файлов)
if not exist "./source/init.logcat.sh" goto :err1
if not exist "./source/multidisplay_anim_app_white.list" goto :err1
if not exist "./apk/app-launcher.apk" goto :err1
if %size1%==90440743 (
	echo проверим размер ланчера
	cd ./apk
	for %%i in ("app-launcher.apk") do set /a size2=%%~Zi > nul
	if %size2% NEQ 22191081 (goto :ERRcont) 
	echo устанавливаем новую версию ланчера
	cd "..\"
)
if exist "./platform-tools/adb.exe" (cd ./platform-tools) else goto :err1
if %DEBUGMODE% == 1 (
	echo все установочные файлы присутствуют
	echo Начинаем проверки ADB. Убедитесь что USB Debug включено
	echo.
	echo после нажатия любой клавиши 
	echo выполним небольшое тестирование и перейдем в основное меню
	pause >nul
	)
rem определяем с чем работаем и устанавливаем значения переменным
if  %TESTMODE% == 1 goto :skips
adb devices > dev.txt
if not exist dev.txt (
	echo ОШИБКА ЗАПИСИ НА ЛОКАЛЬНЫЙ ДИСК
	echo нажмите любую клавишу для выхода
	pause >nul
	goto :end
)
for %%i in ("dev.txt") do set /a size1=%%~Zi > nul
if  %size1% ==  28 ( echo. ------ВНИМАНИЕ
	echo NO DEVICE CONNECTED НОТЕБУК НЕ ВИДИТ ПОДСОЕДИНЕННОЙ МАШИНЫ
	ECHO ПРОВЕРЬТЕ ПОДКЛЮЧЕНИЕ И ЗАПУСТИТЕ СКРИПТ СНОВА
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
	echo ТУТ мы ОСТАНОВИМСЯ, не должны сюда попасть совсем
	pause > nul 
	goto :addons
	)
goto :end
REM *************** ниже основной код ****************
:tweaks
rem call :adbscreen убрано, мы его в текущей сессии выполняли
if  %TESTMODE% == 1 ( 
	echo ТУТ ОСТАНОВИМСЯ, ТЕСТОВЫЙ ПРОГОН
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
	if %DEBUGMODE% == 1 (echo пропускаем LOGCAT для дореста)
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
	echo. Разрешаем ресайзить размеры приложения
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

echo Устанавливаю Твикс
if %cunba% == 1 (
	echo только твикс, автозапуск его, и выдача прав твиксу БЕЗ ланчера
)
adb install ./../apk/VoyahTweaks.apk
if not errorlevel 0 goto :errtw
echo Твикс установлен
if %cunba% == 0 (
	echo Устанавливаю лаунчер
rem добавим проверку установлен ли ланчер, и, если установлен, спросим,хотим ли мы его переустановить **********************
if %DEBUGMODE% ==1 pause
if %DEBUGMODE% ==1 (echo ПРОВЕРЯЕМ НАЛИЧИЕ уже установленного ланчера)
if exist process.txt del process.txt > nul
adb -d shell pm list packages | find /I "com.simplemobiletools.applauncher" > process.txt
if not exist process.txt (
	echo Disk write protected
	echo installation aborted
	pause
	goto :end
	)
for %%i in ("process.txt") do set /a size2=%%~Zi > nul
if %size2% ==  0 (echo Чистая установка
goto :ex3
) ELSE (
	:zone2
	echo Обнаружен установленный ланчер. Выберите
	Echo 1 - удалить и установить заново. все добавленные приложения будут удалены из ланчера (не с машины)
	Echo 2 - установить ланчер из установочного пакета поверх имеющегося. Все настройки будут сохранены
	Echo 3 - пропустить установку ланчера
	 echo.
	Set /p choice="Ваш выбор: "
	if not defined choice goto :zone2
	if "%choice%"=="1" (
		adb uninstall com.simplemobiletools.applauncher > nul
		adb install ./../apk/app-launcher.apk
		goto :ex2
	)
	if "%choice%"=="2" (
:ex3		adb install ./../apk/app-launcher.apk
		goto :ex2
	)
	if "%choice%"=="3" (
		goto :ex2
	)
	cls
	goto :zone2
	:ex2
	if %DEBUGMODE% ==1 (echo подтираем хвосты, удаляем временные файлы)
	if exist process.txt del process.txt > nul
	rem окончание проверки*********************************************************************************************************
		if %DEBUGMODE% == 1 (echo Лаунчер установлен)
)
echo Раздаем права на приложение
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.SYSTEM_ALERT_WINDOW
if not errorlevel 0 goto :err2
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.READ_LOGS
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.RECORD_AUDIO
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.WRITE_EXTERNAL_STORAGE
adb -d shell pm grant ru.kachalin.voyahtweaks android.permission.WRITE_SECURE_SETTINGS
if %DEBUGMODE% == 1 (
	echo Права на приложение раздали
	echo Поехали! (с)
)
adb -d shell am start ru.kachalin.voyahtweaks/.android.activity.main.MainActivity
if errorlevel 0 (echo УСПЕШНО) ELSE (
	echo oooooooooooo Ошибка установки автозапуска ooooooooooooooooo
	)

echo.
echo.
echo ПЕРЕД ПРОДОЛЖЕНИЕМ ВКЛЮЧИТЕ В ТВИКСЕ НА ГУ ПЕРЕОПРЕДЕЛЕНИЕ КНОПКИ ЛАНЧЕРА и Плавающую кнопку
echo.
pause
echo Нажмите любую клавишу для перезагрузки мультимедиа и продолжения
echo.
pause >nul
adb -d reboot
rem goto :addons
:addons
rem reserved for future use
rem ниже основное меню 
cls
:m1
set choice=
cls
echo. При поддержке и попустительстве телеграмм-канала
echo.      Voyah Chat https://t.me/voyahchat
echo.         (c) 2024 все права защищены 
if %DEBUGMODE% == 1 (
echo.     CPU %cpuver% on android %verver% cunba %cunba%
)
Echo Выберите возможности программы установки:
Echo.
if %cunba% == 0 (
	Echo. 1 - Установка TWEAKS + LAUNCHER
	) else (
	Echo. 1 - Установка TWEAKS БЕЗ LAUNCHER'a
)
Echo. 2 - Установка приложения APKPURE
Echo. 3 - Установка временной зоны
if %cunba% == 0 Echo. 4 - Перетаскивание программ на экран пассажира
Echo. 5 - Коррекция DNS для нормальной работы приложений
Echo. 6 - Установка пользовательских приложений
if %cunba% == 1 Echo. 7 - Удаление CUNBA с устройства
Echo. 8 - Разрешить/запретить встроенную клавиатуру
Echo. 9 - Удаление иероглифов из имени WiFi сети
Echo. 0 - ВЫХОД
 
echo.
Set /p choice="Ваш выбор: "
if not defined choice goto m1
if "%choice%"=="3" (call :zone)
if %cunba% == 0 if "%choice%"=="4" (call :free)
if "%choice%"=="2" (call :apkpure)
if "%choice%"=="1" (goto tweaks)
if "%choice%"=="5" (call :setdns)
if "%choice%"=="6" (call :userapk)
if %cunba% == 1 if "%choice%"=="7" (call :delcunba)
if "%choice%"=="8" (call :keyb)
if "%choice%"=="9" (call :wifiname)
if "%choice%"=="0" goto :end
goto m1

:zone
set choice=
cls
echo timezone settings
echo После установки, блок мультимедиа автоматически будет перезагружен 
Echo Выберите установки:
Echo.
Echo. 1 - GMT+1 Europe/Belgrade
Echo. 2 - GMT+2 Europe/Kaliningrad
Echo. 3 - GMT+3 Москва
Echo. 4 - GMT+4 Томск/Новосибирск
Echo. 5 - GMT+5 Europe/Samara
Echo. 8 - GMT+8 Китай/Владивосток
Echo. 0 - ВОЗВРАТ в предыдущее меню
 
echo.
Set /p choice="Ваш выбор: "
if %TESTMODE% ==1 (
	echo сделан выбор %choice%
	echo нажмите любую клавишу для возврата в главное меню
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
	echo Подготовливаем adb к работе
	)
adb -d wait-for-device
adb -d root
adb -d wait-for-device
adb -d remount
if %DEBUGMODE% ==1 ( 
	echo adb к работе подготовлено
	echo Обновляем список приложений для переноса между экранами
	)
adb -d push ./../source/multidisplay_anim_app_white.list /system/etc/qinggan
:free_end
if errorlevel 0 (
	echo Cписок приложений для переноса между экранами обновлён, нажмите любую клавишу
	) else (
	echo oooooooooooo Ошибка копирования файла ooooooooooooooooo
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
if %DEBUGMODE% ==1 echo (Устанавливаю APKPure)
adb -d install -g ./../apk/APKPure.v.3.19.35.b.3193547.Permissions.Removed_album.apk
if %DEBUGMODE% ==1 (
	echo APKPure установлено
	echo Выдаю права установки приложений
	)
adb -d shell appops set com.apkpure.aegon REQUEST_INSTALL_PACKAGES allow
:apkpure_end
if %DEBUGMODE% ==1 ( echo APKPURE установлено, RIGHTS выданы)
echo Права установки приложений раздали
echo нажмите любую клавишу для продолжения
pause > nul
exit /b

:adbscreen
if %TESTMODE% == 1 goto :exadb
if not exist adb.exe (cd ./platform-tools)
adb kill-server > nul
echo Waiting for adb
adb -d wait-for-device
if not errorlevel 0 goto :err2
rem далее считаем что соединение присутствует и не надо при каждой команде передергивать переключатель "USB Debug"
if %DEBUGMODE% ==1 (echo "ОПРЕДЕЛЯЕМ ВЕРСИЮ АНДРОИД")
adb -d shell getprop ro.build.version.release > "version.txt"
if not exist version.txt goto :writeerror
set /p verver=< version.txt
adb -d shell getprop ro.bootimage.build.date.utc >"osdate.txt"
set /p times=<osdate.txt
if times GTR osversion ( 
	echo WOW ! Устанавливаем на последнюю прошивку
	
)
if times LEQ osversion ( 
	echo WOW ! Устанавливаем НА НЕ последнюю прошивку
	
)
if %DEBUGMODE% ==1 (
	if %verver% == 11 echo Рестайлинг
	if %verver% == 9 echo Дорестайлинг
	if %verver% == 13 echo тестовый HONOR
	echo ПОЛУЧЕНИЕ ТИПА ПРОЦЕССОРА В МАШИНЕ
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
rem вариант неудачного получения типа CPU adb -d shell dumpsys cpuinfo
if %DEBUGMODE% ==1 (echo. ПРОВЕРЯЕМ НАЛИЧИЕ CUNBA)
if exist process.txt del process.txt > nul
adb -d shell pm list packages | find /I "cunba" > process.txt
if not exist process.txt (
	echo Disk write protected
	echo installation aborted
	pause
	goto :end
	)
for %%i in ("process.txt") do set /a size2=%%~Zi > nul
if %size2% ==  0 (echo CUNBA нет, устанавливаем ПОЛНУЮ версию) ELSE (set cunba = 1)
if %DEBUGMODE% ==1 (echo "подтираем хвосты, удаляем временные файлы")
if exist version.txt del version.txt > nul
if exist process.txt del process.txt > nul
if exist cpu.txt del cpu.txt > nul
if exist osdate.txt del osdate.txt > nul"
:exadb
exit /b
:setdns
if not exist "./adb.exe" (cd ./platform-tools)
echo. ВЫ ПОНИМАЕТЕ ЧТО ВНОСИТЕ ИЗМЕНЕНИЯ В СИСТЕМНЫЕ НАСТРОЙКИ МУЛЬТИМЕДИЯ
echo. НА ПОЛУЧЕНИЯ ПРОШИВОК ЭТО НЕ ДОЛЖНО СКАЗАТЬСЯ
ECHO. ВЫ ПРОчИТАЛИ ВСЕ ВЫШЕНАПИСАННОЕ И СОГЛАСНЫ
echo. Введите ниже 1 для common.dot.dns.yandex.net
echo. 2 для dns10.quad.net, 0 для возврата в меню
SET /P pass=Введите 1, 2 или 0 
if %TESTMODE% == 1 (
	echo Введено %pass%
	echo нажмите любую клавишу
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
) else  adb -d shell settings put global private_dns_specifier dns10.quad.net
:setdns_ex
echo. ПРОИЗВЕДЕНА НАСТРОЙКА DNS
echo. нажмите любую клавишу для продолжения
pause > nul
exit /b
:userapk
cls
if %DEBUGMODE% ==1 (echo Проверим наличие каталога с приложениями)
if not exist ".././apk2" (
	echo.
	echo. каталог пользовательских файлов ./apk2 отсутствует 
	echo. нажмите любую клавишу для возврата в основное меню
	pause >nul
	exit /b
)
echo. Проверка выполнена
echo. НАЧАЛО УСТАНОВКИ ПОЛЬЗОВАТЕЛЬСКИХ ПРИЛОЖЕНИЙ. 
echo. БУДЬТЕ ВНИМАТЕЛЬНЫ. МЫ НЕ НЕСЕМ НИКАКОЙ ОТВЕТСТВЕННОСТИ
echo.
echo. ПРОЧТИТЕ НИЖЕ
echo ----------------------
echo. Будет произведена установка всех приложений из подкаталога apk2
echo. После установки, все приложения необходимо 
echo. ВРУЧНУЮ добавить в машине с помощью кнопки "+" в ланчере
echo.
echo. Рекомендованный набор приложений для работы в машине
echo. 1. yn.apk - Яндекс.Навигатор. Работает голосовой ввод 
echo.     от Алисы, при правильной настройке языков программы
echo. 2. HUD+SPEED - "Стрелка-Антирадар". 
echo.     требует внимательной настройки 
echo. 3. FMPLAY Интернет радио каналов FM-диапазона. 
echo.     Требуется интернет
echo. 4. gmaps.apk Google Maps для тех кто в этом понимает. 
echo.     Работают без гугл-сервисов. Не обновлять.
echo. 5. KinoPoisk.apk - стандартный КиноПоиск, требует наличия 
echo.     подписки Яндекс.Плюс
echo. 
echo. Чтобы не перегружать установочный архив файлами, 
echo. почти все пользовательские файлы ОТСУТСТВУЮТ
echo. Их можно скачать с cunba.ru/apk или с 4pda или с AppGallery
echo. Если у вас с этим сложности - обратитесь в раздел 
echo. "платная помощь" ТК канала https://t.me/voyahchat
pause
if %TESTMODE% == 1 (
	for %%i in (.././apk2/*.apk) do (echo adb -d install -g .././apk2/%%i)
) ELSE (
	for %%i in (.././apk2/*.apk) do (adb -d install -g .././apk2/%%i)
	adb -d shell appops set com.lixiang.chat.store REQUEST_INSTALL_PACKAGES allow > nul
	adb -d shell dumpsys deviceidle whitelist +air.StrelkaHUDFREE >nul
	adb -d shell appops set ru.vk.store REQUEST_INSTALL_PACKAGES allow
	adb -d shell pm grant com.rhythm.hexise.task.pro android.permission.PACKAGE_USAGE_STATS


	)
echo нажмите любую клавишу для возврата в основное меню
pause > nul
exit /b
goto :end

:delcunba
cls
echo preraring to remove cunba
echo РЕАЛИЗОВАНО, нажмите любую клавишу
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
echo. КАТЕГОРИЧЕСКИ РЕКОМЕНДУТСЯ УСТАНОВКА
echo. .APK СТОРОННЕЙ КЛАВИАТУРЫ ПЕРЕД 
echo. ПРОДОЛЖЕНИЕМ ВЫПОЛНЕНИЯ СКРИПТА
echo. Введите 1 для РАЗРЕШИТЬ
echo. 2 для ЗАПРЕТИТЬ родную клавиатуру
echo. 0 вернуться в предыдущее меню
echo. 
SET /P pass=Введите 1 или 2 или 0 :
if %TESTMODE% == 1 (
	echo. Введено %pass%
	echo. нажмите любую клавишу
	pause >nul
	goto :kbend
)
if %pass% == 0 goto :kbend
adb -d root
if %pass% == 1 (
	echo. Восстанавливаем разрешения для родной клавиатуры
	adb -d shell pm enable-user --user 0 com.qinggan.app.qgime
	adb -d root
	adb -d shell pm enable com.qinggan.app.qgime
rem	adb -d shell pm enable com.qinggan.app.qgime.second
rem	adb -d shell pm enable com.android.inputmethod.latin
) else (
	echo. Запрещаем родную клавиатуру
	adb -d shell pm disable-user --user 0 com.qinggan.app.qgime
	adb -d root
	adb -d shell pm disable com.qinggan.app.qgime
rem	adb -d shell pm disable com.qinggan.app.qgime.second
rem	adb -d shell pm disable com.android.inputmethod.latin
)
echo. Нажмите любую клавишу для продолжения
echo. Возможно, потребуется перезагрузка головного устройства
SET pass=
pause >nul
rem if %TESTMODE% == 0 adb -d reboot
:kbend
exit /b
goto :end
:wifiname
SET pass=
echo.
echo. Введите желаемое имя для WiFi сети
echo. сети БЕЗ пробелов английскими буквами
echo. ИЛИ 0 для возврата в меню
SET /P pass=Введите желаемое имя для WiFi сети БЕЗ пробелов английскими буквами:
if %TESTMODE% == 1 (
	Echo Введено имя сети: %pass%
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
rem дальше обработка ошибок
:err1
echo off
cls
echo. 
echo.
echo. 
color 04
echo отсутствует каталог системы установки и ./platform-tools/adb.exe
echo для выхода нажмите любую клавишу
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
echo отсутствует соединение adb с машиной. Проверьте включили ли вы USB Debug
echo для выхода нажмите любую клавишу
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
echo невозможно получить root-доступ к устройству. Установка видимо невозможна
echo для выхода нажмите любую клавишу
echo.
echo.
pause > nul
goto :end
:err3
echo. 
color 04
echo невозможно установить LOGCAT. Установка частично невозможна
echo для выхода нажмите любую клавишу
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
echo не удалось правильно установить разрешение изменения размеров приложения
echo для выхода нажмите любую клавишу
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
echo не удалось правильно установить ТВИКС. Обратитесь к специалистам
echo для выхода нажмите любую клавишу
echo.
echo.
pause > nul
goto :end
:err22
echo Отсутствуют установочные файлы. Проверьте все ли вы правильно распаковали
echo для выхода нажмите любую клавишу
pause > nul
goto :end
:errCont
echo Вы пытаетесь установить НОВЫЙ твикс со СТАРЫМ ланчером
pause
:end
rem убираем предопределенные переменные, чистим хвосты
set TESTMODE=
set DEBUGMODE=
set cpuver=
set verver=
set size1=
set size2=
set pass=
set cunba=
exit
