import 'package:e_commerce_mobile_app/component/main_header.dart';
import 'package:e_commerce_mobile_app/controller/controllers.dart';
import 'package:e_commerce_mobile_app/view/product/components/product_grid.dart';
import 'package:e_commerce_mobile_app/view/product/components/product_loading_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(
            child: Obx(
              () {
                if (productController.isProductLoading.value) {
                  return const ProductLoadingGrid();
                } else {
                  if (productController.productList.isNotEmpty) {
                    return ProductGrid(products: productController.productList);
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Product not found..',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SvgPicture.asset('assets/product_not_found.svg'),
                      ],
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
