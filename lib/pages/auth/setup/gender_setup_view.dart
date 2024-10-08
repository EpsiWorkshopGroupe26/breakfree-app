import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/utils/enums/gender_enum.dart';
import 'package:breakfree/widgets/spacing.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter/material.dart';

class GenderSetupView extends StatelessWidget {
  final Function(Gender) onSelectedGenderChanged;

  const GenderSetupView({
    super.key,
    required this.onSelectedGenderChanged,
  });

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
                'Quel est ton genre ?',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Spacing.large(),
              GroupButton(
                isRadio: true,
                buttons: Gender.values.map((e) => e.name).toList(),
                onSelected: (label, index, isSelected) {
                  onSelectedGenderChanged(Gender.values[index]);
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
                      value == Gender.Female.name
                          ? 'Femme'
                          : value == Gender.Male.name
                              ? 'Homme'
                              : 'Autre',
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
