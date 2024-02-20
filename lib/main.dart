// import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_app/screens/login_screen.dart';
import 'package:hire_app/screens/register_screen.dart';
import 'package:hire_app/screens/splash_screen.dart';
import 'package:hire_app/utils/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

// Alice alice = Alice(
//     showNotification: kDebugMode,
//     showShareButton: kDebugMode,
//     showInspectorOnShake: kDebugMode);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (context, child) => GetMaterialApp(
          // navigatorKey: alice.getNavigatorKey(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          initialRoute: '/',
          home: const RegisterScreen(),
          getPages: [
            GetPage(name: '/', page: () => const SplashScreen()),
            // GetPage(name: '/home', page: () => const HomeScreen()),
          ]),
    );
  }
}
