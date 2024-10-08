import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/widgets/spacing.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter/material.dart';

class DepressionSetupView extends StatelessWidget {
  final Function(bool) onSymptomesDepressionChanged;

  const DepressionSetupView({
    super.key,
    required this.onSymptomesDepressionChanged,
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
                'As-tu des symptômes de dépression ?',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Spacing.large(),
              GroupButton(
                isRadio: true,
                buttons: ['Oui', 'Non'],
                onSelected: (label, index, isSelected) {
                  onSymptomesDepressionChanged(index == 0);
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
                      value,
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
