import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_app/controllers/login_screen_controller.dart';
import 'package:hire_app/models/user_register_model.dart';
import 'package:hire_app/screens/job_post.dart';
import 'package:hire_app/screens/login_screen.dart';
import 'package:hire_app/screens/main_screen.dart';
import 'package:hire_app/screens/register_screen.dart';

import '../service/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var login = Get.put(LoginScreenController());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Get.off(() => const JobPostScreen());
      // var isLogin = await checkUserLogin();
      // if (isLogin) {
      //   Get.off(() => const MainScreen());
      // } else {
      //   Get.off(() => const LoginScreen());
      // }
    });
  }

  Future<bool> checkUserLogin() async {
    String? userString = await SharedPref.getString(SharedPref.userLogin);
    debugPrint(userString);
    if (userString != null) {
      var cont = Get.find<LoginScreenController>();
      login.userRegisterModel = userRegisterResModelFromJson(userString);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
