import 'package:e_commerce_mobile_app/model/ad_banner.dart';
import 'package:e_commerce_mobile_app/model/category.dart';
import 'package:e_commerce_mobile_app/model/product.dart';
import 'package:e_commerce_mobile_app/service/local_service/local_ad_banner_service.dart';
import 'package:e_commerce_mobile_app/service/local_service/local_category_service.dart';
import 'package:e_commerce_mobile_app/service/local_service/local_product_service.dart';
import 'package:e_commerce_mobile_app/service/remote_service/remote_banner_service.dart';
import 'package:e_commerce_mobile_app/service/remote_service/remote_popular_category_service.dart';
import 'package:e_commerce_mobile_app/service/remote_service/remote_popular_product_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList =
      List<Category>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;
  final LocalAdBannerService _localAdBannerService = LocalAdBannerService();
  final LocalCategoryService _localCategoryService = LocalCategoryService();
  final LocalProductService _localProductService = LocalProductService();

  @override
  void onInit() async {
    super.onInit();
    await _localAdBannerService.init();
    await _localCategoryService.init();
    await _localProductService.init();
    getAdBanners();
    getPopularCategories();
    getPopularProducts();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);
      if (_localAdBannerService.getAdBanners().isNotEmpty) {
        bannerList.assignAll(_localAdBannerService.getAdBanners());
      }
      final result = await RemoteBannerService().get();
      if (result != null) {
        bannerList.assignAll(adBannerListFromJson(result.body));
        _localAdBannerService.assignAllAdBanners(
            adBanners: adBannerListFromJson(result.body));
      }
    } finally {
      isBannerLoading(false);
    }
  }

  void getPopularCategories() async {
    try {
      isPopularCategoryLoading(true);
      if (_localCategoryService.getPopularCategories().isNotEmpty) {
        popularCategoryList
            .assignAll(_localCategoryService.getPopularCategories());
      }
      final result = await RemotePopularCategoryService().get();
      if (result != null) {
        popularCategoryList.assignAll(popularCategoryListFromJson(result.body));
        _localCategoryService.assignAllPopularCategories(
            popularCategories: popularCategoryListFromJson(result.body));
      }
    } finally {
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProducts() async {
    try {
      isPopularProductLoading(true);
      if (_localProductService.getPopularProducts().isNotEmpty) {
        popularProductList.assignAll(_localProductService.getPopularProducts());
      }
      final result = await RemotePopularProductsService().get();
      if (result != null) {
        popularProductList.assignAll(popularProductListFromJson(result.body));
        _localProductService.assignAllPopularProducts(
            popularProducts: popularProductListFromJson(result.body));
      }
    } finally {
      isPopularProductLoading(false);
    }
  }
}
