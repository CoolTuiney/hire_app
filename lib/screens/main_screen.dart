import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_app/controllers/%E1%B8%A5ome_screen_controller.dart';
import 'package:hire_app/controllers/profile_screen_controller.dart';
import 'package:hire_app/screens/home_screen.dart';
import 'package:hire_app/screens/profile_screen.dart';
import 'package:hire_app/utils/app_theme.dart';
import 'package:hire_app/utils/common_widget.dart';
import 'package:hire_app/utils/custom_text.dart';
import 'package:hire_app/utils/extensions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedIndex = 0;
  List<Widget> body = [const HomeScreen(), const ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeScreenController());
    final profileController = Get.put(ProfileScreenController());
    return Scaffold(
      appBar: CommonWidget.appBar(title: ""),
      body: body[selectedIndex],
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
