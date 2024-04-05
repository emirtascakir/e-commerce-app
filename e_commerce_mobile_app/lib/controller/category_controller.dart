import 'package:e_commerce_mobile_app/model/category.dart';
import 'package:e_commerce_mobile_app/service/local_service/local_category_service.dart';
import 'package:e_commerce_mobile_app/service/remote_service/remote_category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController instance = Get.find();
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  final LocalCategoryService _localCategoryService = LocalCategoryService();
  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await _localCategoryService.init();
    getCategories();
  }

  void getCategories() async {
    try {
      isCategoryLoading(true);
      if (_localCategoryService.getCategories().isNotEmpty) {
        categoryList.assignAll(_localCategoryService.getCategories());
      }
      final result = await RemoteCategoryService().get();
      if (result != null) {
        categoryList.assignAll(categoryListFromJson(result.body));
        _localCategoryService.assignAllCategories(
            categories: categoryListFromJson(result.body));
      }
    } finally {
      isCategoryLoading(false);
    }
  }
}
