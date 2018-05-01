@ECHO OFF

call env.bat

if "%IOS_PLATFORM_DIR%" == "" GOTO SYNTAX
if "%ANDROID_PLATFORM_DIR%" == "" GOTO SYNTAX

ECHO.
ECHO Copie les changements pour Android...
xcopy /Y /S src\android\src\*.* %ANDROID_PLATFORM_DIR%\src

ECHO.
ECHO Copie les changements pour ObjectiveC (IOS)...
xcopy /Y /S src\ios\*.* %IOS_PLATFORM_DIR%\COGNITO\Plugins\cordova-hot-code-push-plugin



GOTO END
:SYNTAX
ECHO.
ECHO Variables manquantes, env.bat existant ?
ECHO Voir exemple dans env.bat.example


:END
ECHO.
pause