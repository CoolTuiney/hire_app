import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_app/controllers/register_screen_controller.dart';
import 'package:hire_app/screens/employment_details_screen.dart';
import 'package:hire_app/utils/app_theme.dart';
import 'package:hire_app/utils/common_widget.dart';
import 'package:hire_app/utils/custom_text.dart';
import 'package:hire_app/utils/extensions.dart';
import 'package:hire_app/utils/utility.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = RegisterScreenController();
    return Scaffold(
      appBar: CommonWidget.appBar(title: ""),
      body: Obx(
        () => (registerController.isLoading.value)
            ? CommonWidget.showLoader()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.title(
                            text: "Create your profile", size: 18, isBold: true)
                        .paddingOnly(bottom: 5.h),
                    CustomText.title(
                      maxLine: 3,
                      size: 12,
                      color: AppTheme.secondaryTextColor,
                      text:
                          "Explore and apply for jobs on leading job platform.",
                    ).paddingOnly(
                      bottom: 20.h,
                    ),
                    CustomTF(
                      lable: 'Full Name',
                      hint: "Enter your full name",
                      validator: Utility.validateName,
                      formatter: Utility.inputFormattersAlphabet(),
                    ).paddingOnly(bottom: 15.h),
                    const CustomTF(
                      lable: 'Email',
                      hint: "Enter your Email",
                      validator: Utility.validateEmail,
                    ).paddingOnly(bottom: 15.h),
                    const CustomTF(
                      lable: 'Password',
                      hint: "create password",
                      helperTxt: "Minimum 6 characters",
                      validator: Utility.validatePassword,
                    ).paddingOnly(bottom: 15),
                    CustomTF(
                      lable: 'Mobile',
                      hint: "Enter your mobile number",
                      helperTxt: "Recruiters will contact you on this numbers",
                      validator: Utility.validateMobile,
                      formatter: Utility.inputFormattersDigitOnly(),
                    ).paddingOnly(bottom: 40),
                    Center(
                      child: CommonWidget.roundedButton(
                          context: context,
                          title: "Register",
                          onTap: () {
                            registerController.registerUser();
                            // CommonWidget.goTo(
                            //     context, const EmploymentDetailsScreen());
                          }),
                    )
                  ],
                ).paddingSymmetric(horizontal: 15.h, vertical: 14.h),
              ),
      ),
    );
  }
}
