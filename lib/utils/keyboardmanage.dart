// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class Keyboardmanage {
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentfocus = FocusScope.of(context);
    if (currentfocus.previousFocus()) {
      currentfocus.unfocus();
    }
  }
}
