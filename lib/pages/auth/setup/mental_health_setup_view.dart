import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/utils/enums/emotional_status_enum.dart';
import 'package:breakfree/utils/enums/professional_status_enum.dart';
import 'package:breakfree/widgets/spacing.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter/material.dart';

class EmotionalStatusSetupView extends StatelessWidget {
  final Function(EmotionalStatusEnum) onEmotionalStatusChanged;

  const EmotionalStatusSetupView({
    super.key,
    required this.onEmotionalStatusChanged,
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
                'Comment te sens-tu ?',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Spacing.large(),
              GroupButton(
                isRadio: true,
                buttons: EmotionalStatusEnum.values.map((e) => e.name).toList(),
                onSelected: (label, index, isSelected) {
                  onEmotionalStatusChanged(EmotionalStatusEnum.values[index]);
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
                      value == EmotionalStatusEnum.HAPPY.name
                          ? 'Heureux'
                          : value == EmotionalStatusEnum.SAD.name
                              ? 'Triste'
                              : value == EmotionalStatusEnum.ANGRY.name
                                  ? 'En colère'
                                  : value == EmotionalStatusEnum.ANXIOUS.name
                                      ? 'Anxieux'
                                      : value ==
                                              EmotionalStatusEnum.FEARFUL.name
                                          ? 'Peur'
                                          : value ==
                                                  EmotionalStatusEnum
                                                      .STRESSED.name
                                              ? 'Stressé'
                                              : value ==
                                                      EmotionalStatusEnum
                                                          .LONELY.name
                                                  ? 'Seul'
                                                  : value ==
                                                          EmotionalStatusEnum
                                                              .ENERGETIC.name
                                                      ? 'Énergique'
                                                      : value ==
                                                              EmotionalStatusEnum
                                                                  .TIRED.name
                                                          ? 'Fatigué'
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
