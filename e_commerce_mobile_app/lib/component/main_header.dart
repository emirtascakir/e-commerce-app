import 'package:e_commerce_mobile_app/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(.4),
              blurRadius: 10,
              offset: const Offset(0, 0)),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(24),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(.6),
                        offset: const Offset(0, 0),
                        blurRadius: 8),
                  ],
                ),
                child: Obx(
                  () => TextField(
                    controller: productController.searchTextEditController,
                    autofocus: false,
                    onSubmitted: (value) {
                      productController.getProductByName(keyword: value);
                      dashboardController.updateIndex(1);
                    },
                    onChanged: (value) {
                      productController.searchVal.value = value;
                    },
                    decoration: InputDecoration(
                      suffixIcon: productController.searchVal.value.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                productController.searchTextEditController
                                    .clear();
                                productController.searchVal.value = '';
                                productController.getProducts();
                              },
                              icon: Icon(
                                Icons.clear,
                                color: Colors.grey.shade600,
                              ))
                          : null,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 16,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search...",
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                )),
          ),
          const SizedBox(width: 10),
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(color: Colors.grey.withOpacity(.6), blurRadius: 8)
                ]),
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.filter_alt_outlined,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 10),
          Badge(
            label: const Text("2", style: TextStyle(color: Colors.white)),
            backgroundColor: Theme.of(context).primaryColor,
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: Colors.grey.withOpacity(.6), blurRadius: 8)
                  ]),
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 3),
        ],
      ),
    );
  }
}
