// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unused_local_variable, non_constant_identifier_names, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppingapp/Presentation/customwidget/Button.dart';
import 'package:shoppingapp/utils/appconstant.dart';

import '../../../controller/signwithemail.dart';
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
        iconTheme: IconThemeData(color: AppConstant.textcolor),
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
              Controller: Useremail,
              type: null,
            ),
            SizedBox(
              height: 20,
            ),
            customtextfield(
              text: '   Phone  ',
              Prefixicon: Icon(Icons.phone),
              Obscuretext: false,
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

                // Validation checks
                if (name.isEmpty ||
                    email.isEmpty ||
                    phone.isEmpty ||
                    password.isEmpty) {
                  Get.snackbar("Error", "Please fill all details",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppConstant.appmaincolor,
                      colorText: Colors.white);
                } else if (!GetUtils.isEmail(email)) {
                  Get.snackbar("Error", "Please enter a valid email address",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppConstant.appmaincolor,
                      colorText: Colors.white);
                } else {
                  try {
                    UserCredential? userCredential =
                        await signinwithemail.SignupMethod(
                            email, name, phone, password, userDeviceToken);

                    if (userCredential != null) {
                      Get.snackbar(
                          "Email Verification", "Please check your email",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appmaincolor,
                          colorText: Colors.white);

                      FirebaseAuth.instance.signOut();

                      Get.offAll(() => Signinscreen());
                    }
                  } catch (e) {
                    Get.snackbar("Sign Up Failed", e.toString(),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appmaincolor,
                        colorText: Colors.white);
                  }
                }
              },
            ),
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
