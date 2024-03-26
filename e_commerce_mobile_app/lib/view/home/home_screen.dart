import 'package:e_commerce_mobile_app/component/main_header.dart';
import 'package:e_commerce_mobile_app/controller/controllers.dart';
import 'package:e_commerce_mobile_app/view/home/components/carousel_slider/carousel_loading.dart';
import 'package:e_commerce_mobile_app/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Obx(() {
            if (homeController.bannerList.isNotEmpty) {
              return CarouselSliderView(bannerList: homeController.bannerList);
            } else {
              return const CarouselLoading();
            }
          })
        ],
      ),
    );
  }
}
