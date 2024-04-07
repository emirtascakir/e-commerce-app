import 'dart:convert';

import 'package:e_commerce_mobile_app/model/user.dart';
import 'package:e_commerce_mobile_app/service/remote_service/remote_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
  }

  void signUp(
      {required String fullName,
      required String email,
      required String password}) async {
    try {
      EasyLoading.show(status: 'Loading..', dismissOnTap: false);
      final result =
          await RemoteAuthService().signUp(email: email, password: password);
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        final userResult = await RemoteAuthService()
            .createProfile(fullName: fullName, token: token);
        if (userResult.statusCode == 200) {
          EasyLoading.showSuccess('Welcome');
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError('Something wrong. Try again!');
        }
      } else {
        EasyLoading.showError('Something wrong. Try again!');
      }
    } finally {
      EasyLoading.dismiss();
    }
  }
}
