import 'package:get/get.dart';
import 'package:hire_app/models/get_emp_detail_model.dart';
import 'package:hire_app/service/dio_client.dart';

import '../service/end_points.dart';
import '../service/response_handler.dart';

class ProfileScreenController extends GetxController {
  var isLoading = false.obs;
  GetEmployeeDetailModel? getEmployeeDetailModel;

  getEmpDetail() async {
    isLoading.value = true;
    var res = await DioClient().get(EndPoints.getemployeeDetails);
    getEmployeeDetailModel = jsonToObject(res, getEmployeeDetailModelFromJson);
    isLoading.value = false;
  }
}
