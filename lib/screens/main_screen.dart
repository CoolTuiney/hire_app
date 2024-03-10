import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_app/controllers/%E1%B8%A5ome_screen_controller.dart';
import 'package:hire_app/controllers/login_screen_controller.dart';
import 'package:hire_app/controllers/profile_screen_controller.dart';
import 'package:hire_app/screens/applied_jobs_screen.dart';
import 'package:hire_app/screens/home_screen.dart';
import 'package:hire_app/screens/job_post.dart';
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
  var loginCont = Get.find<LoginScreenController>();
  List<NavigationData> nav = [
    NavigationData(icon: Icons.home, page: const HomeScreen(), title: 'Home'),
    NavigationData(
        icon: Icons.person, page: const ProfileScreen(), title: 'Profile'),
  ];

  @override
  void initState() {
    super.initState();

    if (loginCont.userRegisterModel?.data?.isAdmin ?? false) {
      nav = [
        NavigationData(
            icon: Icons.home, page: const HomeScreen(), title: 'Home'),
        NavigationData(
            icon: Icons.create_new_folder_outlined,
            page: const JobPostScreen(),
            title: 'Create Job'),
        NavigationData(
            icon: Icons.work_outline,
            page: const AppliedJobScreen(),
            title: 'Applied Job'),
        NavigationData(
            icon: Icons.person, page: const ProfileScreen(), title: 'Profile'),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    Get.put(ProfileScreenController());

    return Scaffold(
      body: nav[selectedIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        items: nav
            .map(
              (e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.title),
            )
            .toList(),
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

class NavigationData {
  String title;
  IconData icon;
  Widget page;

  NavigationData({required this.icon, required this.page, required this.title});
}

class LabelledIcon extends StatelessWidget {
  const LabelledIcon(
      {super.key,
      required this.label,
      required this.icon,
      this.size,
      this.iconSize});
  final String label;
  final IconData icon;
  final double? size;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize ?? 14.h,
        ),
        SizedBox(width: 4.h),
        CustomText.subTitle(
            text: label, textAlign: TextAlign.center, size: size ?? 11),
      ],
    ).paddingSymmetric(vertical: 2.h);
  }
}
