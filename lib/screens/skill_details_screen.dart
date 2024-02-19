import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hire_app/screens/register_screen.dart';
import 'package:hire_app/screens/work_preference_screen.dart';
import 'package:hire_app/utils/common_widget.dart';
import 'package:hire_app/utils/extensions.dart';

import '../utils/app_theme.dart';
import '../utils/custom_text.dart';
import 'employment_details_screen.dart';

class SkillDetailsScreen extends StatelessWidget {
  const SkillDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidget.appBar(title: ""),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.title(text: "Key Skills", size: 18, isBold: true)
                .paddingOnly(bottom: 5.h),
            CustomText.title(
              maxLine: 3,
              size: 12,
              color: AppTheme.secondaryTextColor,
              text:
                  'Enhance your profile for recruiters—include your key skills to unlock personalized job matches',
            ).paddingOnly(
              bottom: 20.h,
            ),
            const CustomTF(
              hint: "Eg. Sales, Marketing, iOS developer, Cloud computing",
            ).paddingOnly(bottom: 35.h),
            CustomText.title(text: "Education Details", size: 18, isBold: true)
                .paddingOnly(bottom: 5.h),
            CustomText.title(
              maxLine: 3,
              size: 12,
              color: AppTheme.secondaryTextColor,
              text:
                  'Share your highest qualification to unlock tailored career options.',
            ).paddingOnly(
              bottom: 5.h,
            ),
            educationDetailsWidgetList().paddingOnly(bottom: 10.h),
            CustomTF(
              lable: "University Name",
              hint: "Eg. Mumbai University",
            ).paddingOnly(bottom: 20.h),
            Align(
              alignment: Alignment.bottomCenter,
              child: CommonWidget.roundedButton(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 40.h),
                  context: context,
                  title: "Next",
                  onTap: () {
                    CommonWidget.goTo(context, const WorkPreference());
                  }),
            ).paddingOnly(bottom: 15.h)
          ],
        ).paddingSymmetric(horizontal: 15.h, vertical: 5.h)));
  }

  Widget educationDetailsWidgetList() {
    final periodList = [
      "Doctorate",
      "Post Graduate",
      "Graduate",
      "Class XII",
      "Class X",
      "Below class X"
    ];
    return Wrap(
        children: periodList
            .map((e) => CustomActionChip(title: e, onPressed: (s) {})
                .paddingSymmetric(horizontal: 5.h))
            .toList());
  }
}
