import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/utils/enums/button_enum.dart';
import 'package:flutter/material.dart';

class BreakfreeButton extends StatefulWidget {
  const BreakfreeButton({
    super.key,
    required this.label,
    this.onPressed,
    this.buttonState = BreakfreeButtonState.primary,
    this.buttonSize = BreakfreeButtonSize.large,
    this.buttonConfig = BreakfreeButtonConfig.filled,
    this.leftIcon,
    this.rightIcon,
  });

  /// The text to display inside the button.
  final String label;

  /// The function to call when the button is pressed. This is an async function
  final Future<void> Function()? onPressed;

  /// The state of the button. Defaults to [BreakfreeButtonState.primary]
  final BreakfreeButtonState buttonState;

  /// The size of the button. Defaults to [BreakfreeButtonSize.large]
  final BreakfreeButtonSize buttonSize;

  /// The configuration of the button. Defaults to [BreakfreeButtonConfig.filled]
  final BreakfreeButtonConfig buttonConfig;

  /// The icon to display on the left side of the button
  final IconData? leftIcon;

  /// The icon to display on the right side of the button
  final IconData? rightIcon;

  @override
  _BreakfreeBreakfreeButtonState createState() =>
      _BreakfreeBreakfreeButtonState();
}

class _BreakfreeBreakfreeButtonState extends State<BreakfreeButton> {
  bool _isLoading = false;

  Future<void> _handlePress() async {
    if (widget.onPressed != null) {
      setState(() {
        _isLoading = true;
      });
      await widget.onPressed!();
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    double paddingHorizontal;
    Border? border;

    switch (widget.buttonState) {
      case BreakfreeButtonState.primary:
        backgroundColor = context.colorScheme.primary;
        textColor = context.colorScheme.onPrimary;
        break;
      case BreakfreeButtonState.secondary:
        backgroundColor = context.colorScheme.secondary;
        textColor = context.colorScheme.onSecondary;
        break;
      case BreakfreeButtonState.disabled:
        backgroundColor = context.colorScheme.surfaceContainer;
        textColor = context.colorScheme.onSurface;
        break;
    }

    switch (widget.buttonConfig) {
      case BreakfreeButtonConfig.filled:
        backgroundColor = backgroundColor;
        textColor = textColor;
        break;
      case BreakfreeButtonConfig.outlined:
        backgroundColor = Colors.transparent;
        textColor = textColor;
        border = Border.all(
          color: context.colorScheme.outline,
          width: 1,
        );
        break;
      case BreakfreeButtonConfig.text:
        backgroundColor = Colors.transparent;
        switch (widget.buttonState) {
          case BreakfreeButtonState.primary:
            textColor = context.colorScheme.primary;
            break;
          case BreakfreeButtonState.secondary:
            textColor = context.colorScheme.secondary;
            break;
          case BreakfreeButtonState.disabled:
            textColor = context.colorScheme.outline;
            break;
        }
        break;
      case BreakfreeButtonConfig.elevated:
        backgroundColor = context.colorScheme.surfaceContainer;
        textColor = textColor;
        break;
    }

    if (widget.buttonSize == BreakfreeButtonSize.small) {
      paddingHorizontal = 24;
    } else {
      paddingHorizontal = 30;
    }

    double height = widget.buttonSize == BreakfreeButtonSize.small ? 40 : 64;
    bool isLarge = widget.buttonSize == BreakfreeButtonSize.large;

    Widget buttonLargeContent = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          widget.leftIcon,
          color: widget.leftIcon != null ? textColor : Colors.transparent,
        ),
        if (_isLoading)
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: textColor,
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          ),
        if (!_isLoading)
          Expanded(
            child: Text(
              widget.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        Icon(
          widget.rightIcon,
          color: widget.rightIcon != null ? textColor : Colors.transparent,
        ),
      ],
    );

    Widget buttonSmallContent = Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        if (widget.leftIcon != null) ...[
          Icon(
            widget.leftIcon,
            color: textColor,
          ),
          const SizedBox(width: 8),
        ],
        if (_isLoading)
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: textColor,
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          ),
        if (!_isLoading)
          Text(
            widget.label,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        if (!_isLoading) const SizedBox(width: 8),
        if (widget.rightIcon != null)
          Icon(
            widget.rightIcon,
            color: textColor,
          ),
      ],
    );

    return GestureDetector(
      onTap: widget.buttonState == BreakfreeButtonState.disabled || _isLoading
          ? null
          : _handlePress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isLarge ? double.infinity : null,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(32),
          border: border,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
        ),
        child: isLarge ? buttonLargeContent : buttonSmallContent,
      ),
    );
  }
}
