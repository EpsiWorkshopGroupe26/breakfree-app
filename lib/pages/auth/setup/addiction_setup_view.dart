import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/models/addiction_model_form.dart';
import 'package:breakfree/utils/enums/addiction_enum.dart';
import 'package:breakfree/widgets/button.dart';
import 'package:breakfree/widgets/spacing.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter/material.dart';

List<Object> addictionList = [];

class AddictionSetupView extends StatefulWidget {
  final Function(AddictionModelForm) onAddictionAdded;

  AddictionSetupView({
    super.key,
    required this.onAddictionAdded,
  });

  @override
  State<AddictionSetupView> createState() => _AddictionSetupViewState();
}

class _AddictionSetupViewState extends State<AddictionSetupView> {
  List<AddictionModelForm> addictions = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quelle sont tes addictions ?',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Spacing.large(),
              GroupButton(
                isRadio: false,
                buttons: AddictionEnum.values.map((e) => e.name).toList(),
                onSelected: (label, index, isSelected) {
                  showBottomSheet(
                    context: context,
                    backgroundColor: context.colorScheme.surfaceContainer,
                    enableDrag: true,
                    showDragHandle: true,
                    builder: (context) {
                      return AddictionForm(
                        addiction: AddictionEnum.values[index],
                        onAddictionAdded: (addiction) {
                          addictions.add(addiction);
                          widget.onAddictionAdded(addiction);
                        },
                      );
                    },
                  );
                },
                options: GroupButtonOptions(
                  mainGroupAlignment: MainGroupAlignment.start,
                ),
                buttonBuilder:
                    (bool selected, String value, BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                      color: selected
                          ? context.colorScheme.primary
                          : context.colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      value == AddictionEnum.Smoking.name
                          ? 'Tabac'
                          : value == AddictionEnum.Alcohol.name
                              ? 'Alcool'
                              : value == AddictionEnum.Drugs.name
                                  ? 'Drogue'
                                  : value == AddictionEnum.Gambling.name
                                      ? 'Jeux d’argent'
                                      : value == AddictionEnum.Gaming.name
                                          ? 'Jeux vidéo'
                                          : value ==
                                                  AddictionEnum.SocialMedia.name
                                              ? 'Réseaux sociaux'
                                              : value == AddictionEnum.Tv.name
                                                  ? 'Télévision'
                                                  : value ==
                                                          AddictionEnum
                                                              .Shopping.name
                                                      ? 'Shopping'
                                                      : value ==
                                                              AddictionEnum
                                                                  .Food.name
                                                          ? 'Nourriture'
                                                          : value ==
                                                                  AddictionEnum
                                                                      .Sex.name
                                                              ? 'Sexe'
                                                              : 'Travail',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: selected
                                ? context.colorScheme.onPrimary
                                : context.colorScheme.onSurface,
                          ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddictionForm extends StatelessWidget {
  final AddictionEnum addiction;
  final Function(AddictionModelForm) onAddictionAdded;

  const AddictionForm({
    super.key,
    required this.addiction,
    required this.onAddictionAdded,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController frequencyController = TextEditingController();
    final TextEditingController durationController = TextEditingController();
    final TextEditingController consequencesController =
        TextEditingController();
    final TextEditingController weaningController = TextEditingController();
    final TextEditingController lastUseController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: addictionQuestions[addiction.name].length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                final question = addictionQuestions[addiction.name][index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question['questions'][0],
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Spacing.medium(),
                    question.containsKey('answers')
                        ? GroupButton(
                            isRadio: true,
                            buttons: question['answers'],
                            onSelected: (label, index, isSelected) {},
                            options: GroupButtonOptions(
                              mainGroupAlignment: MainGroupAlignment.start,
                            ),
                            buttonBuilder: (bool selected, String value,
                                BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: selected
                                      ? context.colorScheme.primary
                                      : context.colorScheme.surface,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: selected
                                            ? context.colorScheme.onPrimary
                                            : context.colorScheme.onSurface,
                                      ),
                                ),
                              );
                            },
                          )
                        : TextFormField(
                            controller: consequencesController,
                            decoration: InputDecoration(
                              hintText: 'Réponse',
                              hintStyle:
                                  Theme.of(context).textTheme.titleMedium,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                    if (index == addictionQuestions[addiction.name].length - 1)
                      const Padding(padding: EdgeInsets.only(top: 100)),
                    const Spacing.xlarge(),
                  ],
                );
              },
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: BreakfreeButton(
              label: 'Valider',
              onPressed: () async {
                await onAddictionAdded(
                  AddictionModelForm(
                    type: addiction.name,
                    frequency: frequencyController.text,
                    duration: durationController.text,
                    consequences: consequencesController.text,
                    weaning: weaningController.text,
                    lastUse: lastUseController.text,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Map<String, dynamic> addictionQuestions = {
  "Smoking": [
    {
      "questions": ["Quelle est votre consommation quotidienne de tabac?"],
      "answers": [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "10 et plus"
      ]
    },
    {
      "questions": ["Depuis combien de temps fumez-vous?"],
      "answers": [
        "Moins de 6 mois",
        "6 mois à 1 an",
        "1 à 5 ans",
        "Plus de 5 ans"
      ]
    },
    {
      "questions": ["Avez-vous remarqué des conséquences négatives?"],
    },
    {
      "questions": ["Avez-vous déjà tenter des sevrages?"],
      "answers": [
        "Jamais",
        "patchs",
        "gommes",
        "cigarettes électroniques",
        "médicaments",
        "thérapies",
        "groupes de soutien",
        "applications",
        "livres",
        "vidéos",
        "podcasts",
        "réseaux sociaux",
        "Autre"
      ]
    },
    {
      "questions": ["Quels sont tes objectifs?"],
      "answers": [
        "Arrêter de fumer",
        "Réduire la consommation",
        "Changer de marque",
        "Changer de type de tabac",
        "Changer de type de cigarette",
      ]
    }
  ],
  "Alcohol": [
    {
      "questions": ["À quelle fréquence consommez-vous de l'alcool?"],
      "answers": [
        "7 fois/semaine ou plus",
        "entre 4 à 6 fois/semaine",
        "entre 2 et 3 fois/semaine",
        "1 fois/semaine ou moins"
      ]
    },
    {
      "questions": ["Depuis combien de temps consommez-vous de l'alcool?"],
      "answers": [
        "Moins de 6 mois",
        "6 mois à 1 an",
        "1 à 5 ans",
        "Plus de 5 ans"
      ]
    },
    {
      "questions": ["Avez-vous remarqué des conséquences négatives?"],
    },
    {
      "questions": ["Avez-vous déjà tenter des sevrages?"],
      "answers": [
        "Jamais",
        "fixer des périodes",
        "réduire les quantités",
        "réduire les fréquences",
        "remplacer par des boissons non alcoolisées",
        "ne plus boire seul",
      ]
    },
    {
      "questions": ["Quels sont tes objectifs?"],
      "answers": [
        "Arrêter de boire",
        "Réduire la consommation",
        "Changer de type de boisson",
        "Changer de lieu de consommation",
        "Changer de moment de consommation",
      ]
    }
  ],
  "Drugs": [
    {
      "questions": ["À quelle fréquence consommez-vous des drogues?"],
      "answers": [
        "7 fois/semaine ou plus",
        "entre 4 à 6 fois/semaine",
        "entre 2 et 3 fois/semaine",
        "1 fois/semaine ou moins"
      ],
    },
    {
      "questions": ["Depuis combien de temps consommez-vous des drogues?"],
      "answers": [
        "Moins de 6 mois",
        "6 mois à 1 an",
        "1 à 5 ans",
        "Plus de 5 ans"
      ]
    },
    {
      "questions": ["Avez-vous remarqué des conséquences négatives?"],
    },
    {
      "questions": ["Avez-vous déjà tenter des sevrages?"],
      "answers": [
        "Jamais",
        "fixer des périodes",
        "réduire les quantités",
        "réduire les fréquences",
        "remplacer par des activités saines",
        "ne plus consommer seul",
      ]
    },
    {
      "questions": ["Quels sont tes objectifs?"],
      "answers": [
        "Arrêter de consommer",
        "Réduire la consommation",
        "Changer de type de drogue",
        "Changer de lieu de consommation",
        "Changer de moment de consommation",
      ]
    }
  ],
  "Gambling": [
    {
      "questions": [
        "Combien d'heures par semaine consacrez-vous aux jeux d'argent?"
      ],
      "answers": [
        "8h/semaine ou plus",
        "entre 5 à 7h/semaine",
        "entre 3 et 4h/semaine",
        "moins de 3h/semaine"
      ]
    },
    {
      "questions": ["Depuis combien de temps jouez-vous aux jeux d'argent?"],
      "answers": [
        "Moins de 6 mois",
        "6 mois à 1 an",
        "1 à 5 ans",
        "Plus de 5 ans"
      ]
    },
    {
      "questions": ["Avez-vous remarqué des conséquences négatives?"],
    },
    {
      "questions": ["Avez-vous déjà tenter des sevrages?"],
      "answers": [
        "Jamais",
        "fixer des périodes",
        "réduire les montants",
        "réduire les fréquences",
        "remplacer par des activités saines",
        "ne plus jouer seul",
      ]
    },
    {
      "questions": ["Quels sont tes objectifs?"],
      "answers": [
        "Arrêter de jouer",
        "Réduire la consommation",
        "Changer de type de jeu",
        "Changer de lieu de jeu",
        "Changer de moment de jeu",
      ]
    }
  ],
  "Gaming": [
    {
      "questions": [
        "Combien d'heures par semaine consacrez-vous aux jeux vidéo?"
      ],
      "answers": [
        "8h/semaine ou plus",
        "entre 5 à 7h/semaine",
        "entre 3 et 4h/semaine",
        "moins de 3h/semaine"
      ]
    },
    {
      "questions": ["Depuis combien de temps jouez-vous aux jeux vidéo?"],
      "answers": [
        "Moins de 6 mois",
        "6 mois à 1 an",
        "1 à 5 ans",
        "Plus de 5 ans"
      ]
    },
    {
      "questions": ["Avez-vous remarqué des conséquences négatives?"],
    },
    {
      "questions": ["Avez-vous déjà tenter des sevrages?"],
      "answers": [
        "Jamais",
        "fixer des périodes",
        "réduire les durées",
        "réduire les fréquences",
        "remplacer par des activités saines",
        "ne plus jouer seul",
        "ne plus jouer en ligne",
        "trouver des jeux moins addictifs",
        "sortir plus souvent",
        "arreter apres une certaine heure",
      ]
    },
    {
      "questions": ["Quels sont tes objectifs?"],
      "answers": [
        "Arrêter de jouer",
        "Réduire la consommation",
        "Changer de type de jeu",
        "Changer de lieu de jeu",
        "Changer de moment de jeu",
      ]
    }
  ],
  "SocialMedia": [
    {
      "questions": [
        "Combien d'heures par semaine consacrez-vous aux réseaux sociaux?"
      ],
      "answers": [
        "12h ou plus",
        "entre 9h et 11h",
        "entre 6h et 8h",
        "moins de 6h"
      ]
    },
    {
      "questions": [
        "Depuis combien de temps utilisez-vous les réseaux sociaux?"
      ],
      "answers": [
        "Moins de 6 mois",
        "6 mois à 1 an",
        "1 à 5 ans",
        "Plus de 5 ans"
      ]
    },
    {
      "questions": ["Avez-vous remarqué des conséquences négatives?"],
    },
    {
      "questions": ["Avez-vous déjà tenter des sevrages?"],
      "answers": [
        "Jamais",
        "fixer des périodes",
        "réduire les durées",
        "réduire les fréquences",
        "supprimer des applications",
        "désactiver des comptes",
        "ne plus suivre de comptes",
        "ne plus publier de contenu",
        "ne plus consulter les réseaux sociaux",
        "trouver des activités moins addictives",
        "sortir plus souvent",
        "arreter apres une certaine heure",
      ]
    },
    {
      "questions": ["Quels sont tes objectifs?"],
      "answers": [
        "Arrêter d'utiliser les réseaux sociaux",
        "Réduire la consommation",
        "Changer de type de réseau social",
        "Changer de lieu de connexion",
        "Changer de moment de connexion",
      ]
    }
  ],
  "Tv": [
    {
      "questions": [
        "Combien d'heures par semaine regardez-vous la télévision?"
      ],
      "answers": [
        "8h/semaine ou plus",
        "entre 5 à 7h/semaine",
        "entre 3 et 4h/semaine",
        "moins de 3h/semaine"
      ]
    },
    {
      "questions": ["Depuis combien de temps regardez-vous la télévision?"],
      "answers": [
        "Moins de 6 mois",
        "6 mois à 1 an",
        "1 à 5 ans",
        "Plus de 5 ans"
      ]
    },
    {
      "questions": ["Avez-vous remarqué des conséquences négatives?"],
    },
    {
      "questions": ["Avez-vous déjà tenter des sevrages?"],
      "answers": [
        "Jamais",
        "fixer des périodes",
        "réduire les durées",
        "réduire les fréquences",
        "regarder des programmes moins addictifs",
        "sortir plus souvent",
        "arreter apres une certaine heure",
      ]
    },
    {
      "questions": ["Quels sont tes objectifs?"],
      "answers": [
        "Arrêter de regarder la télévision",
        "Réduire la consommation",
        "Changer de type de programme",
        "Changer de lieu de visionnage",
        "Changer de moment de visionnage",
      ]
    }
  ],
  "Shopping": [
    {
      "questions": ["À quelle fréquence faites-vous du shopping?"],
      "answers": [
        "3 fois/semaine ou plus",
        "entre 1 et 2 fois/semaine",
        "1 fois/semaine ou moins",
        "2 fois/mois ou moins"
      ]
    },
    {
      "questions": ["Depuis combien de temps faites-vous du shopping?"],
      "answers": [
        "Moins de 6 mois",
        "6 mois à 1 an",
        "1 à 5 ans",
        "Plus de 5 ans"
      ]
    },
    {
      "questions": ["Avez-vous remarqué des conséquences négatives?"],
    },
    {
      "questions": ["Avez-vous déjà tenter des sevrages?"],
      "answers": [
        "Jamais",
        "fixer des périodes",
        "réduire les montants",
        "réduire les fréquences",
        "remplacer par des activités saines",
        "ne plus acheter seul",
      ]
    },
    {
      "questions": ["Quels sont tes objectifs?"],
      "answers": [
        "Arrêter de faire du shopping",
        "Réduire la consommation",
        "Changer de type de produit",
        "Changer de lieu de shopping",
        "Changer de moment de shopping",
      ]
    }
  ],
  "Food": [
    {
      "questions": [
        "À quelle fréquence avez-vous des comportements alimentaires compulsifs?"
      ],
      "answers": ["Jamais", "Rarement", "Parfois", "Souvent", "Toujours"]
    },
    {
      "questions": [
        "Depuis combien de temps avez-vous des comportements alimentaires compulsifs?"
      ],
      "answers": [
        "Moins de 6 mois",
        "6 mois à 1 an",
        "1 à 5 ans",
        "Plus de 5 ans"
      ]
    },
    {
      "questions": ["Avez-vous remarqué des conséquences négatives?"],
    },
    {
      "questions": ["Avez-vous déjà tenter des sevrages?"],
      "answers": [
        "Jamais",
        "fixer des périodes",
        "réduire les quantités",
        "réduire les fréquences",
        "remplacer par des aliments sains",
        "ne plus manger seul",
      ]
    },
    {
      "questions": ["Quels sont tes objectifs?"],
      "answers": [
        "Arrêter de manger compulsivement",
        "Réduire la consommation",
        "Changer de type d'aliment",
        "Changer de lieu de consommation",
        "Changer de moment de consommation",
      ]
    }
  ],
  "Sex": [
    {
      "questions": [
        "À quelle fréquence avez-vous des comportements sexuels compulsifs?"
      ],
      "answers": ["Jamais", "Rarement", "Parfois", "Souvent", "Toujours"]
    },
    {
      "questions": [
        "Depuis combien de temps avez-vous des comportements sexuels compulsifs?"
      ],
      "answers": [
        "Moins de 6 mois",
        "6 mois à 1 an",
        "1 à 5 ans",
        "Plus de 5 ans"
      ]
    },
    {
      "questions": ["Avez-vous remarqué des conséquences négatives?"],
    },
    {
      "questions": ["Avez-vous déjà tenter des sevrages?"],
      "answers": [
        "Jamais",
        "fixer des périodes",
        "réduire les durées",
        "réduire les fréquences",
        "remplacer par des activités saines",
        "ne plus avoir de relations sexuelles seul",
        "ne plus regarder de contenu pornographique",
      ]
    },
    {
      "questions": ["Quels sont tes objectifs?"],
      "answers": [
        "Arrêter d'avoir des relations sexuelles compulsives",
        "Réduire la consommation",
        "Changer de type de relation",
        "Changer de lieu de relation",
        "Changer de moment de relation",
      ]
    }
  ],
  "Work": [
    {
      "questions": [
        "À quelle fréquence ressentez-vous le besoin compulsif de travailler?"
      ],
      "answers": ["Jamais", "Rarement", "Parfois", "Souvent", "Toujours"]
    },
    {
      "questions": [
        "Depuis combien de temps ressentez-vous le besoin compulsif de travailler?"
      ],
      "answers": [
        "Moins de 6 mois",
        "6 mois à 1 an",
        "1 à 5 ans",
        "Plus de 5 ans"
      ]
    },
    {
      "questions": ["Avez-vous remarqué des conséquences négatives?"],
    },
    {
      "questions": ["Avez-vous déjà tenter des sevrages?"],
      "answers": [
        "Jamais",
        "fixer des périodes",
        "réduire les durées",
        "réduire les fréquences",
        "remplacer par des activités saines",
        "ne plus travailler seul",
        "ne plus travailler le soir",
      ]
    },
    {
      "questions": ["Quels sont tes objectifs?"],
      "answers": [
        "Arrêter de travailler compulsivement",
        "Réduire la consommation",
        "Changer de type de travail",
        "Changer de lieu de travail",
        "Changer de moment de travail",
      ]
    }
  ],
};
