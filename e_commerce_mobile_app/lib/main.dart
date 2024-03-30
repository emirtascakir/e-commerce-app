import 'package:e_commerce_mobile_app/model/ad_banner.dart';
import 'package:e_commerce_mobile_app/model/category.dart';
import 'package:e_commerce_mobile_app/model/product.dart';
import 'package:e_commerce_mobile_app/route/app_page.dart';
import 'package:e_commerce_mobile_app/route/app_route.dart';
import 'package:e_commerce_mobile_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AdBannerAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ProductAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
