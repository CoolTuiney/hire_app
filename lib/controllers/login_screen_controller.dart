import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hire_app/screens/main_screen.dart';
import 'package:hire_app/service/shared_pref.dart';
import 'package:hire_app/utils/common_widget.dart';

import '../models/user_register_model.dart';
import '../screens/employment_details_screen.dart';
import '../service/dio_client.dart';
import '../service/end_points.dart';
import '../service/response_handler.dart';

class LoginScreenController extends GetxController {
  final emailTextCont = TextEditingController();
  final passwordTextCont = TextEditingController();
  final mobileTextCont = TextEditingController();

  var isLoading = false.obs;
  UserRegisterResModel? userRegisterModel;

  deinit() {
    emailTextCont.clear();
    passwordTextCont.clear();
    mobileTextCont.clear();
    userRegisterModel = null;
  }

  loginUser() async {
    var data = {
      "mobileNo": mobileTextCont.text,
      "emailId": emailTextCont.text,
      "password": passwordTextCont.text
    };

    var res = await CommonWidget.apiCallWithLoading(
        DioClient().post(EndPoints.userLogin, data));
    userRegisterModel =
        jsonToObject<UserRegisterResModel>(res, userRegisterResModelFromJson);
    if (userRegisterModel?.code == 1) {
      Get.off(() => const MainScreen());
      var json = userRegisterModel?.toJson();
      var loginString = jsonEncode(json);
      SharedPref.set(SharedPref.userLogin, loginString);
    } else {
      CommonWidget.showToast(
          userRegisterModel?.message ?? "Something went wrong");
    }
  }
}
