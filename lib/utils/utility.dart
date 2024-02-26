import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:hire_app/controllers/login_screen_controller.dart';

import '../screens/login_screen.dart';
import '../service/shared_pref.dart';

class Utility {
  static String? validateName(String? value, String hint) {
    if (value == null || value.trim().isEmpty) return "Please $hint";
    return null;
  }

  static String? validatePassword(String? value, String hint) {
    if (value == null || value.trim().isEmpty) return "Please $hint";
    if (value.length < 6) return "Password must be at least 6 characters long.";

    return null;
  }

  static String? validatePincode(String? value, String hint) {
    if (value == null || value.trim().isEmpty) return "Please $hint";
    if (value.length != 6) return "Invalid Pincode";
    return null;
  }

  static String? validateMobile(String? value, String hint) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter mobile numbers";
    }
    RegExp valueRegex = RegExp(r'^[789]\d{9}$');
    if (!valueRegex.hasMatch(value)) return "Invalid Mobile No.";

    return null;
  }

  static String? validateEmail(String? value, String hint) {
    if (value == null || value.trim().isEmpty) return "Please enter email id";
    if (!GetUtils.isEmail(value)) return "Invalid Email";
    return null;
  }

  static String? validateAddress(String? value, String hint) {
    if (value == null || value.trim().isEmpty) return "Please enter address";
    return null;
  }

  static List<TextInputFormatter> inputFormattersAlphabet() {
    return [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]+'))];
  }

  static List<TextInputFormatter> inputFormattersDigitOnly() {
    return [FilteringTextInputFormatter.allow(RegExp(r'[0-9]+'))];
  }

  static List<TextInputFormatter> inputFormattersAlphaNumeric() {
    return [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9./@ ]+'))];
  }

  static List<TextInputFormatter> inputFormattersNoSpace() {
    return [FilteringTextInputFormatter.deny(RegExp(r'^\s'))];
  }

  static logoutUser() async {
    Get.find<LoginScreenController>().deinit();
    SharedPref.removeString(SharedPref.userLogin);
    Get.off(() => const LoginScreen());
  }
  
}
