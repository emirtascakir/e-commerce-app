import 'package:e_commerce_mobile_app/component/main_header.dart';
import 'package:flutter/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [const MainHeader(), Expanded(child: Container())],
      ),
    );
  }
}
