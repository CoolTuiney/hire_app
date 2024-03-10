import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_app/controllers/applied_job_controller.dart';
import 'package:hire_app/screens/applied_job_detail_screen.dart';
import 'package:hire_app/utils/common_widget.dart';

import '../utils/custom_text.dart';
import 'job_detail_screen.dart';
import 'main_screen.dart';

class AppliedJobScreen extends StatefulWidget {
  const AppliedJobScreen({super.key});

  @override
  State<AppliedJobScreen> createState() => _AppliedJobScreenState();
}

class _AppliedJobScreenState extends State<AppliedJobScreen> {
  var appliedCont = Get.put(AppliedJobController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await appliedCont.getappliedJobList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.appBar(title: "Applied Jobs"),
      body: Obx(
        () => (appliedCont.isLoading.value)
            ? CommonWidget.showLoader()
            : ListView.builder(
                itemCount: appliedCont.appliedJobModel?.data?.length ?? 0,
                // itemCount: 5,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                itemBuilder: (context, index) {
                  var job = appliedCont.appliedJobModel?.data?[index];
                  return GestureDetector(
                    onTap: () => Get.to(() => AppliedJobDetailScren(
                          jobDetails: job,
                        )),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.h, vertical: 10.h),
                      decoration: CommonWidget.containerDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.title(text: job?.designation ?? ""),
                          CustomText.subTitle(text: job?.company ?? "")
                              .paddingOnly(bottom: 4.h),
                          LabelledIcon(
                              label: job?.location ?? "",
                              icon: Icons.location_on_outlined),
                          LabelledIcon(
                              label: job?.skills ?? "",
                              icon: Icons.work_outline),
                          LabelledIcon(
                                  label: job?.salary ?? "",
                                  icon: Icons.currency_rupee_outlined)
                              .paddingOnly(bottom: 4.h),
                          CustomText.subTitle(
                              size: 14,
                              text:
                                  "No. of Application: ${job?.jobAppliedUsers?.length ?? 0}"),
                        ],
                      ),
                    ).paddingSymmetric(horizontal: 15.h, vertical: 5.h),
                  );
                },
              ),
      ),
    );
  }
}
