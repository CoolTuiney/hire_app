import 'package:get/get.dart';

import '../models/user_register_model.dart';
import '../service/dio_client.dart';
import '../service/end_points.dart';
import '../service/response_handler.dart';

class RegisterScreenController extends GetxController {
  var isLoading = false.obs;
  UserRegisterModel? userRegisterModel;

  
  getOrderSummary() async {
    isLoading.value = true;
    var arg = {
      "umId": 0,
      "fullName": "string",
      "emailId": "string",
      "password": "string",
      "mobileNumber": "string",
      "token": "string"
    };
    var res = await DioClient().get(EndPoints.userRegsiter, queryParam: arg);
    userRegisterModel =
        jsonToObject<UserRegisterModel>(res, userRegisterModelFromJson);
    isLoading.value = false;
  }
}
