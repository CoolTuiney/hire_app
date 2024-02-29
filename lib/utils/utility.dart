import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:hire_app/controllers/login_screen_controller.dart';
import 'package:intl/intl.dart';

import '../screens/login_screen.dart';
import '../service/shared_pref.dart';

class Utility {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return "Please enter your name";
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) return "Please enter password";
    if (value.length < 6) return "Password must be at least 6 characters long.";

    return null;
  }

  static String? validatePincode(String? value) {
    if (value == null || value.trim().isEmpty) return "Please enter pincode";
    if (value.length != 6) return "Invalid Pincode";
    return null;
  }

  static String? validateMobile(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter mobile number";
    }
    RegExp valueRegex = RegExp(r'^[789]\d{9}$');
    if (!valueRegex.hasMatch(value)) return "Invalid Mobile No.";

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return "Please enter email id";
    if (!GetUtils.isEmail(value)) return "Invalid Email";
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) return "Please enter address";
    return null;
  }

  static List<TextInputFormatter> inputFormattersAlphabet() {
    return [FilteringTextInputFormatter.allow(RegExp(r'[ a-zA-Z]+'))];
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

  static String formatDateTime(DateTime? dateTime, String format) {
    if (dateTime != null) {
      return DateFormat(format).format(dateTime);
    } else {
      return 'Invalid Date';
    }
  }

  static DateTime? convertStringToDateTime(String dateString) {
    try {
      // Parse the input string to a DateTime object
      DateTime parsedDate = DateFormat('MM-dd-yyyy').parseStrict(dateString);
      return parsedDate;
    } catch (e) {
      debugPrint('Error parsing date: $e');
      return null;
    }
  }
}
