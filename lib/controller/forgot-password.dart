// ignore_for_file: file_names, non_constant_identifier_names, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/Presentation/screens/auth/signinscreen.dart';
import 'package:shoppingapp/utils/appconstant.dart';

class ForgotpasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> ForgotPasswordMethod(String Useremail) async {
    try {
      EasyLoading.show(status: "Please Wait...");

      await _auth.sendPasswordResetEmail(email: Useremail);
      Get.snackbar(
        "Sent Successfully",
        "Password reset link sent to $Useremail",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.appmaincolor,
        colorText: AppConstant.textcolor,
      );
      Get.to(() => Signinscreen());
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "User Not Found",
          "No user found for this email address.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appmaincolor,
          colorText: AppConstant.textcolor,
        );
      } else {
        Get.snackbar(
          "Error",
          "There was an error: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appmaincolor,
          colorText: AppConstant.textcolor,
        );
      }
    }
  }
}
