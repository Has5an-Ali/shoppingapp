// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, unused_local_variable

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:shoppingapp/Presentation/customwidget/Button.dart';
// import 'package:shoppingapp/Presentation/screens/user-panel/Main-screen.dart';
// import 'package:shoppingapp/controller/sign-in-controller.dart';
// import 'package:shoppingapp/utils/appconstant.dart';

// import '../../../controller/Getuserdata.dart';
// import '../../customwidget/Textfields.dart';
// import '../admin_panel/Adminscreen.dart';
// import 'Registerscreen.dart';
// import 'forgotpasswordscreen.dart';

// class Signinscreen extends StatelessWidget {
//   Signinscreen({super.key});
//   final SigninController signinController = Get.put(SigninController());
//   final GetUserDataController getUserDataController =
//       Get.put(GetUserDataController());
//   TextEditingController Useremail = TextEditingController();
//   TextEditingController Userpassword = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Sign In ',
//             style: TextStyle(color: AppConstant.textcolor),
//           ),
//           elevation: 30,
//           centerTitle: true,
//           backgroundColor: AppConstant.appmaincolor,
//         ),
//         body: Column(
//           children: [
//             isKeyboardVisible
//                 ? Text("Welcome Back ")
//                 : Container(
//                     height: Get.height / 3,
//                     width: Get.width / 1,
//                     color: AppConstant.appmaincolor,
//                     child: Lottie.asset('assets/images/splashicon.json'),
//                   ),
//             SizedBox(
//               height: 30,
//             ),
//             customtextfield(
//               text: '  Email',
//               Prefixicon: Icon(Icons.email),
//               Obscuretext: false,
//               type: TextInputType.emailAddress,
//               Controller: Useremail,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             customtextfield(
//               text: '   Password',
//               Prefixicon: Icon(Icons.password),
//               Obscuretext: true,
//               type: TextInputType.text,
//               Controller: Userpassword,
//             ),
//             Align(
//                 alignment: Alignment(0.9, 0),
//                 child: InkWell(
//                   onTap: () {
//                     Get.to(() => ForgetPassword());
//                   },
//                   child: Text(
//                     "Forgot Password",
//                     style: TextStyle(
//                         color: AppConstant.appmaincolor,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 )),
//             SizedBox(
//               height: 25,
//             ),
//             Button(
//                 text: "Sign In ",
//                 onPressed: () async {
//                   String email = Useremail.text.trim();
//                   String password = Userpassword.text.trim();

//                   if (email.isEmpty || password.isEmpty) {
//                     Get.snackbar("Error", "Please Fill all the Details",
//                         snackPosition: SnackPosition.BOTTOM,
//                         backgroundColor: AppConstant.appmaincolor,
//                         colorText: Colors.white);
//                   } else if (!GetUtils.isEmail(email)) {
//                     Get.snackbar("Error", "Invalid email address",
//                         snackPosition: SnackPosition.BOTTOM,
//                         backgroundColor: AppConstant.appmaincolor,
//                         colorText: Colors.white);
//                   } else {
//                     UserCredential? userCredential =
//                         await signinController.SigninMethod(email, password);

//                     var userData = getUserDataController.GetdataMethod(
//                         userCredential!.user!.uid);

//                     if (userCredential != null) {
//                       if (userCredential.user!.emailVerified) {
//                         if (userData[0]['isAdmin'] == true) {
//                           Get.snackbar("Admin Success", "Login Successfully!",
//                             snackPosition: SnackPosition.BOTTOM,
//                             backgroundColor: AppConstant.appmaincolor,
//                             colorText: Colors.white);
//                           Get.off(() => Adminscreen());
//                         } else {
//                           Get.offAll(Mainscreen());
//                         }

