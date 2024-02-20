import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hire_app/screens/employment_details_screen.dart';
import 'package:hire_app/utils/app_theme.dart';
import 'package:hire_app/utils/common_widget.dart';
import 'package:hire_app/utils/custom_text.dart';
import 'package:hire_app/utils/extensions.dart';
import 'package:hire_app/utils/utility.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: CommonWidget.appBar(title: ""),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.title(text: "Login", size: 18, isBold: true)
                  .paddingOnly(bottom: 5.h),
              CustomText.title(
                maxLine: 3,
                size: 12,
                color: AppTheme.secondaryTextColor,
                text: "Explore and apply for jobs on leading job platform.",
              ).paddingOnly(
                bottom: 20.h,
              ),
              const CustomTF(
                lable: 'Mobile',
                hint: "Enter your mobile number",
                helperTxt: "Recruiters will contact you on this numbers",
                validator: Utility.validateMobile,
              ).paddingOnly(bottom: 25.h),
              const CustomTF(
                lable: 'Password',
                hint: "Enter password",
                helperTxt: "Minimum 6 characters",
                showObscure: true,
                validator: Utility.validatePassword,
              ).paddingOnly(bottom: 15.h),
              Center(
                child: CommonWidget.roundedButton(
                    context: context,
                    title: "Login",
                    onTap: () {
                      // if (formKey.currentState?.validate() ?? false) {
                      CommonWidget.goTo(
                          context, const EmploymentDetailsScreen());
                      // }
                    }),
              )
            ],
          ).paddingSymmetric(horizontal: 15.h, vertical: 14.h),
        ),
      ),
    );
  }
}


