import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/common_widget.dart';
import '../utils/custom_text.dart';
import 'main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
        decoration: CommonWidget.containerDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.title(text: "Flutter Developer"),
            CustomText.subTitle(text: "ABC Technology")
                .paddingOnly(bottom: 4.h),
            const LabelledIcon(
                label: "Navi Mumbai", icon: Icons.location_on_outlined),
            const LabelledIcon(label: "1-3 Yrs", icon: Icons.work_outline),
            const LabelledIcon(
                    label: "5-12 LPA", icon: Icons.currency_rupee_outlined)
                .paddingOnly(bottom: 4.h),
            CustomText.subTitle(
                text: "flutter, dart, andriod, ios, mobile, sqlite"),
          ],
        ),
      ).paddingSymmetric(horizontal: 15.h, vertical: 5.h),
    );
  }
}
