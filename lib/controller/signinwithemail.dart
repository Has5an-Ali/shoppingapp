// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/utils/appconstant.dart';

class Signinwithemail extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserCredential?> SigninMethod(
    String Useremail,
    String Username,
    String Usercity,
    String Userpassword,
  ) async {
    try {} on FirebaseAuthException catch (e) {
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appmaincolor,
          colorText: Colors.white);
    }
  }
}
