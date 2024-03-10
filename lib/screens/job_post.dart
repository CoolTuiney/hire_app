import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_app/controllers/employeement_detail_controller.dart';
import 'package:hire_app/controllers/job_post_controller.dart';
import 'package:hire_app/utils/common_widget.dart';

import '../utils/app_theme.dart';
import '../utils/custom_text.dart';

class JobPostScreen extends StatelessWidget {
  const JobPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var jobPostCont = Get.put(JobPostController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: CommonWidget.appBar(title: "Create Job"),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.title(
                        text: "Employment Details", size: 18, isBold: true)
                    .paddingOnly(bottom: 5.h),
                CustomTF(
                  lable: 'Company',
                  hint: "Eg. ABC Company",
                  controller: jobPostCont.companyTextCont,
                  validator: (val) =>
                      (val.isEmpty) ? "Please enter company name" : null,
                ).paddingOnly(bottom: 20.h),
                CustomTF(
                        lable: 'Designation',
                        hint: "Eg. iOS Developer",
                        validator: (val) =>
                            (val.isEmpty) ? "Please enter designation" : null,
                        controller: jobPostCont.designationTextCont)
                    .paddingOnly(bottom: 20.h),
                CustomTF(
                        lable: "Salary",
                        hint: "Eg. 20 LPA",
                        validator: (val) =>
                            (val.isEmpty) ? "Please enter salary" : null,
                        controller: jobPostCont.salaryTextCont)
                    .paddingOnly(bottom: 20.h),
                CustomTF(
                        lable: "Location",
                        hint: "Eg. Mumbai",
                        validator: (val) =>
                            (val.isEmpty) ? "Please enter job location" : null,
                        controller: jobPostCont.locationTextCont)
                    .paddingOnly(bottom: 20.h),
                CustomTF(
                        lable: "Skills",
                        hint: "Eg. Swift, iOS, Flutter",
                        validator: (val) =>
                            (val.isEmpty) ? "Please enter skills" : null,
                        controller: jobPostCont.skillsTextCont)
                    .paddingOnly(bottom: 20.h),
                CustomTF(
                        lable: "Number of Openings",
                        hint: "Eg. 2",
                        validator: (val) => (val.isEmpty)
                            ? "Please enter no. of openings"
                            : null,
                        keyboardType: TextInputType.number,
                        controller: jobPostCont.openingsTextCont)
                    .paddingOnly(bottom: 20.h),
                CustomText.title(text: "Job Description"),
                CustomMultiTF(
                        // lable: '',
                        hint: "Enter full job description",
                        maxLine: 8,
                        validator: (val) => (val.isEmpty)
                            ? "Please enter job description"
                            : null,
                        controller: jobPostCont.jdTextCont)
                    .paddingOnly(bottom: 20.h),
                Center(
                  child: CommonWidget.roundedButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 40.h),
                      context: context,
                      title: "Create",
                      onTap: () {
                        // CommonWidget.showToast("successfully job created");
                        if (formKey.currentState?.validate() ?? false) {
                          jobPostCont.createJob();
                        }
                      }),
                ).paddingOnly(bottom: 15.h)
              ],
            ).paddingSymmetric(horizontal: 15.h, vertical: 5.h),
          ),
        ));
  }
}
