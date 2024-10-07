import 'dart:io';

import 'package:flutter/foundation.dart';

DateTime get getCurrentTimestamp => DateTime.now();

bool get isAndroid => !kIsWeb && Platform.isAndroid;
// bool get isAndroid => false;
bool get isIOS => !kIsWeb && Platform.isIOS;
// bool get isIOS => true;
bool get isWeb => kIsWeb;
