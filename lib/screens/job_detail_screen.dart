import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_app/controllers/job_detail_controller.dart';
import 'package:hire_app/models/get_job_model.dart';
import 'package:hire_app/utils/app_theme.dart';
import 'package:hire_app/utils/common_widget.dart';
import 'package:hire_app/utils/custom_text.dart';
import 'package:hire_app/utils/extensions.dart';

import 'employment_details_screen.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key, required this.jobDetails});
  final JobDetails? jobDetails;
  @override
  Widget build(BuildContext context) {
    final detailcont = Get.put(JobDetailController());
    return Scaffold(
      appBar: CommonWidget.appBar(title: ""),
      body: Column(
        children: [
          Expanded(child: detailBody()),
          CommonWidget.roundedButton(
              context: context,
              title: "Apply",
              onTap: () {
                detailcont.applyforJob(jobId: jobDetails?.jpId ?? 0);
              }).paddingSymmetric(vertical: 10.h)
        ],
      ),
    );
  }

  Widget detailBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          jobHeader(),
          //About job detail
          aboutJob(),
          skillDetailsWidgetList(),
          jobDescription(),
        ],
      ).paddingSymmetric(horizontal: 15.h, vertical: 20.h),
    );
  }

  jobDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.title(text: "Job Description", size: 16, isBold: true),
        SizedBox(height: 10.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.h),
              border: Border.all(
                color: AppTheme.secondaryTextColor.withOpacity(0.3),
                width: 1,
              )),
          child: CustomText.title(
              text: jobDetails?.jpDescription ?? "-",
              overflow: TextOverflow.visible),
        ),
      ],
    ).paddingOnly(bottom: 15.h);
  }

  Widget skillDetailsWidgetList() {
    final periodList = [""];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
        ),
        CustomText.title(text: "Skills", size: 16, isBold: true),
        CustomActionChip(
          title: jobDetails?.skills ?? "",
          onPressed: (s) {},
          transform: 1,
        ),
        // Wrap(
        //     children: periodList
        //         .map((e) => CustomActionChip(title: e, onPressed: (s) {})
        //             .paddingSymmetric(horizontal: 0.h))
        //         .toList()),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }

  Column jobHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.all(6.h),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.08),
              border: Border.all(color: AppTheme.primaryTextColor, width: 1.5),
              borderRadius: BorderRadius.circular(10.r)),
          child: Image.asset(
            "assets/icons/icons8-building-100.png",
            height: 40.h,
            width: 40.h,
            color: AppTheme.primaryTextColor,
          ),
        ),
        SizedBox(height: 12.h),
        CustomText.title(
            text: jobDetails?.designation ?? "", size: 18, isBold: true),
        CustomText.title(
            text: jobDetails?.company ?? "",
            size: 14,
            color: AppTheme.tertiaryTextColor),
        SizedBox(height: 15.h),
      ],
    );
  }

  Column aboutJob() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.title(text: "About Job", size: 16, isBold: true),
        SizedBox(height: 10.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.h),
              border: Border.all(
                color: AppTheme.secondaryTextColor.withOpacity(0.3),
                width: 1,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.title(text: "Location", size: 12, isBold: true),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 14.h,
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  CustomText.title(
                      text: jobDetails?.location ?? "",
                      size: 14,
                      color: AppTheme.tertiaryTextColor),
                ],
              ).paddingOnly(bottom: 6.h),
              CustomText.title(text: "Salary", size: 12, isBold: true),
              Row(
                children: [
                  Icon(
                    Icons.currency_rupee,
                    size: 14.h,
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  CustomText.title(
                      text: jobDetails?.salary ?? "",
                      size: 14,
                      color: AppTheme.tertiaryTextColor),
                ],
              ).paddingOnly(bottom: 6.h),
              CustomText.title(
                  text: "Number of Openings", size: 12, isBold: true),
              Row(
                children: [
                  Icon(
                    Icons.people,
                    size: 14.h,
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  CustomText.title(
                      text: jobDetails?.noOfOpenings ?? "",
                      size: 14,
                      color: AppTheme.tertiaryTextColor),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
