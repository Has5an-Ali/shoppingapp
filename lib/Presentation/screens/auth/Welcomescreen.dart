// ignore_for_file: file_names, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppingapp/Presentation/screens/auth/signinscreen.dart';
import 'package:shoppingapp/utils/appconstant.dart';

import '../../../controller/googlesignin.dart';
import '../../customwidget/Iconbutton.dart';

class Welcomescreen extends StatelessWidget {
  Welcomescreen({super.key});

  final GoogleSiginController _googleSiginController =
      Get.put(GoogleSiginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppConstant.appmaincolor,
            height: 400,
            child: Lottie.asset('assets/images/splashicon.json'),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Shopping Mart",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Get.height / 8,
          ),
          Iconbutton(
            text: "Sign in  with Google",
            onPressed: () {
              _googleSiginController.Signinwithgoogle();
            },
            path: 'assets/images/icon.png',
          ),
          SizedBox(
            height: 25,
          ),
          Iconbutton(
              text: 'Sign in  with Email ',
              onPressed: () {
                Get.to(() => Signinscreen());
              },
              path: 'assets/images/mail.png'),
        ],
      ),
    );
  }
}
