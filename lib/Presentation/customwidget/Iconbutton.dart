// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/utils/appconstant.dart';

class Iconbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String path;
  const Iconbutton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 260,
      child: TextButton.icon(
          style: TextButton.styleFrom(
              backgroundColor: AppConstant.appmaincolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
          icon: Image.asset(
            path,
            height: Get.height / 12,
            width: Get.width / 12,
          ),
          onPressed: onPressed,
          label: Text(
            text,
            style: const TextStyle(color: AppConstant.textcolor),
          )),
    );
  }
}
