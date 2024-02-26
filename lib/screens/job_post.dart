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
    return Scaffold(
        appBar: CommonWidget.appBar(title: "Create Job"),
        body: SingleChildScrollView(
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
              ).paddingOnly(bottom: 20.h),
              CustomTF(
                      lable: 'Designation',
                      hint: "Eg. iOS Developer",
                      controller: jobPostCont.designationTextCont)
                  .paddingOnly(bottom: 20.h),
              CustomTF(
                      lable: 'Job Description',
                      hint: "Enter job description",
                      controller: jobPostCont.jdTextCont)
                  .paddingOnly(bottom: 20.h),
              CustomTF(
                      lable: "Salary",
                      hint: "Eg. 20 LPA",
                      controller: jobPostCont.salaryTextCont)
                  .paddingOnly(bottom: 20.h),
              CustomTF(
                      lable: "Location",
                      hint: "Eg. Mumbai",
                      controller: jobPostCont.locationTextCont)
                  .paddingOnly(bottom: 20.h),
              CustomTF(
                      lable: "Skills",
                      hint: "Eg. Swift, iOS, Flutter",
                      controller: jobPostCont.skillsTextCont)
                  .paddingOnly(bottom: 20.h),
              CustomTF(
                      lable: "Number of Openings",
                      hint: "Eg. 2",
                      keyboardType: TextInputType.number,
                      controller: jobPostCont.openingsTextCont)
                  .paddingOnly(bottom: 20.h),
              Center(
                child: CommonWidget.roundedButton(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 40.h),
                    context: context,
                    title: "Create",
                    onTap: () {
                      // CommonWidget.goTo(context, const SkillDetailsScreen());
                      jobPostCont.createJob();
                    }),
              ).paddingOnly(bottom: 15.h)
            ],
          ).paddingSymmetric(horizontal: 15.h, vertical: 5.h),
        ));
  }
}
