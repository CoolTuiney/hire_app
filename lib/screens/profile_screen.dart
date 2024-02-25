import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_app/controllers/profile_screen_controller.dart';
import 'package:hire_app/utils/app_theme.dart';
import 'package:hire_app/utils/common_widget.dart';

import 'package:hire_app/utils/custom_text.dart';
import 'package:hire_app/utils/extensions.dart';

import 'employment_details_screen.dart';

// {
//   "umdId": 0,
//   "umId": 0,
//   "experience_years": "string", done
//   "experience_month": "string", done
//   "currentCompany": "string",
//   "jobTitle": "string",
//   "currentSalary": "string",
//   "workDurationFromDate": "2024-02-21T07:11:42.449Z",
//   "workDurationToDate": "2024-02-21T07:11:42.449Z",
//   "noticePeriod": "string",
//   "keySkills": "string",
//   "educationDetails": "string",
//   "universityName": "string",
//   "preferredSalary": "string",
//   "prefferedLocation": "string",
//   "resume": "string",
//   "photo": "string"
// }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.find<ProfileScreenController>();
  final profileData =
      Get.find<ProfileScreenController>().getEmployeeDetailModel?.data;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (profileController.isLoading.value)
          ? CommonWidget.showLoader()
          : Column(
              children: [
                avatarHeader(),
                PersonalDetailCard(),
                skillDetailsWidgetList()
              ],
            ),
    );
  }

  Widget skillDetailsWidgetList() {
    final periodList =
        profileData?.keySkills?.removeAllWhitespace.split(",") ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomText.title(text: "Skills", isBold: true)
              .paddingSymmetric(vertical: 5.h, horizontal: 5.h),
        ),
        Wrap(
            children: periodList
                .map((e) => CustomActionChip(title: e, onPressed: (s) {})
                    .paddingSymmetric(horizontal: 0.h))
                .toList()),
      ],
    )
        .paddingSymmetric(horizontal: 15.h)
        .visible(isVisible: periodList.isNotEmpty);
  }

  Column avatarHeader() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: CircleAvatar(
            radius: 30.r,
            backgroundColor: AppTheme.lightPrimaryColor.withOpacity(0.2),
            child: CustomText.title(text: "AS", size: 20),
          ).paddingSymmetric(vertical: 5.h),
        ),
        CustomText.title(text: "Abhay Sharma", size: 16, isBold: true),
        CustomText.title(
            text:
                profileController.getEmployeeDetailModel?.data?.jobTitle ?? "",
            size: 12),
      ],
    );
  }

  String getInitials(String name) {
    // Split the name into individual words
    List<String> words = name.split(' ');

    // Initialize an empty string to store initials
    String initials = '';

    // Iterate through the words and append the first character of each word to the initials
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        initials += words[i][0].toUpperCase();
        if (initials.length == 2) {
          break; // Exit loop if we have two initials
        }
      }
    }

    return initials;
  }
}

class PersonalDetailCard extends StatelessWidget {
  PersonalDetailCard({
    super.key,
  });

  final profileController = Get.find<ProfileScreenController>();
  final profileData =
      Get.find<ProfileScreenController>().getEmployeeDetailModel?.data;
  @override
  Widget build(BuildContext context) {
    var exp =
        getExpText(profileData?.experienceYears, profileData?.experienceMonth);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.title(text: "Personal Details", isBold: true)
            .paddingSymmetric(vertical: 5.h, horizontal: 5.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 15.h),
          decoration: CommonWidget.containerDecoration(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  singleDataCol(label: "Year of Experience", value: exp),
                  singleDataCol(
                      label: "Preferred Location",
                      value: profileData?.prefferedLocation ?? ""),
                ],
              ).paddingOnly(bottom: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  singleDataCol(
                      label: "Current Salary",
                      value: profileData?.currentSalary ?? ""),
                  singleDataCol(
                      label: "Preferred Salary",
                      value: profileData?.preferredSalary ?? ""),
                ],
              ).paddingOnly(bottom: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  singleDataCol(
                      label: "Education",
                      value: profileData?.educationDetails ?? ""),
                  singleDataCol(
                      label: "University",
                      value: profileData?.univercityName ?? ""),
                ],
              ),
            ],
          ),
        ),
      ],
    ).paddingSymmetric(vertical: 15.h, horizontal: 15.h);
  }

  String getExpText(String? yrs, String? month) {
    // Convert yrs and month to integers, handling null values
    int years = yrs != null ? int.tryParse(yrs) ?? 0 : 0;
    int months = month != null ? int.tryParse(month) ?? 0 : 0;

    // Handle cases where both years and months are 0
    if (years == 0 && months == 0) {
      return "-";
    }

    // Construct the output string based on the provided values
    String result = '';
    if (years > 0) {
      result += '$years Yrs';
      if (months > 0) {
        result += ' ';
      }
    }
    if (months > 0) {
      result += '$months Months';
    }

    return result.trim();
  }

  Widget singleDataCol({required String label, required String value}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.subTitle(
              text: label, color: AppTheme.primaryTextColor.withOpacity(0.7)),
          CustomText.title(text: value),
        ],
      ),
    );
  }

  String getInitials(String name) {
    // Split the name into individual words
    List<String> words = name.split(' ');

    // Initialize an empty string to store initials
    String initials = '';

    // Iterate through the words and append the first character of each word to the initials
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        initials += words[i][0].toUpperCase();
        if (initials.length == 2) {
          break; // Exit loop if we have two initials
        }
      }
    }

    return initials;
  }
}
