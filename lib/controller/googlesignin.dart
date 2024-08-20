// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_print, unnecessary_null_comparison, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoppingapp/Presentation/screens/user-panel/Main-screen.dart';
import 'package:shoppingapp/model/usermodel.dart';

class GoogleSiginController extends GetxController {
  final GoogleSignIn googlesignin = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> Signinwithgoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googlesignin.signIn();

      if (googleSignInAccount != null) {
        EasyLoading.show(status: "Please Wait.....");
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        final User? user = userCredential.user;

        if (User != null) {
          UserModel userModel = UserModel(
              uId: user!.uid,
              username: user.displayName.toString(),
              email: user.email.toString(),
              phone: user.phoneNumber.toString(),
              userImg: user.photoURL.toString(),
              userDeviceToken: '',
              country: '',
              userAddress: '',
              street: '',
              isAdmin: false,
              isActive: true,
              createdOn: DateTime.now(),
              city: '');

          FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set(userModel.toMap());
          EasyLoading.dismiss();
          Get.offAll(() => Mainscreen());
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("Error $e");
    }
  }
}
