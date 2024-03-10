import 'package:get/get.dart';
import 'package:hire_app/models/get_job_model.dart';

import '../service/dio_client.dart';
import '../service/end_points.dart';
import '../service/response_handler.dart';

class HomeScreenController extends GetxController {
  GetJobModel? getJobModel;
  var isLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  getJobDetailList() async {
    // isLoading.value = true;
    var res = await DioClient().get(EndPoints.getjobPost);
    getJobModel = jsonToObject(res, getJobModelFromJson);
    isLoading.value = false;
  }
}
