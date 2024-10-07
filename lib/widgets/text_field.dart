import 'package:breakfree/configs/themes/app_theme.dart';
import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BreakfreeTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? title;
  final String? Function(String?)? validator;
  late bool obscureText;
  final IconData? iconData;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final int maxLines;
  final int minLines;
  final bool autoFocus;
  final bool readOnly;
  final bool enabled;
  final bool showCursor;
  final bool showClearButton;
  final TextStyle? textStyle;
  final bool autocorrect;
  final bool showPassword;
  final EdgeInsets scrollPadding;
  final int maxLength;
  final TextCapitalization textCapitalization;
  final Function? onChanged;
  final Function? onClear;
  final Function? onTap;
  final bool isOutline;
  final String? hintText;
  final String? innitialValue;
  final bool? outLabel;
  final Future<String?> Function(String)? asyncValidator;

  BreakfreeTextField({
    super.key,
    this.controller,
    this.title,
    this.validator,
    this.obscureText = false,
    this.iconData,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.maxLines = 1,
    this.minLines = 1,
    this.autoFocus = false,
    this.readOnly = false,
    this.enabled = true,
    this.showCursor = true,
    this.showClearButton = false,
    this.autocorrect = true,
    this.showPassword = false,
    this.scrollPadding = const EdgeInsets.all(20),
    this.maxLength = 0,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.isOutline = true,
    this.onClear,
    this.textStyle,
    this.onTap,
    this.hintText,
    this.innitialValue,
    this.outLabel,
    this.asyncValidator,
  });

  @override
  State<BreakfreeTextField> createState() => BreakfreemTextFieldState();
}

