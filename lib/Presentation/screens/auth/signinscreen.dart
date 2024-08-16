// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppingapp/Presentation/customwidget/Button.dart';
import 'package:shoppingapp/utils/appconstant.dart';

import '../../customwidget/Textfields.dart';

class Signinscreen extends StatelessWidget {
  const Signinscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign In ',
            style: TextStyle(color: AppConstant.textcolor),
          ),
          elevation: 30,
          centerTitle: true,
          backgroundColor: AppConstant.appmaincolor,
        ),
        body: Column(
          children: [
            isKeyboardVisible
                ? Text("Welcome Back ")
                : Container(
                    height: Get.height / 3,
                    width: Get.width / 1,
                    color: AppConstant.appmaincolor,
                    child: Lottie.asset('assets/images/splashicon.json'),
                  ),
            SizedBox(
              height: 30,
            ),
            customtextfield(
              text: 'Check',
            ),
            SizedBox(
              height: 20,
            ),
            customtextfield(
              text: 'Password',
            ),
            SizedBox(
              height: 25,
            ),
            Button(text: "Sign In ", onPressed: () {}),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have account"),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Click Here",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
