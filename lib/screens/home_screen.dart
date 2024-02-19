import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hire_app/utils/app_theme.dart';
import 'package:hire_app/utils/common_widget.dart';
import 'package:hire_app/utils/custom_text.dart';
import 'package:hire_app/utils/extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.appBar(title: ""),
      body: ListView.builder(
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

        
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        currentIndex: selectedIndex,
        selectedItemColor: AppTheme.lightPrimaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}

class LabelledIcon extends StatelessWidget {
  const LabelledIcon({super.key, required this.label, required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 14.h,
        ),
        SizedBox(width: 4.h),
        CustomText.subTitle(text: label, textAlign: TextAlign.center),
      ],
    ).paddingSymmetric(vertical: 2.h);
  }
}
