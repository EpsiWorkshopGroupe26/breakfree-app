import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  TextSpan bulletPoint(String text, BuildContext context) {
    return TextSpan(
      text: '• ',
      style: TextStyle(
        fontSize: 16,
        height: 1.5,
        color: Colors.black,
      ),
      children: [
        TextSpan(
          text: text,
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Politique de Confidentialité'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              // Section 1
              TextSpan(
                text: '1. Types de Données Collectées\n',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'Dans le cadre de notre mission pour vous accompagner dans la lutte contre les addictions, nous collectons et traitons les données suivantes :\n\n',
              ),

              // Sous-section Données d\'Identification
              TextSpan(
                text: 'Données d\'Identification :\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bulletPoint(
                  'Adresse e-mail : Utilisée pour la création de votre compte, la gestion de votre accès sécurisé, et pour les communications importantes liées à votre utilisation de la plateforme.\n',
                  context),
              bulletPoint(
                  'Mot de passe : Protège votre compte, hashé et non stocké en texte clair.\n\n',
                  context),

              // Sous-section Données Personnelles
              TextSpan(
                text: 'Données Personnelles :\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bulletPoint(
                  'Prénom, Nom, Âge, Genre : Ces informations nous permettent de personnaliser l\'expérience sur la plateforme et d\'adapter les conseils et suivis à votre situation.\n',
                  context),
              bulletPoint(
                  'Situation Professionnelle : Nous l’utilisons pour comprendre votre environnement et ajuster les recommandations en fonction de votre style de vie.\n\n',
                  context),

              // Sous-section Données sur l’Addiction
              TextSpan(
                text: 'Données sur l’Addiction :\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bulletPoint(
                  'Type d\'addiction, Fréquence, Durée, Conséquences, Tentatives de sevrage : Ces données sont essentielles pour dresser un profil précis de votre situation d\'addiction. Elles nous permettent de vous fournir des recommandations personnalisées sur les méthodes de réduction ou d\'arrêt de votre ou vos addiction(s).\n\n',
                  context),

              // Sous-section Données sur votre bien-être mental
              TextSpan(
                text: 'Données sur votre bien-être mental :\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bulletPoint(
                  'État émotionnel, Symptômes de dépression, Niveau de stress : Ces informations sont traitées pour mieux comprendre votre état psychologique actuel, essentiel pour adapter nos conseils et éventuellement vous rediriger vers des professionnels de santé si nécessaire.\n\n',
                  context),

              // Sous-section Données sur votre Motivation
              TextSpan(
                text: 'Données sur votre Motivation :\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bulletPoint(
                  'Motivation pour changer, Réseau de soutien, Consultation d\'un professionnel : Ces éléments sont utilisés pour comprendre vos ressources internes et externes, afin d’optimiser votre parcours vers une meilleure gestion de l\'addiction.\n\n',
                  context),

              // Sous-section Données sur vos Objectifs et votre progression
              TextSpan(
                text: 'Données sur vos Objectifs et votre progression :\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bulletPoint(
                  'Objectifs liés à votre addiction, Réalisation des objectifs : Nous utilisons ces informations pour suivre votre progression et vous encourager, tout en adaptant les conseils et ressources proposés selon vos réalisations.\n\n',
                  context),

              // Section 2
              TextSpan(
                text: '2. Contexte d\'Utilisation des Données\n',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'Les données que nous collectons sont utilisées dans différents contextes :\n\n',
              ),

              // Sous-section 2.1
              TextSpan(
                text: '2.1. Contexte Médical et de Suivi Thérapeutique\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'Les données personnelles et d\'addiction collectées peuvent être exploitées dans un cadre médical ou de suivi thérapeutique pour :\n\n',
              ),
              bulletPoint(
                  'Évaluer l\'état d\'addiction et la progression de l\'utilisateur.\n',
                  context),
              bulletPoint(
                  'Fournir des conseils personnalisés adaptés à la situation spécifique de chaque utilisateur.\n',
                  context),
              bulletPoint(
                  'Recommander des solutions et des ressources : telles que des méthodes de sevrage, des pratiques de bien-être mental (ex. méditation, pleine conscience), ou des programmes d’accompagnement en ligne.\n',
                  context),
              bulletPoint(
                  'Les données peuvent aussi être anonymisées et partagées avec des professionnels de la santé (si explicitement autorisé par l\'utilisateur) pour orienter les conseils médicaux ou thérapeutiques.\n\n',
                  context),

              // Sous-section 2.2
              TextSpan(
                text: '2.2. Suivi de l\'Utilisateur et des Addictions\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bulletPoint(
                  'Suivi de la progression : Nous utilisons vos données pour suivre votre évolution au fil du temps. Cela nous permet d\'adapter les outils, modules et ressources que nous mettons à votre disposition selon vos progrès ou les difficultés rencontrées.\n',
                  context),
              bulletPoint(
                  'Historique des interactions : Pour vous offrir un parcours cohérent et personnalisé, nous conservons un historique de vos réponses aux différents formulaires et de vos réalisations en lien avec vos objectifs.\n\n',
                  context),

              // Sous-section 2.3
              TextSpan(
                text: '2.3. Conseils et Recommandations\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'En fonction des données d\'addiction et de bien-être mental fournies, nous vous proposons des méthodes pour réduire ou arrêter votre ou vos addiction(s). Cela inclut des conseils pratiques, des techniques de gestion du stress, et des recommandations de sevrage progressif adaptées à votre situation personnelle.\n',
              ),
              TextSpan(
                text:
                    'Si nous identifions des signaux d\'alerte dans vos réponses (comme des niveaux de stress très élevés ou des symptômes de dépression), nous pourrons également vous suggérer de consulter un professionnel de la santé mentale.\n\n',
              ),

              // Section 3
              TextSpan(
                text: '3. Sécurité et Chiffrement des Données\n',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Sous-section 3.1
              TextSpan(
                text: '3.1. Chiffrement\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'Toutes les données que nous collectons sont chiffrées à plusieurs niveaux :\n\n',
              ),
              bulletPoint(
                  'Chiffrement en transit : Toutes les communications entre votre appareil et nos serveurs sont sécurisées via des protocoles de chiffrement (SSL/TLS) pour prévenir toute interception de vos données.\n',
                  context),
              bulletPoint(
                  'Chiffrement au repos : Vos données personnelles et médicales sont chiffrées dans notre base de données pour garantir qu’elles ne soient accessibles qu\'aux utilisateurs autorisés.\n\n',
                  context),

              // Sous-section 3.2
              TextSpan(
                text: '3.2. Authentification Sécurisée\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bulletPoint(
                  'Mots de passe : Les mots de passe que vous choisissez sont hachés (et non stockés en clair), ce qui signifie qu\'ils sont protégés contre les violations de données.\n\n',
                  context),

              // Section 4
              TextSpan(
                text: '4. Confidentialité\n',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bulletPoint(
                  'Accès restreint : Seul un nombre limité de personnes au sein de l’équipe BreakFree a accès à vos données, et cela uniquement dans le cadre de la gestion et du suivi de la plateforme.\n',
                  context),
              bulletPoint(
                  'Partage des données : Nous ne partagerons vos données avec des tiers (professionnels de la santé), seulement si vous nous en faites la demande explicite. Sinon, aucune de vos données ne sera partagée avec des tiers, y compris les professionnels de la santé.\n',
                  context),
              bulletPoint(
                  'Anonymisation des données : Dans le cadre de recherches ou de statistiques, vos données sont anonymisées afin qu\'il soit impossible de vous identifier personnellement.\n\n',
                  context),

              // Section 5
              TextSpan(
                text: '5. Droits de l\'utilisateur\n',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bulletPoint(
                  'Accès : Vous pouvez à tout moment accéder aux informations que nous avons collectées sur vous via votre compte utilisateur.\n',
                  context),
              bulletPoint(
                  'Modification : Vous avez la possibilité de corriger ou mettre à jour vos données personnelles à tout moment.\n',
                  context),
              bulletPoint(
                  'Suppression : Vous pouvez demander la suppression complète de votre compte et de toutes les données associées, en conformité avec les règles du RGPD (Règlement Général sur la Protection des Données).\n\n',
                  context),

              // Section 6
              TextSpan(
                text: '6. Conclusion\n',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'Chez BreakFree, nous prenons la sécurité et la confidentialité de vos informations très au sérieux. Vos données sont toutes chiffrées et traitées avec soin, et nous les utilisons uniquement pour vous accompagner dans votre parcours vers une vie plus équilibrée, loin des addictions.\n',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
