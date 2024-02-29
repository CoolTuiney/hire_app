import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_app/controllers/login_screen_controller.dart';
import 'package:hire_app/screens/employment_details_screen.dart';
import 'package:hire_app/screens/register_screen.dart';
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
    final loginCont = Get.find<LoginScreenController>();
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
              CustomTF(
                lable: 'Mobile',
                hint: "Enter your mobile number",
                keyboardType: TextInputType.number,
                controller: loginCont.mobileTextCont,
                formatter: Utility.inputFormattersDigitOnly(),
                validator: Utility.validateMobile,
              ).paddingOnly(bottom: 25.h),
              CustomTF(
                lable: 'Email',
                hint: "Enter your email",
                controller: loginCont.emailTextCont,
                validator: Utility.validateEmail,
              ).paddingOnly(bottom: 25.h),
              CustomTF(
                lable: 'Password',
                hint: "Enter password",
                helperTxt: "Minimum 6 characters",
                controller: loginCont.passwordTextCont,
                showObscure: true,
                validator: Utility.validatePassword,
              ).paddingOnly(bottom: 35.h),
              Center(
                child: CommonWidget.roundedButton(
                    context: context,
                    title: "Login",
                    onTap: () {
                      if (formKey.currentState?.validate() ?? false) {
                        loginCont.loginUser();
                      }
                    }),
              ).paddingOnly(bottom: 30.h),
              Center(
                child: RichText(
                  text:  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Don't have an account?\t",
                        style: TextStyle(color: AppTheme.primaryTextColor),
                      ),
                      TextSpan(
                        text: "Register",
                        style: const TextStyle(
                            color: AppTheme.lightPrimaryColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.off(()=> const RegisterScreen()),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 15.h, vertical: 14.h),
        ),
      ),
    );
  }
}
