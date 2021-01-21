@ECHO OFF

call env.bat

if "%IOS_PLATFORM_DIR%" == "" (
    if "%ANDROID_PLATFORM_DIR%" == "" (
        GOTO SYNTAX
    )
)

if "%IOS_PLATFORM_DIR%" neq "" (
    ECHO.
    ECHO "Copie les changements pour ObjectiveC (IOS)..."
    xcopy /Y /S src\ios\*.* %IOS_PLATFORM_DIR%\COGNITO\Plugins\cordova-hot-code-push-plugin
)

if "%ANDROID_PLATFORM_DIR%" neq "" (
    ECHO.
    ECHO "Copie les changements pour Android..."
    xcopy /Y /S src\android\src\*.* %ANDROID_PLATFORM_DIR%\src
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