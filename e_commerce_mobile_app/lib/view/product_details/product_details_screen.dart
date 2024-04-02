import 'package:e_commerce_mobile_app/model/product.dart';
import 'package:e_commerce_mobile_app/view/product_details/components/product_carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [ProductCarouselSlider(images: product.images)],
        ),
      ),
    );
  }
}
