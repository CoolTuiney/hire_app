import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hire_app/screens/register_screen.dart';
import 'package:hire_app/screens/skill_details_screen.dart';
import 'package:hire_app/utils/app_theme.dart';
import 'package:hire_app/utils/common_widget.dart';
import 'package:hire_app/utils/extensions.dart';

import '../utils/custom_text.dart';

class EmploymentDetailsScreen extends StatefulWidget {
  const EmploymentDetailsScreen({super.key});

  @override
  State<EmploymentDetailsScreen> createState() =>
      _EmploymentDetailsScreenState();
}

class _EmploymentDetailsScreenState extends State<EmploymentDetailsScreen> {
  final periodList = [
    ChipsDetails(title: "15 days or less"),
    ChipsDetails(title: "1 Month"),
    ChipsDetails(title: "2 Month"),
    ChipsDetails(title: "3 Month"),
    ChipsDetails(title: "More than 3 Months"),
    ChipsDetails(title: "Serving notice period")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.appBar(title: ""),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.title(text: "Employment Details", size: 18, isBold: true)
                .paddingOnly(bottom: 5.h),
            CustomText.title(
              maxLine: 3,
              size: 12,
              color: AppTheme.secondaryTextColor,
              text:
                  'Unlock personalized job recommendations by sharing your employment details.',
            ).paddingOnly(
              bottom: 20.h,
            ),
            CustomText.title(text: 'Total Experience', isBold: true),
            Row(
              children: [
                SizedBox(
                    width: 80.h,
                    child: Row(
                      children: [
                        const Expanded(child: CustomTF(hint: "Eg. 1")),
                        CustomText.title(text: "years")
                      ],
                    )).paddingOnly(right: 20.h),
                Expanded(
                    child: Row(
                  children: [
                    SizedBox(
                        width: 50.h, child: const CustomTF(hint: "Eg. 10")),
                    CustomText.title(text: "months")
                  ],
                )),
              ],
            ).paddingOnly(bottom: 20.h),
            const CustomTF(hint: "Your company name").paddingOnly(bottom: 20.h),
            const CustomTF(hint: "Your job title").paddingOnly(bottom: 20.h),
            const CustomTF(hint: "Current salary").paddingOnly(bottom: 20.h),
            CustomText.title(text: 'Current work duration', isBold: true),
            Row(
              children: [
                Row(
                  children: [
                    CustomText.title(text: "From").paddingOnly(right: 10.h),
                    SizedBox(
                        width: 100.h,
                        child: const CustomTF(hint: "Eg. 10/01/2023")),
                  ],
                ).paddingOnly(right: 10.h),
                Row(
                  children: [
                    CustomText.title(text: "To").paddingOnly(right: 10.h),
                    SizedBox(
                        width: 100.h,
                        child: const CustomTF(hint: "Eg. Present")),
                  ],
                ),
              ],
            ).paddingOnly(bottom: 15.h),
            CustomText.title(text: 'Notice period', isBold: true)
                .paddingOnly(bottom: 5.h),
            noticePeriodWidgetList().paddingOnly(bottom: 20.h),
            Center(
              child: CommonWidget.roundedButton(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 40.h),
                  context: context,
                  title: "Next",
                  onTap: () {
                    CommonWidget.goTo(context, const SkillDetailsScreen());
                  }),
            ).paddingOnly(bottom: 15.h)
          ],
        ).paddingSymmetric(horizontal: 15.h, vertical: 5.h),
      ),
    );
  }

  Widget noticePeriodWidgetList() {
    return Wrap(
        children: periodList
            .map((e) => CustomActionChip(
                  title: e.title,
                  isSelected: e.isSelected,
                  onPressed: (p0) {
                    for (var e in periodList) {
                      e.isSelected = false;
                    }
                    e.isSelected = true;
                    setState(() {});
                  },
                ).paddingSymmetric(horizontal: 5.h))
            .toList());
  }
}

class ChipsDetails {
  String title;
  bool? isSelected;
  ChipsDetails({required this.title, this.isSelected});
}

class CustomActionChip extends StatelessWidget {
  const CustomActionChip({
    super.key,
    required this.title,
    this.isSelected,
    this.onPressed,
  });
  final String title;
  final bool? isSelected;
  final Function(bool)? onPressed;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      onSelected: onPressed,
      selectedColor: Colors.grey.shade200,
      side: const BorderSide(color: Colors.grey),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      labelStyle: const TextStyle(color: AppTheme.primaryTextColor),
      label: Text(title),
      selected: isSelected ?? false,
    );
  }
}
