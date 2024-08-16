// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/utils/appconstant.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.height / 17,
        width: Get.width / 1.3,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppConstant.appmaincolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            onPressed: onPressed,
            child: Text(
              text,
              style:
                  const TextStyle(color: AppConstant.textcolor, fontSize: 15),
            )));
  }
}
