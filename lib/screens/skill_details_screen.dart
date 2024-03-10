import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_app/controllers/employeement_detail_controller.dart';
import 'package:hire_app/screens/register_screen.dart';
import 'package:hire_app/screens/work_preference_screen.dart';
import 'package:hire_app/utils/common_widget.dart';
import 'package:hire_app/utils/extensions.dart';

import '../utils/app_theme.dart';
import '../utils/custom_text.dart';
import 'employment_details_screen.dart';

class SkillDetailsScreen extends StatefulWidget {
  const SkillDetailsScreen({super.key});

  @override
  State<SkillDetailsScreen> createState() => _SkillDetailsScreenState();
}

class _SkillDetailsScreenState extends State<SkillDetailsScreen> {
  final empmentController = Get.find<EmployeementDetailController>();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidget.appBar(title: ""),
        body: SingleChildScrollView(
            child: Form(
          key: formKey,
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
              CustomTF(
                      hint:
                          "Eg. Sales, Marketing, iOS developer, Cloud computing",
                      validator: (val) =>
                          (val.isEmpty) ? "Please enter skills" : null,
                      controller: empmentController.keySkillsNameTextCont)
                  .paddingOnly(bottom: 35.h),
              CustomText.title(
                      text: "Education Details", size: 18, isBold: true)
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
              educationDetailsWidgetList(),
              Obx(
                () => CustomText.title(
                        text: "Please select education detail",
                        color: Colors.red.shade900,
                        size: 11)
                    .paddingOnly(bottom: 10.h)
                    .visible(empmentController.willShowEduDetailError.value),
              ),
              CustomTF(
                lable: "University Name",
                hint: "Eg. Mumbai University",
                controller: empmentController.universityNameTextCont,
                validator: (val) =>
                    (val.isEmpty) ? "Please enter university name" : null,
              ).paddingOnly(bottom: 20.h),
              Align(
                alignment: Alignment.bottomCenter,
                child: CommonWidget.roundedButton(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 40.h),
                    context: context,
                    title: "Next",
                    onTap: () {
                      empmentController.isEduDetailSelected();
                      if ((formKey.currentState?.validate() ?? false) &&
                          !empmentController.willShowEduDetailError.value) {
                        CommonWidget.goTo(context, const WorkPreference());
                      }
                    }),
              ).paddingOnly(bottom: 15.h)
            ],
          ).paddingSymmetric(horizontal: 15.h, vertical: 5.h),
        )));
  }

  Widget educationDetailsWidgetList() {
    return Wrap(
        children: empmentController.educationList
            .map((e) => CustomActionChip(
                  transform: 0.9,
                  title: e.title,
                  isSelected: e.isSelected,
                  onPressed: (p0) {
                    for (var e in empmentController.educationList) {
                      e.isSelected = false;
                    }
                    e.isSelected = true;
                    setState(() {});
                    empmentController.educationDetails.value = e.title;
                  },
                ).paddingSymmetric(horizontal: 5.h))
            .toList());
  }
}
