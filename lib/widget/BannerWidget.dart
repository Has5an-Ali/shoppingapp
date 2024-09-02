// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bannerController.dart';

class Bannerwidget extends StatelessWidget {
  Bannerwidget({super.key});

  final CarouselSliderController carouselSliderController =
      CarouselSliderController();
  final BannerController bannerController = Get.put(BannerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return CarouselSlider(
            items: bannerController.BannerUrl.map((imageUrl) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ))).toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 19 / 6,
            ));
      }),
    );
  }
}
