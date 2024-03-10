import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_app/utils/common_widget.dart';

import '../models/applied_job_model.dart';
import '../utils/app_theme.dart';
import '../utils/custom_text.dart';
import 'employment_details_screen.dart';

class AppliedJobDetailScren extends StatelessWidget {
  const AppliedJobDetailScren({super.key, this.jobDetails});

  final AppliedJobData? jobDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.appBar(title: ""),
      body: detailBody(),
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
          Divider(
            color: Colors.grey.withOpacity(0.5),
          ),
          jobAppliedUserList()
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

  jobAppliedUserList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
        ),
        CustomText.title(
            text:
                "Applied Users: ( ${jobDetails?.jobAppliedUsers?.length ?? 0} )",
            size: 16,
            isBold: true),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: jobDetails?.jobAppliedUsers?.length ?? 0,
          itemBuilder: (context, index) {
            var user = jobDetails!.jobAppliedUsers?[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.title(
                                text: "Name", size: 12, isBold: true),
                            CustomText.title(
                                    text: user?.fullName ?? "",
                                    size: 14,
                                    color: AppTheme.tertiaryTextColor)
                                .paddingOnly(bottom: 6.h),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.title(
                                text: "User Id", size: 12, isBold: true),
                            CustomText.title(
                                    text: "${user?.umId}",
                                    size: 14,
                                    color: AppTheme.tertiaryTextColor)
                                .paddingOnly(bottom: 6.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CustomText.title(text: "Mobile No.", size: 12, isBold: true),
                  CustomText.title(
                          text: user?.mobileNo ?? "",
                          size: 14,
                          color: AppTheme.tertiaryTextColor)
                      .paddingOnly(bottom: 6.h),
                  CustomText.title(text: "Email", size: 12, isBold: true),
                  CustomText.title(
                      text: user?.emailId ?? "",
                      size: 14,
                      color: AppTheme.tertiaryTextColor),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
