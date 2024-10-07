import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/utils/enums/button_enum.dart';
import 'package:flutter/material.dart';

class BreakfreeIconButton extends StatelessWidget {
  const BreakfreeIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.buttonState = BreakfreeButtonState.primary,
    this.buttonConfig = BreakfreeButtonConfig.filled,
  });

  /// The icon to display inside the button.
  final IconData icon;

  /// The function to call when the button is pressed.
  final VoidCallback? onPressed;

  /// The tooltip for the button.
  final String? tooltip;

  /// The state of the button. Defaults to [BreakfreeButtonState.primary]
  final BreakfreeButtonState buttonState;

  /// The configuration of the button. Defaults to [BreakfreeButtonConfig.filled]
  final BreakfreeButtonConfig buttonConfig;

  @override
  Widget build(BuildContext context) {
    Color? color;
    switch (buttonState) {
      case BreakfreeButtonState.primary:
        color = context.colorScheme.primary;
        break;
      case BreakfreeButtonState.secondary:
        color = context.colorScheme.secondary;
        break;
      case BreakfreeButtonState.disabled:
        color = context.colorScheme.onSurface.withOpacity(0.38);
        break;
    }
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      tooltip: tooltip,
      color: color,
    );
  }
}
