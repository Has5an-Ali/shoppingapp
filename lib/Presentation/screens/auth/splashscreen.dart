// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppingapp/Presentation/screens/user-panel/Main-screen.dart';
import 'package:shoppingapp/utils/appconstant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../controller/Getuserdata.dart';
import '../admin_panel/AdminMainScreen.dart';
import 'Welcomescreen.dart';
import 'signinscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 6),
      () {
        Checklogin(context);
      },
    );
  }

  Future<void> Checklogin(BuildContext context) async {
    if (user != null) {
      final GetUserDataController getUserDataController =
          Get.put(GetUserDataController());
      var UserData = await getUserDataController.GetdataMethod(user!.uid);
      if (UserData[0]['isAdmin'] == true) {
        Get.offAll(() => Adminscreen());
      } else {
        Get.offAll(() => Mainscreen());
      }
    } else {
      Get.offAll(() => Welcomescreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appmaincolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/splashicon.json'),
          ],
        ),
      ),
    );
  }
}
