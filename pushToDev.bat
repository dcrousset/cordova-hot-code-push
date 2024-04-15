@ECHO OFF

call env.bat

if "%IOS_PLATFORM_DIR%" == "" (
    if "%ANDROID_PLATFORM_DIR%" == "" (
        GOTO SYNTAX
    )
)

if "%IOS_PLATFORM_DIR%" neq "" (
    ECHO.
    ECHO "Copie les changements pour ObjectiveC (IOS) to %IOS_PLATFORM_DIR%"
    xcopy /Y /S src\ios\*.* "%IOS_PLATFORM_DIR%\COGNITO Coach\Plugins\cordova-hot-code-push-plugin"
    xcopy /Y /S www\*.* "%IOS_PLATFORM_DIR%\www\plugins\cordova-hot-code-push-plugin\www"
)

if "%ANDROID_PLATFORM_DIR%" neq "" (
    ECHO.
    ECHO "Copie les changements pour Android to %ANDROID_PLATFORM_DIR%"
    xcopy /Y /S src\android\src\*.* %ANDROID_PLATFORM_DIR%\app\src\main\java
    xcopy /Y /S www\*.* %ANDROID_PLATFORM_DIR%\app\src\main\assets\www\plugins\cordova-hot-code-push-plugin\www
)


GOTO END
:SYNTAX
ECHO.
ECHO Variables manquantes, env.bat existant ?
ECHO Voir exemple dans env.bat.example


:END
ECHO.
ECHO sur ios-build, lancer ./local-deploy.sh pour updater le mobile
ECHO sur Mac, ouvrir 'Console' et select le device à monitorer
TIME /T