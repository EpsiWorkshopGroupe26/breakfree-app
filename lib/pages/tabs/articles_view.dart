import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            for (final category in articles.keys)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      category,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  if (articles[category] != null)
                    for (final article in articles[category]! as List)
                      Card(
                        elevation: 0,
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: InkWell(
                          onTap: () {
                            // Navigate to the article URL
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article['title'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  article['description'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

final articles = {
  "Smoking": [
    {
      "source": "Ameli",
      "title": "Les astuces pour arrêter de fumer et le sevrage",
      "date": "25 octobre 2023",
      "description":
          "Si vous décidez d’arrêter de fumer, vous pouvez entreprendre votre démarche seul ou avec le soutien de structures et de professionnels de santé. Ils vous apportent un suivi personnalisé et un soutien psychologique.",
      "url":
          "https://www.ameli.fr/alpes-maritimes/assure/sante/themes/tabac/astuces-arreter-fumer-sevrage"
    },
    {
      "source": "Santé Publique France",
      "title": "Sevrage tabagique : quels sont les traitements efficaces ?",
      "date": "15 mai 2023",
      "description":
          "Elle peut aider à ne pas « craquer » pour une cigarette en présence d’un fumeur, à ne plus associer la cigarette au café́ par exemple, à gérer son stress autrement qu’en fumant.",
      "url":
          "https://www.santepubliquefrance.fr/determinants-de-sante/tabac/articles/sevrage-tabagique-quels-sont-les-traitements-efficaces"
    },
    {
      "source": "Ministère de la Santé et de la Prévention",
      "title": "Dispositif d’accompagnement à l’arrêt du tabac",
      "date": "09 août 2024",
      "description":
          "Le Plan priorité prévention et le programme national de lutte contre le tabac visent à développer l'accessibilité aux traitements d’aide à l’arrêt tabagique pour tous les fumeurs souhaitant arrêter, particulièrement les plus défavorisés.",
      "url":
          "https://sante.gouv.fr/prevention-en-sante/addictions/article/dispositif-d-accompagnement-a-l-arret-du-tabac"
    }
  ],
  "Alcohol": [
    {
      "source": "Ameli",
      "title": "Alcool : des conseils pour réduire sa consommation",
      "date": "25 janvier 2024",
      "description":
          "Analyser ses habitudes et tenter de consommer moins d’alcool est primordial, et dans certaines situations, arrêter de boire est indispensable.",
      "url":
          "https://www.ameli.fr/alpes-maritimes/assure/sante/themes/alcool-sante/conseils-reduire-consommation"
    },
    {
      "source": "Santé Publique France",
      "title": "Comment réduire les risques de la consommation d’alcool ?",
      "date": "10 juin 2019",
      "description":
          "Il n’y a pas de consommation d’alcool sans risque, et les risques pour la santé augmentent avec la quantité consommée.",
      "url":
          "https://www.santepubliquefrance.fr/determinants-de-sante/alcool/articles/comment-reduire-les-risques-de-la-consommation-d-alcool"
    },
    {
      "source": "La Clinique e-Santé",
      "title": "Alcoolisme : 20 astuces pour réduire votre consommation",
      "date": "15 mars 2023",
      "description":
          "Si l’alcoolisme fait partie de votre vie, envisager de s’en défaire progressivement est un excellent choix. Voici vingt astuces pour arrêter de boire de l'alcool.",
      "url":
          "https://www.la-clinique-e-sante.com/blog/addictions/astuces-reduire-alcoolisme"
    }
  ],
  "Drugs": [
    {
      "source": "Santé Publique France",
      "title":
          "Comment prévenir et réduire les risques liés à la consommation de substances illicites ?",
      "date": "15 juin 2022",
      "description":
          "Plus la consommation est précoce, plus le risque de développer une addiction sur le long terme augmente. L'un des enjeux est donc de retarder l’entrée dans les consommations.",
      "url":
          "https://www.santepubliquefrance.fr/determinants-de-sante/drogues-illicites/articles/comment-prevenir-et-reduire-les-risques-lies-a-la-consommation-de-substances-illicites"
    },
    {
      "source": "Ministère de la Santé et de la Prévention",
      "title":
          "La réduction des risques et des dommages chez les usagers de drogues",
      "date": "2 août 2024",
      "description":
          "Les centres d’accueil et d’accompagnement à la réduction des risques pour usagers de drogues (CAARUD) sont les établissements de première ligne en matière de réduction des risques.",
      "url":
          "https://sante.gouv.fr/prevention-en-sante/addictions/article/la-reduction-des-risques-et-des-dommages-chez-les-usagers-de-drogues"
    },
    {
      "source": "Service-Public.fr",
      "title": "Traitement de la toxicomanie",
      "date": "13 septembre 2023",
      "description":
          "La toxicomanie désigne la dépendance aux drogues comme le cannabis, l’héroïne, ou la cocaïne. Elle peut se traiter à l’initiative de la personne toxicomane elle-même ou à la suite d’un signalement.",
      "url": "https://www.service-public.fr/particuliers/vosdroits/F740"
    }
  ],
  "Gambling": [
    {
      "source": "La Clinique e-Santé",
      "title": "9 étapes pour mettre fin à votre addiction aux jeux d'argent",
      "date": "10 novembre 2023",
      "description":
          "Vous jouez trop et vous ne savez plus quoi faire ? Voici 9 étapes à suivre pour mettre fin à votre addiction aux jeux d’argent.",
      "url":
          "https://www.la-clinique-e-sante.com/blog/addictions/etapes-arret-jeux-argent"
    },
    {
      "source": "GAE Conseil",
      "title": "Comment sortir d’une addiction aux jeux d’argent ?",
      "date": "3 décembre 2023",
      "description":
          "La dépendance aux jeux d’argent peut engendrer de nombreuses difficultés sociales, professionnelles, et familiales. Voici comment accompagner une addiction aux jeux d’argent.",
      "url":
          "https://gaeconseil.fr/comment-sortir-dune-addiction-aux-jeux-dargent/#toc_Comment_soigner_une_addiction_aux_jeux"
    },
    {
      "source": "Joueurs-Infos-Services.fr",
      "title": "Adresses Utiles",
      "date": "2024",
      "description":
          "Trouvez des lieux d'aide spécialisés dans l'accompagnement des personnes en difficulté avec le jeu.",
      "url":
          "https://gaeconseil.fr/comment-sortir-dune-addiction-aux-jeux-dargent/#toc_Comment_soigner_une_addiction_aux_jeux"
    }
  ],
  "Gaming": [
    {
      "source": "MIDELCA",
      "title": "Les écrans et les jeux vidéo",
      "date": "13 avril 2023",
      "description":
          "Le temps passé devant un écran peut avoir des conséquences sur le développement du cerveau des enfants, leur apprentissage, et leur capacité d’attention.",
      "url": "https://www.drogues.gouv.fr/les-ecrans-et-les-jeux-video"
    },
    {
      "source": "CAF",
      "title": "Addiction aux jeux vidéos : comment en sortir ?",
      "date": "2 septembre 2024",
      "description":
          "L'addiction aux jeux vidéos doit être distinguée d'une simple activité récréative excessive. La détection de cette addiction est délicate et doit être faite par des professionnels.",
      "url":
          "https://www.caf.fr/index.php/allocataires/vies-de-famille/articles/addiction-aux-jeux-videos-comment-en-sortir"
    },
    {
      "source": "CHUV",
      "title": "Diminuer par soi-même - Centre du jeu excessif",
      "date": "11 mai 2023",
      "description":
          "Il n'existe pas de solution universelle. Chaque personne doit identifier et tester ses propres stratégies selon son contexte.",
      "url": "https://www.drogues.gouv.fr/les-ecrans-et-les-jeux-video"
    }
  ],
  "SocialMedia": [
    {
      "source": "La Clinique e-Santé",
      "title": "7 conseils pour sortir de l'addiction aux réseaux sociaux",
      "date": "13 novembre 2023",
      "description":
          "Découvrez 7 conseils pour créer une relation saine et équilibrée avec les réseaux sociaux.",
      "url":
          "https://www.la-clinique-e-sante.com/blog/addictions/reseaux-sociaux"
    },
    {
      "source": "e-enfance",
      "title": "Risques des Réseaux Sociaux - Prévention Réseaux Sociaux",
      "date": "2023",
      "description":
          "Victime de harcèlement sur les réseaux sociaux ? Contactez le 3018 ! Découvrez 10 conseils et règles de sécurité.",
      "url":
          "https://e-enfance.org/informer/reseaux-sociaux/?gad_source=1&gclid=Cj0KCQjw05i4BhDiARIsAB_2wfCpR93Hd_0cF2LuhqMKciavCtgxQfC4b7iLa0Zj56cqVdNUqxVWbpIaAqcqEALw_wcB"
    },
    {
      "source": "CHU Sainte-Justine",
      "title":
          "Comment réduire l'impact négatif des réseaux sociaux chez les jeunes ?",
      "date": "15 février 2024",
      "description":
          "Voici quelques outils et conseils pour diminuer les risques liés à l’usage des réseaux sociaux chez les jeunes, particulièrement en matière de dépendance.",
      "url": "https://www.chusj.org/fr/recherche/Adolescent/reseaux-sociaux"
    }
  ]
};
