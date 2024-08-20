import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppingapp/utils/appconstant.dart';

import 'Welcomescreen.dart';
import 'signinscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 6),
      () {
        Get.off(() => Welcomescreen());
      },
    );
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
