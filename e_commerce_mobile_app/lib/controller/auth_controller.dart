import 'dart:convert';

import 'package:e_commerce_mobile_app/model/user.dart';
import 'package:e_commerce_mobile_app/service/local_service/local_auth_service.dart';
import 'package:e_commerce_mobile_app/service/remote_service/remote_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> user = Rxn<User>();
  final LocalAuthService _localAuthService = LocalAuthService();

  @override
  void onInit() async {
    super.onInit();
    await _localAuthService.init();
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
          user.value = userFromJson(userResult.body);
          await _localAuthService.addToken(token: token);
          await _localAuthService.addUser(user: user.value!);
          EasyLoading.showSuccess('Welcome');
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError('Something wrong. Try again!');
        }
      } else {
        EasyLoading.showError('Something wrong. Try again!');
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    user.value = null;
    await _localAuthService.clear();
  }

  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(status: 'Loading..', dismissOnTap: false);
      final result =
          await RemoteAuthService().signIn(email: email, password: password);
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        final userResult = await RemoteAuthService().getProfile(token: token);
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          await _localAuthService.addToken(token: token);
          await _localAuthService.addUser(user: user.value!);
          EasyLoading.showSuccess('Welcome');
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError('Something wrong. Try again!');
        }
      } else {
        EasyLoading.showError('Something wrong. Try again!');
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
