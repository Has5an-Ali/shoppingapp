// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppingapp/Presentation/customwidget/Button.dart';
import 'package:shoppingapp/utils/appconstant.dart';

import '../../../controller/forgot-password.dart';
import '../../customwidget/Textfields.dart';
import 'Registerscreen.dart';

class Signinscreen extends StatelessWidget {
  Signinscreen({super.key});
  final ForgotpasswordController forgotpasswordController =
      Get.put(ForgotpasswordController());
  TextEditingController Useremail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Forgot Password ',
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
              text: '  Email',
              Prefixicon: Icon(Icons.email),
              Obscuretext: false,
              type: TextInputType.emailAddress,
              Controller: Useremail,
            ),
            SizedBox(
              height: 20,
            ),
            Button(
                text: "Forget Password",
                onPressed: () async {
                  String email = Useremail.text.trim();

                  if (email.isEmpty) {
                    Get.snackbar("Error", "Please Fill all the Details",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appmaincolor,
                        colorText: Colors.white);
                  } else if (!GetUtils.isEmail(email)) {
                    Get.snackbar("Error", "Invalid email address",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appmaincolor,
                        colorText: Colors.white);
                  } else {
                    forgotpasswordController.ForgotPasswordMethod(email);
                  }
                }),
          ],
        ),
      );
    });
  }
}
