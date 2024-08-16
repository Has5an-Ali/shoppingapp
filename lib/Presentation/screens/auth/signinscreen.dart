// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppingapp/utils/appconstant.dart';

import '../../customwidget/Textfields.dart';

class Signinscreen extends StatelessWidget {
  const Signinscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sign In '),
          elevation: 30,
          centerTitle: true,
          backgroundColor: AppConstant.appmaincolor,
        ),
        body: Column(
          children: [
            Container(
              color: AppConstant.appmaincolor,
              child: Lottie.asset('assets/images/splashicon.json'),
            ),
            customtextfield(
              text: 'Check',
            ),
          ],
        ),
      );
    });
  }
}
