import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_app/controllers/%E1%B8%A5ome_screen_controller.dart';

import '../utils/common_widget.dart';
import '../utils/custom_text.dart';
import 'main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeScreenController>();
    return Obx(
      () => (homeController.isLoading.value)
          ? CommonWidget.showLoader()
          : ListView.builder(
              // itemCount: homeController.getJobModel?.data?.jobList?.length ?? 0,
              itemCount: 5,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              itemBuilder: (context, index) {
                var jobDetail =
                    homeController.getJobModel?.data?.jobList?[index];
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
                  decoration: CommonWidget.containerDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.title(text: jobDetail?.designation ?? ""),
                      CustomText.subTitle(text: jobDetail?.companyName ?? "")
                          .paddingOnly(bottom: 4.h),
                      LabelledIcon(
                          label: jobDetail?.locationName ?? "",
                          icon: Icons.location_on_outlined),
                      LabelledIcon(
                          label: jobDetail?.skills ?? "",
                          icon: Icons.work_outline),
                      LabelledIcon(
                              label: jobDetail?.salary ?? "",
                              icon: Icons.currency_rupee_outlined)
                          .paddingOnly(bottom: 4.h),
                      CustomText.subTitle(
                          text: jobDetail?.jobDescription ?? ""),
                    ],
                  ),
                ).paddingSymmetric(horizontal: 15.h, vertical: 5.h);
              },
            ),
    );
  }
}
