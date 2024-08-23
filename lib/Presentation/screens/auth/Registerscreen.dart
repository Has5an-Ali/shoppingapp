// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unused_local_variable, non_constant_identifier_names, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppingapp/Presentation/customwidget/Button.dart';
import 'package:shoppingapp/utils/appconstant.dart';

import '../../../controller/signinwithemail.dart';
import '../../customwidget/Textfields.dart';
import 'signinscreen.dart';

class Registerscreen extends StatelessWidget {
  Registerscreen({super.key});

  final Signinwithemail signinwithemail = Get.put(Signinwithemail());
  TextEditingController Username = TextEditingController();
  TextEditingController Useremail = TextEditingController();
  TextEditingController Userphone = TextEditingController();
  TextEditingController Userpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              Controller: Username,
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
              Controller: Useremail,
            ),
            SizedBox(
              height: 20,
            ),
            customtextfield(
              text: '   Phone  ',
              Prefixicon: Icon(Icons.phone),
              Obscuretext: true,
              type: TextInputType.phone,
              Controller: Userphone,
            ),
            SizedBox(
              height: 20,
            ),
            customtextfield(
              text: '    Password  ',
              Prefixicon: Icon(Icons.password),
              Obscuretext: true,
              type: TextInputType.text,
              Controller: Userpassword,
            ),
            SizedBox(
              height: 25,
            ),
            Button(
                text: "Sign Up ",
                onPressed: () async {
                  String name = Username.text.trim();
                  String email = Useremail.text.trim();
                  String phone = Userphone.text.trim();
                  String password = Userpassword.text.trim();
                  String userDeviceToken = '';

                  if (name.isEmpty ||
                      email.isEmpty ||
                      phone.isEmail ||
                      password.isEmpty) {
                    Get.snackbar("Erro", "Please Fill all Details",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appmaincolor,
                        colorText: Colors.white);
                  } else {
                    UserCredential? userCredential =
                        await signinwithemail.SigninMethod(
                            name, email, phone, password, userDeviceToken);
                  }
                  if (UserCredential != null) {}
                }),
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
  }
}
