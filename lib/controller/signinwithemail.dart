// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/model/usermodel.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shoppingapp/utils/appconstant.dart';

class Signinwithemail extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserCredential?> SignupMethod(
    String Useremail,
    String Username,
    String Userphone,
    String Userpassword,
    String userDeviceToken,
  ) async {
    try {
      EasyLoading.show(status: 'Please Wait..');
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: Useremail.trim(),
        password: Userpassword.trim(),
      );

      await userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
        uId: userCredential.user!.uid,
        username: Username.trim(),
        email: Useremail.trim(),
        phone: Userphone.trim(),
        userImg: '',
        userDeviceToken: userDeviceToken,
        country: '',
        userAddress: '',
        street: '',
        isAdmin: false,
        isActive: true,
        createdOn: DateTime.now(),
        city: '',
      );

      await firestore
          .collection('User')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());

      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "${e.message}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appmaincolor,
          colorText: Colors.white);
      return null;
    }
  }
}
