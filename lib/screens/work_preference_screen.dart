import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_app/controllers/employeement_detail_controller.dart';

import '../utils/app_theme.dart';
import '../utils/common_widget.dart';
import '../utils/custom_text.dart';
import 'main_screen.dart';

class WorkPreference extends StatelessWidget {
  const WorkPreference({super.key});

  @override
  Widget build(BuildContext context) {
    final empmentController = Get.find<EmployeementDetailController>();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: CommonWidget.appBar(title: ""),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomText.title(text: "Preferred Salary", size: 18, isBold: true)
                .paddingOnly(bottom: 5.h),
            CustomText.title(
              maxLine: 3,
              size: 12,
              color: AppTheme.secondaryTextColor,
              text:
                  'Share your preferred salary, and let us match you to the best career opportunities.',
            ).paddingOnly(
              bottom: 10.h,
            ),
            Row(
              children: [
                CustomText.title(text: "₹", size: 16),
                SizedBox(
                    width: 150.h,
                    child: CustomTF(
                        keyboardType: TextInputType.number,
                        controller: empmentController.preferredSalaryTextCont,
                        validator: (val) => (val.isEmpty)
                            ? "Please enter preffered salary"
                            : null)).paddingSymmetric(horizontal: 5.h),
                CustomText.title(text: "per year.")
              ],
            ).paddingOnly(bottom: 20.h),
            CustomTF(
                lable: "Preferred work location",
                hint: "Eg. Mumbai, Pune, Banglore",
                controller: empmentController.perferredWorkLocationTextCont,
                validator: (val) =>
                    (val.isEmpty) ? "Please enter work location" : null),
            Align(
              alignment: Alignment.bottomCenter,
              child: CommonWidget.roundedButton(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 40.h),
                  context: context,
                  title: "Submit",
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      Get.until((route) => Get.currentRoute == '/');
                      Get.off(() => const MainScreen());
                    }
                  }),
            ).paddingOnly(top: 30.h)
          ]).paddingSymmetric(horizontal: 15.h, vertical: 10.h),
        ),
      ),
    );
  }
}
