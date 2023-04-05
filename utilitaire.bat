@echo off

REM Cet exemple de code en .bat permet de créer un dossier, de copier tous les fichiers d'un répertoire vers ce dossier, de demander à l'utilisateur s'il souhaite supprimer le dossier et de le supprimer si nécessaire.

REM Définit des variables pour les couleurs de la console
set "color_red=4"
set "color_green=2"
set "color_yellow=6"
set "color_default=7"

REM Définit des variables pour les paramètres par défaut
set "default_foldername=Nouveau dossier"
set "default_sourcedir=%cd%"
set "default_opendirectory=Non"
set "default_deletefolder=Non"
set "default_showlog=Oui"

REM Vérifie si un fichier de configuration existe
if exist config.ini (
    REM Si un fichier de configuration existe, charge les paramètres
    for /f "tokens=1,2 delims==" %%a in (config.ini) do (
        if "%%a"=="foldername" set "foldername=%%b"
        if "%%a"=="sourcedir" set "sourcedir=%%b"
        if "%%a"=="opendirectory" set "opendirectory=%%b"
        if "%%a"=="deletefolder" set "deletefolder=%%b"
        if "%%a"=="showlog" set "showlog=%%b"
    )
)

REM Si un paramètre n'a pas été défini, utilise la valeur par défaut
if not defined foldername set "foldername=%default_foldername%"
if not defined sourcedir set "sourcedir=%default_sourcedir%"
if not defined opendirectory set "opendirectory=%default_opendirectory%"
if not defined deletefolder set "deletefolder=%default_deletefolder%"
if not defined showlog set "showlog=%default_showlog%"

REM Affiche un message de bienvenue
echo.
echo ******************************************
echo * Bienvenue dans l'utilitaire de dossier *
echo ******************************************
echo.

REM Demande à l'utilisateur de saisir le nom du dossier à créer
set /p foldername=Entrez le nom du dossier à créer [%foldername%] :
if not defined foldername set "foldername=%default_foldername%"

REM Vérifie si le dossier existe déjà
if exist "%foldername%" (
    REM Si le dossier existe, demande à l'utilisateur s'il souhaite le remplacer ou annuler l'opération
    echo.
    echo Le dossier %foldername% existe déjà.
    set /p replacefolder=Voulez-vous le remplacer ? (Oui/Non) :
    if /i "%replacefolder%"=="Oui" (
        REM Si l'utilisateur souhaite remplacer le dossier, supprime le dossier existant
        rmdir /s /q "%foldername%"
        echo.
        echo Le dossier %foldername% a été supprimé.
    ) else (
        REM Si l'utilisateur souhaite annuler l'opération, affiche un message et quitte le script
        echo.
        echo Opération annulée.
        pause
        exit /b
    )
)

REM Crée le dossier
mkdir "%foldername%"

REM Demande à l'utilisateur de saisir le chemin du répertoire à copier
set /p sourcedir=Entrez le chemin du répertoire à copier [%sourcedir%] :
if not defined sourcedir set "sourcedir=%default_sourcedir%"

REM Vérifie si le répertoire existe
if not exist "%sourcedir%" (
REM Si le répertoire n'existe pas, affiche un message d'erreur et quitte le script
echo.
echo Le répertoire %sourcedir% n'existe pas.
pause
exit /b
)

REM Copie tous les fichiers du répertoire vers le dossier créé
xcopy "%sourcedir%" "%foldername%" /s /e /h /y

REM Affiche un message pour confirmer que l'opération est terminée
echo.
echo L'opération est terminée avec succès.

REM Demande à l'utilisateur s'il souhaite ouvrir le dossier créé
set /p opendirectory=Voulez-vous ouvrir le dossier créé ? (Oui/Non) [%opendirectory%] :
if not defined opendirectory set "opendirectory=%default_opendirectory%"

REM Si l'utilisateur répond "Oui", ouvre le dossier dans l'explorateur de fichiers
if /i "%opendirectory%"=="Oui" (
start "" "%foldername%"
)

REM Demande à l'utilisateur s'il souhaite supprimer le dossier créé
set /p deletefolder=Voulez-vous supprimer le dossier créé ? (Oui/Non) [%deletefolder%] :
if not defined deletefolder set "deletefolder=%default_deletefolder%"

REM Si l'utilisateur répond "Oui", supprime le dossier
if /i "%deletefolder%"=="Oui" (
rmdir /s /q "%foldername%"
echo.
echo Le dossier %foldername% a été supprimé.
)

REM Affiche un message de sortie
echo.
echo Merci d'avoir utilisé l'utilitaire de dossier.

REM Demande à l'utilisateur s'il souhaite enregistrer les paramètres pour une utilisation ultérieure
set /p saveconfig=Voulez-vous enregistrer les paramètres ? (Oui/Non) :
if /i "%saveconfig%"=="Oui" (
REM Si l'utilisateur souhaite enregistrer les paramètres, crée un fichier de configuration
echo foldername=%foldername%>config.ini
echo sourcedir=%sourcedir%>>config.ini
echo opendirectory=%opendirectory%>>config.ini
echo deletefolder=%deletefolder%>>config.ini
echo showlog=%showlog%>>config.ini
)

REM Demande à l'utilisateur s'il souhaite afficher les informations de journalisation
if /i "%showlog%"=="Oui" (
echo.
echo ******************************************
echo * Informations de journal *
echo ******************************************
echo Nom du dossier : %foldername%
echo Répertoire source : %sourcedir%
echo Ouvrir le dossier : %opendirectory%
echo Supprimer le dossier : %deletefolder%
echo Enregistrer les paramètres : %saveconfig%
) else (
REM Si l'utilisateur ne souhaite pas afficher les informations de journalisation, nettoie la console
cls
)
