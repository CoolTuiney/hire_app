import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        avatarHeader(),
        const PersonalDetailCard(),
        skillDetailsWidgetList()
      ],
    );
  }

  Widget skillDetailsWidgetList() {
    final periodList = [
      "Flutter",
      "Dart",
      "Native",
      "Firebase",
      "SQLite",
      "Mobile App Development",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.title(text: "Skills", isBold: true)
            .paddingSymmetric(vertical: 5.h, horizontal: 5.h),
        Wrap(
            children: periodList
                .map((e) => CustomActionChip(title: e, onPressed: (s) {})
                    .paddingSymmetric(horizontal: 0.h))
                .toList()),
      ],
    ).paddingSymmetric(horizontal: 15.h);
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
        CustomText.title(text: "iOS Developer", size: 12),
      ],
    );
  }
}

class PersonalDetailCard extends StatelessWidget {
  const PersonalDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  singleDataCol(label: "Year of Experience", value: "2 Yrs"),
                  singleDataCol(label: "Preferred Location", value: "Mumbai"),
                ],
              ).paddingOnly(bottom: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  singleDataCol(label: "Current Salary", value: "50 LPA"),
                  singleDataCol(label: "Preferred Salary", value: "1 Cr"),
                ],
              ).paddingOnly(bottom: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  singleDataCol(label: "Education", value: "MCA"),
                  singleDataCol(
                      label: "University", value: "Mumbai University"),
                ],
              ),
            ],
          ),
        ),
      ],
    ).paddingSymmetric(vertical: 15.h, horizontal: 15.h);
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
}
