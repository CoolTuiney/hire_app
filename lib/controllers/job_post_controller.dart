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

class JobPostController extends GetxController {
  final companyTextCont = TextEditingController();
  final designationTextCont = TextEditingController();
  final jdTextCont = TextEditingController();
  final salaryTextCont = TextEditingController();
  final locationTextCont = TextEditingController();
  final skillsTextCont = TextEditingController();
  final openingsTextCont = TextEditingController();

  var isLoading = false.obs;
  UserRegisterResModel? userRegisterModel;

  deinit() {
    companyTextCont.clear();
    designationTextCont.clear();
    jdTextCont.clear();
    salaryTextCont.clear();
    locationTextCont.clear();
    skillsTextCont.clear();
    openingsTextCont.clear();
    userRegisterModel = null;
  }

  createJob() async {
    var data = {
      // "jpId": 0,
      // "jpImage": "Testjobpost1.jpg",
      "designation": designationTextCont.text,
      "company": companyTextCont.text,
      "location": locationTextCont.text,
      "skills": skillsTextCont.text,
      "salary": salaryTextCont.text,
      "noOfOpenings": openingsTextCont.text,
      "jpDescription": jdTextCont.text
    };

    var res = await CommonWidget.apiCallWithLoading(
        DioClient().post(EndPoints.jobpost, data));
    if (res is DioResponse) {
      var map = jsonDecode(res.data);

      if (map['code'] == 1) {
        CommonWidget.showToast(map['message'] ?? "successfully job created");
      }
      CommonWidget.showToast(map['message'] ?? "Failed to add appartment");
    }
  }
}
