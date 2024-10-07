# BreakFree – Lutte contre l'Addiction

## Description
**BreakFree** est une application mobile construite en Flutter pour aider les utilisateurs à lutter contre leurs addictions (drogues, alcool, jeux d’argent, écrans, etc.). L'application utilise le modèle **MVC** (Model-View-Controller) pour structurer le code et fournir une architecture propre et maintenable. BreakFree accompagne les utilisateurs avec des plans de sevrage personnalisés, un système de suivi d'habitudes, une communauté d'entraide et un support professionnel.

## Fonctionnalités Clés
- Suivi des habitudes addictives.
- Plans de sevrage personnalisés.
- Système de récompenses et de badges.
- Communauté d’entraide (forums, groupes de soutien).
- Support professionnel (accès à des thérapeutes et coachs).
- Interface parentale pour aider à gérer l’utilisation des écrans chez les enfants.

## Prérequis
Avant de commencer, assurez-vous d'avoir installé les éléments suivants :
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.0 ou supérieure)
- [Dart SDK](https://dart.dev/get-dart) (inclus avec Flutter)
- Un IDE comme [Android Studio](https://developer.android.com/studio) ou [Visual Studio Code](https://code.visualstudio.com/Download) avec les plugins Flutter et Dart.
- Un émulateur Android/iOS ou un appareil physique pour tester l'application.

## Installation
1. Clonez ce dépôt GitHub sur votre machine locale :

    ```bash
    git clone https://github.com/nom-utilisateur/breakfree-app.git
    cd breakfree-app
    ```

2. Installez les packages nécessaires avec Flutter :

    ```bash
    flutter pub get
    ```

3. Lancez l'application sur un émulateur ou un appareil connecté :

    ```bash
    flutter run
    ```

## Architecture MVC
BreakFree suit le modèle **MVC** pour séparer les responsabilités du code en trois couches principales :
- **Model** : Représente les données et la logique de l'application. Les classes modèles incluent les objets représentant les habitudes, les plans de sevrage, les utilisateurs, etc.
- **View** : Gère l'interface utilisateur et l'affichage des données. Le dossier `views/` contient les widgets Flutter qui représentent les différentes pages et composants de l'UI.
- **Controller** : Intermédiaire entre le modèle et la vue. Il gère les interactions de l'utilisateur, met à jour le modèle, et notifie la vue pour refléter les changements. Les contrôleurs sont situés dans le dossier `controllers/`.

### Détails des dossiers :
- `lib/models/` : Contient les classes modèles qui représentent les données manipulées par l'application.
- `lib/views/` : Comprend tous les écrans et widgets de l'application, organisés par fonctionnalité.
- `lib/controllers/` : Contient la logique métier de l'application et gère l'interaction entre les vues et les modèles.
- `lib/services/` : Services auxiliaires comme les appels API, la gestion de la base de données locale, ou la communication avec les serveurs.

## Fonctionnalités Détaillées

### Suivi des habitudes
- Suivi quotidien des comportements addictifs.
- Rapports générés automatiquement pour aider à visualiser les progrès.
  
### Plans de sevrage personnalisés
- Objectifs personnalisables et ajustés à chaque utilisateur pour réduire les comportements à risque.
- Notifications et rappels pour maintenir l'utilisateur sur la bonne voie.

### Système de récompenses
- Attribution de badges et de niveaux en fonction des progrès réalisés par l'utilisateur.

### Communauté d'entraide
- Accès à des forums anonymes et des groupes de discussion pour échanger avec d'autres utilisateurs.

### Support professionnel
- Mise en relation avec des thérapeutes et coachs certifiés pour un accompagnement personnalisé.

## Exécution des tests
Pour exécuter les tests unitaires et d'intégration, utilisez la commande suivante :

```bash
flutter test
