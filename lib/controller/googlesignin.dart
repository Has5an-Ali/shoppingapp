// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_print, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigin extends GetxController {
  final GoogleSignIn googlesignin = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> Signinwithgoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googlesignin.signIn();

      // if (googleSignInAccount != null) {
      //   final GoogleSignInAuthentication googleSignInAuthentication =
      //       await googleSignInAccount.authentication;

      //   final AuthCredential credential = GoogleAuthProvider.credential(
      //     idToken: googleSignInAuthentication.idToken,
      //     accessToken: googleSignInAuthentication.accessToken,
      //   );

      //   final UserCredential userCredential =
      //       await _auth.signInWithCredential(credential);
      // }
    } catch (e) {
      print("Error $e");
    }
  }
}
