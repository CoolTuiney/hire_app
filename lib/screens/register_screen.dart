import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hire_app/screens/employment_details_screen.dart';
import 'package:hire_app/utils/app_theme.dart';
import 'package:hire_app/utils/common_widget.dart';
import 'package:hire_app/utils/custom_text.dart';
import 'package:hire_app/utils/extensions.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.appBar(title: ""),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.title(
                    text: "Create your  profile", size: 18, isBold: true)
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
              lable: 'Full Name',
              hint: "Enter your full name",
            ).paddingOnly(bottom: 15.h),
            const CustomTF(
              lable: 'Email',
              hint: "Enter your Email",
            ).paddingOnly(bottom: 15.h),
            const CustomTF(
              lable: 'Password',
              hint: "create password",
              helperTxt: "Minimum 6 characters",
            ).paddingOnly(bottom: 15),
            const CustomTF(
              lable: 'Mobile',
              hint: "Enter your mobile number",
              helperTxt: "Recruiters will contact you on this numbers",
            ).paddingOnly(bottom: 40),
            Center(
              child: CommonWidget.roundedButton(
                  context: context,
                  title: "Register",
                  onTap: () {
                    CommonWidget.goTo(context, const EmploymentDetailsScreen());
                  }),
            )
          ],
        ).paddingSymmetric(horizontal: 15.h, vertical: 14.h),
      ),
    );
  }
}

class CustomTF extends StatelessWidget {
  const CustomTF({
    super.key,
    this.hint,
    this.lable,
    this.helperTxt,
    this.keyboardType,
  });
  final String? lable;
  final String? hint;
  final String? helperTxt;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        // isDense: true,
        helperText: helperTxt,
        labelText: lable,
        hintText: hint,
        labelStyle: const TextStyle(color: AppTheme.primaryTextColor),
        helperStyle: const TextStyle(color: AppTheme.secondaryTextColor),
        hintStyle: const TextStyle(color: AppTheme.secondaryTextColor),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
