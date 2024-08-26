// ignore_for_file: file_names, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:shoppingapp/utils/appconstant.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class GetDeviceTokenController extends GetxController {
  String? DeviceToken;

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    GetDeviceTokenMethod();
  }

  Future<void> GetDeviceTokenMethod() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();

      if (token != null) {
        DeviceToken = token;
        update();
      }
    } catch (e) {
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appmaincolor,
          colorText: AppConstant.textcolor);
    }
  }
}
