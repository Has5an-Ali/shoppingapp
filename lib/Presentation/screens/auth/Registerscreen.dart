// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppingapp/Presentation/customwidget/Button.dart';
import 'package:shoppingapp/utils/appconstant.dart';

import '../../customwidget/Textfields.dart';
import 'signinscreen.dart';

class Registerscreen extends StatelessWidget {
  const Registerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Up  ',
            style: TextStyle(color: AppConstant.textcolor),
          ),
          elevation: 30,
          centerTitle: true,
          backgroundColor: AppConstant.appmaincolor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              customtextfield(
                text: '  Full Name ',
                Obscuretext: false,
                Prefixicon: Icon(Icons.person),
                type: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              customtextfield(
                text: '  Email  ',
                Obscuretext: false,
                Prefixicon: Icon(Icons.email),
                type: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              customtextfield(
                text: '   Phone  ',
                Prefixicon: Icon(Icons.phone),
                Obscuretext: true,
                type: TextInputType.phone,
              ),
              SizedBox(
                height: 20,
              ),
              customtextfield(
                text: '    Password  ',
                Prefixicon: Icon(Icons.password),
                Obscuretext: true,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 25,
              ),
              Button(text: "Sign Up ", onPressed: () {}),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Account "),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => Signinscreen());
                    },
                    child: Text(
                      "Click Here",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
