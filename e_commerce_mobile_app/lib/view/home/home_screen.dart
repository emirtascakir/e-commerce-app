import 'package:e_commerce_mobile_app/component/main_header.dart';
import 'package:e_commerce_mobile_app/controller/controllers.dart';
import 'package:e_commerce_mobile_app/view/home/components/carousel_slider/carousel_loading.dart';
import 'package:e_commerce_mobile_app/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:e_commerce_mobile_app/view/home/components/popular_category/popular_category.dart';
import 'package:e_commerce_mobile_app/view/home/components/popular_category/popular_category_loading.dart';
import 'package:e_commerce_mobile_app/view/home/components/popular_product/pop%C4%B1lar_product.dart';
import 'package:e_commerce_mobile_app/view/home/components/popular_product/popular_product_loading.dart';
import 'package:e_commerce_mobile_app/view/home/components/section_title.dart';
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
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Obx(
                    () {
                      if (homeController.bannerList.isNotEmpty) {
                        return CarouselSliderView(
                            bannerList: homeController.bannerList);
                      } else {
                        return const CarouselLoading();
                      }
                    },
                  ),
                  const SectionTitle(title: "Popular Categories"),
                  Obx(
                    () {
                      if (homeController.popularCategoryList.isNotEmpty) {
                        return PopularCategory(
                            categories: homeController.popularCategoryList);
                      } else {
                        return const PopularCategoryLoading();
                      }
                    },
                  ),
                  const SectionTitle(title: "Popular Products"),
                  Obx(
                    () {
                      if (homeController.popularProductList.isNotEmpty) {
                        return PopularProduct(
                          popularProducts: homeController.popularProductList,
                        );
                      } else {
                        return const PopularProductLoading();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
