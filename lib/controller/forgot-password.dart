// ignore_for_file: file_names, non_constant_identifier_names, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/utils/appconstant.dart';

class ForgotpasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> ForgotPasswordMethod(String Useremail) async {
    try {
      EasyLoading.show(status: "Please Wait...");

      _auth.sendPasswordResetEmail(email: Useremail);
      Get.snackbar("Send Sucessfully ", "Password Rest Link send to $Useremail",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appmaincolor,
          colorText: AppConstant.textcolor);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", "There are error in this $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appmaincolor,
          colorText: AppConstant.textcolor);
    }
  }
}
