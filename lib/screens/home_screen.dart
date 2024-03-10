import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_app/controllers/%E1%B8%A5ome_screen_controller.dart';
import 'package:hire_app/screens/job_detail_screen.dart';

import '../utils/common_widget.dart';
import '../utils/custom_text.dart';
import 'main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.find<HomeScreenController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await homeController.getJobDetailList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.appBar(title: "Available Jobs"),
      body: Obx(
        () => (homeController.isLoading.value)
            ? CommonWidget.showLoader()
            : ListView.builder(
                itemCount: homeController.getJobModel?.data?.length ?? 0,
                // itemCount: 5,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                itemBuilder: (context, index) {
                  var jobDetail = homeController.getJobModel?.data?[index];
                  return GestureDetector(
                    onTap: () => Get.to(() => JobDetailScreen(
                          jobDetails: jobDetail,
                        )),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.h, vertical: 10.h),
                      decoration: CommonWidget.containerDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.title(
                              text: jobDetail?.designation ?? "",
                              isBold: true,
                              size: 14),
                          CustomText.subTitle(text: jobDetail?.company ?? "")
                              .paddingOnly(bottom: 6.h),
                          LabelledIcon(
                                  label: jobDetail?.location ?? "",
                                  icon: Icons.location_on_outlined)
                              .paddingOnly(bottom: 2.h),
                          LabelledIcon(
                                  label: jobDetail?.skills ?? "",
                                  icon: Icons.work_outline)
                              .paddingOnly(bottom: 2.h),
                          LabelledIcon(
                                  label: jobDetail?.salary ?? "",
                                  icon: Icons.currency_rupee_outlined)
                              .paddingOnly(bottom: 6.h),
                          // CustomText.subTitle(
                          //     text: jobDetail?.jpDescription ?? ""),
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
