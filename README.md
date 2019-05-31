# MDI TP2 : Docker

### By KHEAV Kevin - MUGUET Nicolas

Pour ce deuxième TP de MDI, nous nous attaquions aux conteneurs avec Docker

Nous devions dockeriser une application utilisant la bibliothèque OpenCV. 
La principale difficulté, outre l'apprentissage de l'utilisation de Docker, était donc la compilation de OpenCV, qui nous a causé bon nombre de soucis.

Ce dockerfile permet donc dans un premier temps d'installer Debian.
Il télécharge et installe ensuite les diverses dépendances du projet.
Une fois cela terminé, on clone le git contenant le code source de l'application que l'on veut pouvoir exécuter.
Viens ensuite la création de plusieurs dossiers, permetant de contourner un souci (un path "en dur") dans le code source.
On peut maintenant cloner le git d'OpenCV puis le compiler.
Enfin, on build l'application à l'aide de Maven, on obtient donc ainsi notre application compilée et fonctionnelle
