// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/utils/appconstant.dart';

class BannerController extends GetxController {
  RxList<String> BannerUrl = RxList([]);

  @override
  void onInit() {
    super.onInit();
    FetchBannerdata();
  }

  Future<void> FetchBannerdata() async {
    try {
      QuerySnapshot bannerSnapshot =
          await FirebaseFirestore.instance.collection('Banner').get();

      if (bannerSnapshot.docs.isNotEmpty) {
        BannerUrl.value = bannerSnapshot.docs
            .map((docs) => docs['imageUrl'] as String)
            .toList();
      }
    } catch (e) {
      Get.snackbar("Error", '$e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appmaincolor,
          colorText: AppConstant.textcolor);
    }
  }
}
