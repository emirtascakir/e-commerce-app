import 'package:e_commerce_mobile_app/model/ad_banner.dart';
import 'package:e_commerce_mobile_app/service/remote_service/remote_banner_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAdBanners();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);
      final result = await RemoteBannerService().get();
      if (result != null) {
        bannerList.assignAll(adBannerListFromJson(result.body));
      }
    } finally {
      isBannerLoading(false);
    }
  }
}
