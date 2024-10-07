import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BreakfreeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget> actions;
  final bool centerTitle;
  final double elevation;
  final bool showBackButton;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final bool? isTransparent;
  final Widget? customWidget;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  @override
  final Size preferredSize;

  BreakfreeAppBar({
    super.key,
    this.title,
    this.customWidget,
    this.actions = const [],
    this.leading,
    this.centerTitle = false,
    this.elevation = 0,
    this.showBackButton = true,
    this.backgroundColor,
    this.textColor,
    this.height = kToolbarHeight,
    this.isTransparent,
    this.bottom,
    this.toolbarHeight,
  }) : preferredSize =
            _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return isIOS
        ? CupertinoNavigationBar(
            middle: title != null
                ? Text(
                    title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: textColor ?? context.colorScheme.onSurface,
                    ),
                  )
                : customWidget,
            backgroundColor: backgroundColor ?? context.colorScheme.surface,
            leading: showBackButton
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: textColor ?? context.colorScheme.onSurface,
                    ),
                    onPressed: () => Navigator.pop(context),
                  )
                : leading,
            trailing: Row(
              children: [...actions],
            ),
          )
        : AppBar(
            toolbarHeight: height,
            elevation: elevation,
            shadowColor: Colors.black26,
            backgroundColor: backgroundColor ??
                (isTransparent == true
                    ? Colors.transparent
                    : context.colorScheme.surface),
            leading: showBackButton
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: textColor ?? context.colorScheme.onSurface,
                    ),
                    onPressed: () => Navigator.pop(context),
                  )
                : leading,
            title: title != null
                ? Text(
                    title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: textColor ?? context.colorScheme.onSurface,
                    ),
                  )
                : customWidget,
            centerTitle: centerTitle,
            actions: actions,
            scrolledUnderElevation: 0,
            bottom: bottom,
          );
  }
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
