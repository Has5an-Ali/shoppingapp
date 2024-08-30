import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/Presentation/screens/auth/Welcomescreen.dart';
import 'package:shoppingapp/utils/appconstant.dart';

class Adminscreen extends StatelessWidget {
  const Adminscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
        centerTitle: true,
        backgroundColor: AppConstant.appmaincolor,
        actions: [
          InkWell(
              onTap: () {
                Get.offAll(() => Welcomescreen());
              },
              child: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text("Admin Panel"),
      ),
    );
  }
}
