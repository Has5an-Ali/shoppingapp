// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/utils/appconstant.dart';

class SigninController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserCredential?> SigninMethod(
      String Useremail, String Userpassword) async {
    try {
      EasyLoading.show(status: "Please Wait...");
      UserCredential? userCredential = await _auth.signInWithEmailAndPassword(
          email: Useremail, password: Userpassword);
      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appmaincolor,
          colorText: AppConstant.textcolor);
    }
  }
}
