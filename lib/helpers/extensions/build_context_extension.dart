import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;
  NavigatorState get navigator => Navigator.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  ScaffoldState get scaffold => Scaffold.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  ThemeData get adaptiveTheme => Theme.of(this);
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;
  bool get isMaterial => Theme.of(this).platform == TargetPlatform.android;
  bool get isCupertino => Theme.of(this).platform == TargetPlatform.iOS;
}
