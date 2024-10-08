import 'package:breakfree/widgets/spacing.dart';
import 'package:selector_wheel/selector_wheel.dart';
import 'package:flutter/material.dart';

class StressLevelSetupView extends StatelessWidget {
  final Function(int) onStressLevelChanged;

  const StressLevelSetupView({
    super.key,
    required this.onStressLevelChanged,
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
                "Quel est ton niveau de stress actuel ?",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Spacing.large(),
              SizedBox(
                height: 400,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectorWheel(
                      childCount: 10,
                      convertIndexToValue: (int index) {
                        return SelectorWheelValue(
                          label: (index + 1).toString(),
                          value: index + 1,
                          index: index + 1,
                        );
                      },
                      onValueChanged: (SelectorWheelValue<int> value) {
                        onStressLevelChanged(value.value);
                      },
                    ),
                    const Spacing.medium(),
                    Text(
                      'sur 10',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
