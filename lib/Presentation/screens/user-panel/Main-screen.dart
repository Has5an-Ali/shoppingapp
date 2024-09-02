// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/Presentation/screens/auth/Welcomescreen.dart';
import 'package:shoppingapp/utils/appconstant.dart';
import 'package:shoppingapp/widget/Custom-drawer-widget.dart';

import '../../../widget/BannerWidget.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.textcolor),
        title: Text(
          "Sopping App",
          style: TextStyle(color: AppConstant.textcolor),
        ),
        backgroundColor: AppConstant.appmaincolor,
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          Bannerwidget(),
        ],
      ),
    );
  }
}
