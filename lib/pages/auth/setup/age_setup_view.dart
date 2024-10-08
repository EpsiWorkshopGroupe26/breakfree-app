import 'package:breakfree/widgets/spacing.dart';
import 'package:selector_wheel/selector_wheel.dart';
import 'package:flutter/material.dart';

class AgeSetupView extends StatelessWidget {
  final GlobalKey<FormState> ageFormKey;
  final TextEditingController ageController;

  const AgeSetupView({
    super.key,
    required this.ageFormKey,
    required this.ageController,
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
                'Quelle age as-tu ?',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Spacing.large(),
              Form(
                key: ageFormKey,
                child: SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectorWheel(
                        childCount: 100,
                        convertIndexToValue: (int index) {
                          return SelectorWheelValue(
                            label: (index + 1).toString(),
                            value: index + 1,
                            index: index + 1,
                          );
                        },
                        onValueChanged: (SelectorWheelValue<int> value) {
                          ageController.text = value.label;
                        },
                      ),
                      const Spacing.medium(),
                      Text(
                        'ans',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
