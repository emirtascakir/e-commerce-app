import 'package:e_commerce_mobile_app/route/app_page.dart';
import 'package:e_commerce_mobile_app/route/app_route.dart';
import 'package:e_commerce_mobile_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
