import 'package:get/get.dart';
import 'package:hire_app/models/applied_job_model.dart';

import '../models/get_job_model.dart';
import '../service/dio_client.dart';
import '../service/end_points.dart';
import '../service/response_handler.dart';

class AppliedJobController extends GetxController {
  var isLoading = true.obs;
  AppliedJobModel? appliedJobModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getappliedJobList();
  }

  getappliedJobList() async {
    var res = await DioClient().get(EndPoints.getAppliedJob);
    appliedJobModel = jsonToObject(res, appliedJobModelFromJson);
    isLoading.value = false;
  }
}
