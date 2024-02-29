import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hire_app/controllers/login_screen_controller.dart';
import 'package:hire_app/controllers/register_screen_controller.dart';
import 'package:hire_app/utils/utility.dart';

import '../screens/employment_details_screen.dart';
import '../service/dio_client.dart';
import '../service/end_points.dart';
import '../service/response_handler.dart';
import '../utils/common_widget.dart';

class EmployeementDetailController extends GetxController {
  final yearExpTextCont = TextEditingController();
  final monthsExpTextCont = TextEditingController();
  final companyNameTextCont = TextEditingController();
  final jobTitleTextCont = TextEditingController();
  final currSalaryTextCont = TextEditingController();
  final currWorkDurTextCont = TextEditingController();

  final universityNameTextCont = TextEditingController();
  final keySkillsNameTextCont = TextEditingController();
  final preferredSalaryTextCont = TextEditingController();
  final perferredWorkLocationTextCont = TextEditingController();

  var educationDetails = "".obs;
  var fromDate = "".obs;
  var toDate = "".obs;

  var willShowEduDetailError = false.obs;

  final periodList = [
    ChipsDetails(title: "15 days or less"),
    ChipsDetails(title: "1 Month"),
    ChipsDetails(title: "2 Month"),
    ChipsDetails(title: "3 Month"),
    ChipsDetails(title: "More than 3 Months"),
    ChipsDetails(title: "Serving notice period")
  ];

  final educationList = [
    ChipsDetails(title: "Doctorate"),
    ChipsDetails(title: "Post Graduate"),
    ChipsDetails(title: "Graduate"),
    ChipsDetails(title: "Class XII"),
    ChipsDetails(title: "Class X"),
    ChipsDetails(title: "Below class X")
  ];

  var noticePeriod = "".obs;

  submitEmployementDetail() async {
    final registerCont = Get.find<RegisterScreenController>();
    var convertedFromDate =
        Utility.convertStringToDateTime(fromDate.value)?.toIso8601String() ??
            "";
    var convertedToDate =
        Utility.convertStringToDateTime(toDate.value)?.toIso8601String() ?? "";
    var data = {
      "umdId": registerCont.userRegisterModel?.data?.umId,
      "umId": 0,
      "experience_years": yearExpTextCont.text,
      "experience_month": monthsExpTextCont.text,
      "currentCompany": companyNameTextCont.text,
      "jobTitle": jobTitleTextCont.text,
      "currentSalary": currSalaryTextCont.text,
      "workDurationFromDate": convertedFromDate,
      "workDurationToDate": convertedToDate,
      "noticePeriod": noticePeriod.value,
      "keySkills": keySkillsNameTextCont.text,
      "educationDetails": educationDetails.value,
      "universityName": universityNameTextCont.text,
      "preferredSalary": preferredSalaryTextCont.text,
      "prefferedLocation": perferredWorkLocationTextCont.text,
      "resume": "",
      "photo": ""
    };

    var res = await DioClient().post(EndPoints.employeeDetailsSave, data);
    if (res is DioResponse) {
      var map = jsonDecode(res.data);

      if (map['code'] == 1) {
        return true;
      }
      CommonWidget.showToast(map['message'] ?? "something went wrong");
    }
  }

  void isEduDetailSelected() {
    // willShowEduDetailError.value =
    //     educationList.firstWhere((e) => e.isSelected ?? false).isSelected ??
    //         false;
    willShowEduDetailError.value = true;
    for (var item in educationList) {
      if (item.isSelected ?? false) {
        willShowEduDetailError.value = false;
        return;
      }
    }
  }
}
