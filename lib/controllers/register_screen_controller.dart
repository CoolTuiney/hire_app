import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hire_app/utils/common_widget.dart';

import '../models/user_register_model.dart';
import '../screens/employment_details_screen.dart';
import '../service/dio_client.dart';
import '../service/end_points.dart';
import '../service/response_handler.dart';

class RegisterScreenController extends GetxController {
  final fullNameTextCont = TextEditingController();
  final emailTextCont = TextEditingController();
  final passwordTextCont = TextEditingController();
  final mobileTextCont = TextEditingController();

  var isLoading = false.obs;
  UserRegisterResModel? userRegisterModel;

  registerUser() async {
    var data = {
      "umId": 0,
      "fullName": fullNameTextCont.text,
      "emailId": emailTextCont.text,
      "password": passwordTextCont.text,
      "mobileNo": mobileTextCont.text,
      "token": ""
    };

    var res = await CommonWidget.apiCallWithLoading(
        DioClient().post(EndPoints.userRegsiter, data));
    userRegisterModel =
        jsonToObject<UserRegisterResModel>(res, userRegisterResModelFromJson);
    if (userRegisterModel?.code == 1) {
      Get.off(() => const EmploymentDetailsScreen());
    } else {
      CommonWidget.showToast(
          userRegisterModel?.message ?? "Something went wrong");
    }
  }
}
