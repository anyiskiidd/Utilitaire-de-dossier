# Utilitaire-de-dossier

Cet utilitaire de dossier en .bat permet de créer un dossier, de copier tous les fichiers d'un répertoire vers ce dossier, de demander à l'utilisateur s'il souhaite supprimer le dossier et de le supprimer si nécessaire. Le code utilise les commandes set /p pour demander des entrées à l'utilisateur, mkdir pour créer un dossier, xcopy pour copier des fichiers, if pour prendre une décision en fonction de la réponse de l'utilisateur, et rd pour supprimer un dossier. Le code utilise également la commande pause pour permettre à l'utilisateur de voir les résultats avant de fermer la fenêtre.

# Utilisation
Téléchargez le fichier de script .bat.
Ouvrez le fichier dans un éditeur de texte.
Modifiez les paramètres selon vos besoins (par exemple, le nom du dossier à créer, le chemin du répertoire à copier, etc.).
Enregistrez le fichier.
Double-cliquez sur le fichier pour exécuter le script.
Lorsque le script est exécuté, il affiche un message de bienvenue et demande à l'utilisateur de saisir le nom du dossier à créer. Si le dossier existe déjà, l'utilisateur peut choisir de le remplacer ou d'annuler l'opération. Ensuite, l'utilisateur est invité à saisir le chemin du répertoire à copier. Si le répertoire n'existe pas, l'opération est annulée. Tous les fichiers du répertoire sont copiés vers le dossier créé. L'utilisateur peut choisir d'ouvrir le dossier créé et de supprimer le dossier une fois l'opération terminée. Les paramètres peuvent être enregistrés pour une utilisation ultérieure en créant un fichier de configuration. Les informations de journalisation peuvent être affichées à la fin de l'exécution du script.

# Configuration
Les paramètres par défaut peuvent être modifiés dans le script en modifiant les variables de définition en début de script. Les variables suivantes sont disponibles :

default_foldername : le nom par défaut du dossier à créer.
default_sourcedir : le chemin par défaut du répertoire à copier.
default_opendirectory : la réponse par défaut à la question "Voulez-vous ouvrir le dossier créé ?".
default_deletefolder : la réponse par défaut à la question "Voulez-vous supprimer le dossier créé ?".
default_showlog : la réponse par défaut à la question "Voulez-vous afficher les informations de journalisation ?".
# Remarques
Ce script a été testé sur Windows 10 avec succès. Il peut ne pas fonctionner correctement sur d'autres versions de Windows ou avec d'autres configurations système. Utilisez-le à vos propres risques.
Assurez-vous de sauvegarder toutes les données importantes avant d'utiliser ce script.