//                         Get.snackbar("Success", "Login Successfully!",
//                             snackPosition: SnackPosition.BOTTOM,
//                             backgroundColor: AppConstant.appmaincolor,
//                             colorText: Colors.white);
//                       } else {
//                         Get.snackbar("Error", "Please Verify Your Email",
//                             snackPosition: SnackPosition.BOTTOM,
//                             backgroundColor: AppConstant.appmaincolor,
//                             colorText: Colors.white);
//                       }
//                     }
//                   }
//                 }),
//             SizedBox(
//               height: 30,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Don't have account"),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     print("Navigating to Register screen");
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => Registerscreen()),
//                     );
//                   },
//                   child: Text(
//                     "Click Here",
//                     style: TextStyle(
//                         color: Colors.blue, fontWeight: FontWeight.bold),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       );
//     });
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, unused_local_variable, unrelated_type_equality_checks

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppingapp/Presentation/customwidget/Button.dart';
import 'package:shoppingapp/Presentation/screens/user-panel/Main-screen.dart';
import 'package:shoppingapp/controller/sign-in-controller.dart';
import 'package:shoppingapp/utils/appconstant.dart';

import '../../../controller/Getuserdata.dart';
import '../../customwidget/Textfields.dart';
import '../admin_panel/AdminMainScreen.dart';
import 'Registerscreen.dart';
import 'forgotpasswordscreen.dart';

class Signinscreen extends StatelessWidget {
  Signinscreen({super.key});
  final SigninController signinController = Get.put(SigninController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController Useremail = TextEditingController();
  TextEditingController Userpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppConstant.textcolor),
          title: Text(
            'Sign In',
            style: TextStyle(color: AppConstant.textcolor),
          ),
          elevation: 30,
          centerTitle: true,
          backgroundColor: AppConstant.appmaincolor,
        ),
        body: Column(
          children: [
            isKeyboardVisible
                ? Text("Welcome Back")
                : Container(
                    height: Get.height / 3,
                    width: Get.width / 1,
                    color: AppConstant.appmaincolor,
                    child: Lottie.asset('assets/images/splashicon.json'),
                  ),
            SizedBox(
              height: 30,
            ),
            customtextfield(
              text: '  Email',
              Prefixicon: Icon(Icons.email),
              Obscuretext: false,
              type: TextInputType.emailAddress,
              Controller: Useremail,
            ),
            SizedBox(
              height: 20,
            ),
            customtextfield(
              text: '   Password',
              Prefixicon: Icon(Icons.password),
              Obscuretext: true,
              type: TextInputType.text,
              Controller: Userpassword,
            ),
            Align(
                alignment: Alignment(0.9, 0),
                child: InkWell(
                  onTap: () {
                    Get.to(() => ForgetPassword());
                  },
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        color: AppConstant.appmaincolor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            SizedBox(
              height: 25,
            ),
            Button(
              text: "Sign In ",
              onPressed: () async {
                String email = Useremail.text.trim();
                String password = Userpassword.text.trim();

                if (email.isEmpty || password.isEmpty) {
                  Get.snackbar(
                    "Error",
                    "Please enter all details",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppConstant.appmaincolor,
                    colorText: AppConstant.textcolor,
                  );
                } else {
                  try {
                    UserCredential? userCredential =
                        await signinController.SigninMethod(email, password);

                    if (userCredential != null) {
                      // Fetch user data from Firebase
                      var userData = await getUserDataController.GetdataMethod(
                          userCredential.user!.uid);
                      print(
                          "Fetched User Data: $userData"); // Debug print to check the fetched data

                      if (userCredential.user!.emailVerified) {
                        if (userData != null &&
                            userData.isNotEmpty &&
                            userData[0]['isAdmin'] == true) {
                          Get.snackbar(
                            "Success Admin Login",
                            "Login Successfully!",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appmaincolor,
                            colorText: AppConstant.textcolor,
                          );
                          Get.offAll(() => Adminscreen());
                        } else {
                          Get.offAll(() => Mainscreen());
                          Get.snackbar(
                            "Success User Login",
                            "Login Successfully!",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appmaincolor,
                            colorText: AppConstant.textcolor,
                          );
                        }
                      } else {
                        Get.snackbar(
                          "Error",
                          "Please verify your email before login",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appmaincolor,
                          colorText: AppConstant.textcolor,
                        );
                      }
                    } else {
                      Get.snackbar(
                        "Error",
                        "Sign in failed, please try again",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appmaincolor,
                        colorText: AppConstant.textcolor,
                      );
                    }
                  } catch (e) {
                    Get.snackbar(
                      "Error",
                      "An unexpected error occurred: $e",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppConstant.appmaincolor,
                      colorText: AppConstant.textcolor,
                    );
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
                Text("Don't have an account?"),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Registerscreen()),
                    );
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
      );
    });
  }
}