class BreakfreemTextFieldState extends State<BreakfreeTextField> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  void togglePassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  bool loading = false;
  String? error;

  @override
  Widget build(BuildContext context) {
    if (widget.controller?.text == '' && widget.innitialValue != null) {
      widget.controller?.text = widget.innitialValue!;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.outLabel == true)
          Text(
            widget.title!,
            style: context.textTheme.bodyLarge!.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        isAndroid
            ? TextFormField(
                onTap: widget.onTap != null ? () => widget.onTap!() : null,
                cursorWidth: 1,
                autofocus: widget.autoFocus,
                controller: widget.controller,
                keyboardType: widget.textInputType,
                keyboardAppearance: context.theme.brightness,
                maxLines: widget.maxLines,
                maxLength: widget.maxLength == 0 ? null : widget.maxLength,
                minLines: widget.minLines,
                textInputAction: widget.textInputAction,
                textCapitalization: widget.textCapitalization,
                autovalidateMode: widget.asyncValidator != null
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                onChanged: ((value) async {
                  setState(() {
                    loading = true;
                  });
                  if (widget.asyncValidator != null) {
                    error = await widget.asyncValidator!(value);
                  }
                  if (widget.onChanged != null) {
                    widget.onChanged!(value);
                  }
                  setState(() {
                    loading = false;
                  });
                }),
                obscureText: obscureText,
                readOnly: widget.readOnly,
                enabled: widget.enabled,
                showCursor: widget.showCursor,
                autocorrect: widget.autocorrect,
                validator: ((value) {
                  if (widget.validator != null) {
                    error = widget.validator!(value);
                  }
                  return error;
                }),
                style: widget.textStyle ??
                    (widget.enabled == true
                        ? context.textTheme.bodyLarge
                        : context.textTheme.bodyLarge!.copyWith(
                            color: context.colorScheme.onSurface
                                .withOpacity(0.5))),
                scrollPadding: widget.scrollPadding,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: widget.isOutline
                      ? context.colorScheme.surface
                      : context.colorScheme.surfaceContainer,
                  hintText: widget.hintText,
                  labelText: widget.outLabel == true ? null : widget.title,
                  alignLabelWithHint: true,
                  enabled: widget.enabled,
                  labelStyle: widget.enabled == true
                      ? TextStyle(
                          color: context.colorScheme.onSurface,
                        )
                      : TextStyle(
                          color: context.colorScheme.onSurface.withOpacity(0.5),
                        ),
                  errorMaxLines: 4,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: widget.isOutline ? 0 : AppTheme.paddingMedium,
                    vertical: AppTheme.paddingSmall,
                  ),
                  prefixIcon: widget.iconData != null
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Icon(
                            widget.iconData,
                            size: 30,
                            color: context.colorScheme.primary,
                          ),
                        )
                      : null,
                  suffixIcon: loading
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            context.colorScheme.primary,
                          ),
                        )
                      : (widget.showClearButton && widget.controller != null)
                          ? IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: context.colorScheme.primary,
                              ),
                              onPressed: () {
                                widget.controller!.clear();
                                widget.onClear != null
                                    ? widget.onClear!('')
                                    : null;
                              },
                            )
                          : (widget.showPassword)
                              ? IconButton(
                                  icon: Icon(
                                    obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: context.colorScheme.primary,
                                  ),
                                  onPressed: () {
                                    togglePassword();
                                  },
                                )
                              : null,
                  enabledBorder: !widget.isOutline
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                            color: context.colorScheme.surfaceContainer,
                            width: 2,
                          ),
                          borderRadius:
                              BorderRadius.circular(AppTheme.radiusSmall),
                        )
                      : UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: context.colorScheme.surfaceContainer,
                            width: 2,
                          ),
                        ),
                  disabledBorder: !widget.isOutline
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                            color: context.colorScheme.outline,
                            width: 2,
                          ),
                          borderRadius:
                              BorderRadius.circular(AppTheme.radiusSmall),
                        )
                      : null,
                  focusedBorder: !widget.isOutline
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                            color: context.colorScheme.primary,
                            width: 1,
                          ),
                          borderRadius:
                              BorderRadius.circular(AppTheme.radiusSmall),
                        )
                      : null,
                  errorBorder: !widget.isOutline
                      ? OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius:
                              BorderRadius.circular(AppTheme.radiusSmall),
                        )
                      : null,
                  focusedErrorBorder: !widget.isOutline
                      ? OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius:
                              BorderRadius.circular(AppTheme.radiusSmall),
                        )
                      : null,
                ),
              )
            : CupertinoTextField(
                onTap: widget.onTap != null ? () => widget.onTap!() : null,
                cursorWidth: 1,
                autofocus: widget.autoFocus,
                controller: widget.controller,
                keyboardType: widget.textInputType,
                keyboardAppearance: context.theme.brightness,
                maxLines: widget.maxLines,
                maxLength: widget.maxLength == 0 ? null : widget.maxLength,
                minLines: widget.minLines,
                textInputAction: widget.textInputAction,
                textCapitalization: widget.textCapitalization,
                onChanged: widget.onChanged != null
                    ? (v) => widget.onChanged!(v)
                    : null,
                obscureText: widget.obscureText,
                readOnly: widget.readOnly,
                enabled: widget.enabled,
                showCursor: widget.showCursor,
                autocorrect: widget.autocorrect,
                style: widget.textStyle ??
                    (widget.enabled == true
                        ? context.textTheme.bodyLarge
                        : context.textTheme.bodyLarge!.copyWith(
                            color: context.colorScheme.onSurface
                                .withOpacity(0.5))),
                scrollPadding: widget.scrollPadding,
                decoration: BoxDecoration(
                  color: widget.isOutline
                      ? context.colorScheme.surface
                      : context.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                  border: !widget.isOutline
                      ? Border.all(
                          color: context.colorScheme.surfaceContainer,
                        )
                      : null,
                ),
                prefix: widget.iconData != null
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Icon(
                          widget.iconData,
                          size: 30,
                          color: context.colorScheme.primary,
                        ),
                      )
                    : null,
                suffix: widget.showClearButton && widget.controller != null
                    ? IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: context.colorScheme.primary,
                        ),
                        onPressed: () {
                          widget.controller!.clear();
                          widget.onClear != null ? widget.onClear!('') : null;
                        },
                      )
                    : widget.showPassword
                        ? IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: context.colorScheme.primary,
                            ),
                            onPressed: () {
                              togglePassword();
                            },
                          )
                        : null,
              ),
      ],
    );
  }
}
