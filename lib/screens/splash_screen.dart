import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_app/screens/register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.to(() => const RegisterScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
