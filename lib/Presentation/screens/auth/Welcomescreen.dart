// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppingapp/utils/appconstant.dart';

import '../../customwidget/Iconbutton.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

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
            onPressed: () {},
            path: 'assets/images/icon.png',
          ),
          SizedBox(
            height: 25,
          ),
          Iconbutton(
              text: 'Sign in  with Email ',
              onPressed: () {},
              path: 'assets/images/mail.png'),
        ],
      ),
    );
  }
}
