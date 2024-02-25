import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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
    var data = {
      "umdId": 0,
      "umId": 0,
      "experience_years": "string",
      "experience_month": "string",
      "currentCompany": "string",
      "jobTitle": "string",
      "currentSalary": "string",
      "workDurationFromDate": "2024-02-25T17:59:28.241Z",
      "workDurationToDate": "2024-02-25T17:59:28.241Z",
      "noticePeriod": "string",
      "keySkills": "string",
      "educationDetails": "string",
      "universityName": "string",
      "preferredSalary": "string",
      "prefferedLocation": "string",
      "resume": "string",
      "photo": "string"
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
}
