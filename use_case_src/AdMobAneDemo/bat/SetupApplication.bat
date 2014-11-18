:user_configuration

:: About AIR application packaging
:: http://livedocs.adobe.com/flex/3/html/help.html?content=CommandLineTools_5.html#1035959
:: http://livedocs.adobe.com/flex/3/html/distributing_apps_4.html#1037515

:: NOTICE: all paths are relative to project root

:: Android packaging
set AND_CERT_NAME="AdMobAneDemo"
set AND_CERT_PASS=
set AND_CERT_FILE=cert\and_development.p12
set AND_ICONS=system

set AND_SIGNING_OPTIONS=-storetype pkcs12 -keystore "%AND_CERT_FILE%" -storepass %AND_CERT_PASS%

:: iOS packaging
set IOS_DIST_CERT_FILE=cert\ios_development.p12
set IOS_DEV_CERT_FILE=cert\ios_development.p12
set IOS_DEV_CERT_PASS=
set IOS_PROVISION=cert\ios_development.mobileprovision
set IOS_ICONS=system

set IOS_DEV_SIGNING_OPTIONS=-storetype pkcs12 -keystore "%IOS_DEV_CERT_FILE%" -storepass %IOS_DEV_CERT_PASS% -provisioning-profile %IOS_PROVISION%
set IOS_DIST_SIGNING_OPTIONS=-storetype pkcs12 -keystore "%IOS_DIST_CERT_FILE%" -storepass %IOS_DEV_CERT_PASS% -provisioning-profile %IOS_PROVISION%

:: Application descriptor
set APP_XML=src\AdMobAneDemo-app.xml
set APP_XML=application.xml

:: Files to package
set APP_DIR=bin
set FILE_OR_DIR=-C %APP_DIR% .

:: Your application ID (must match <id> of Application descriptor)
set APP_ID=com.codealchemy.admobane.sample

:: Output packages
set DIST_PATH=dist
set DIST_NAME=AdMobAneDemo

:: Debugging using a custom IP
set DEBUG_IP=


:validation
%SystemRoot%\System32\find /C "<id>%APP_ID%</id>" "%APP_XML%" > NUL
if errorlevel 1 goto badid
goto end

:badid
echo.
echo ERROR:
echo   Application ID in 'bat\SetupApplication.bat' (APP_ID)
echo   does NOT match Application descriptor '%APP_XML%' (id)
echo.

:end
