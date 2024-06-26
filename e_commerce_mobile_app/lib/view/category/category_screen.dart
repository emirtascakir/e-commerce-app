import 'package:e_commerce_mobile_app/controller/controllers.dart';
import 'package:e_commerce_mobile_app/view/category/components/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categoryController.categoryList.isNotEmpty) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: categoryController.categoryList.length,
          itemBuilder: (context, index) =>
              CategoryCard(category: categoryController.categoryList[index]),
        );
      } else {
        return Container(
          color: Colors.blue,
        );
      }
    });
  }
}
