// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/Presentation/screens/auth/Welcomescreen.dart';
import 'package:shoppingapp/utils/appconstant.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        backgroundColor: AppConstant.appmaincolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Wrap(
          runSpacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Shopping Mart",
                  style: TextStyle(color: AppConstant.textcolor),
                ),
                subtitle: Text(
                  "Version 1.4.1",
                  style: TextStyle(color: AppConstant.textcolor),
                ),
                leading: CircleAvatar(
                  backgroundColor: AppConstant.appseccolor,
                  radius: 22,
                  child: Text('S'),
                ),
              ),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              thickness: 1.2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Home",
                  style: TextStyle(color: AppConstant.textcolor),
                ),
                leading: Icon(
                  Icons.home,
                  color: AppConstant.textcolor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.textcolor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Product",
                  style: TextStyle(color: AppConstant.textcolor),
                ),
                leading: Icon(
                  Icons.production_quantity_limits_rounded,
                  color: AppConstant.textcolor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.textcolor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Order",
                  style: TextStyle(color: AppConstant.textcolor),
                ),
                leading: Icon(
                  Icons.shopping_bag_rounded,
                  color: AppConstant.textcolor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.textcolor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Contact",
                  style: TextStyle(color: AppConstant.textcolor),
                ),
                leading: Icon(
                  Icons.help,
                  color: AppConstant.textcolor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.textcolor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListTile(
                onTap: () {
                  Get.offAll(() => Welcomescreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "LogOut",
                  style: TextStyle(color: AppConstant.textcolor),
                ),
                leading: Icon(
                  Icons.logout,
                  color: AppConstant.textcolor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.textcolor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
