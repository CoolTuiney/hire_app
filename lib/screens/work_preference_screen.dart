import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hire_app/screens/register_screen.dart';
import 'package:hire_app/utils/extensions.dart';

import '../utils/app_theme.dart';
import '../utils/common_widget.dart';
import '../utils/custom_text.dart';
import 'home_screen.dart';

class WorkPreference extends StatelessWidget {
  const WorkPreference({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.appBar(title: ""),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  width: 80.h,
                  child: const CustomTF(
                    keyboardType: TextInputType.number,
                  )).paddingSymmetric(horizontal: 5.h),
              CustomText.title(text: "per year.")
            ],
          ).paddingOnly(bottom: 20.h),
          const CustomTF(
            lable: "Preferred work location",
            hint: "Eg. Mumbai, Pune, Banglore",
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CommonWidget.roundedButton(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 40.h),
                context: context,
                title: "Submit",
                onTap: () {
                  CommonWidget.replaceTo(context, const HomeScreen());
                }),
          ).paddingOnly(top: 30.h)
        ]).paddingSymmetric(horizontal: 15.h, vertical: 10.h),
      ),
    );
  }
}
