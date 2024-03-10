import 'dart:convert';

import 'package:get/get.dart';

import '../service/dio_client.dart';
import '../service/end_points.dart';
import '../service/response_handler.dart';
import '../utils/common_widget.dart';
import 'login_screen_controller.dart';

class JobDetailController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  applyforJob({required int jobId}) async {
    final loginCont = Get.find<LoginScreenController>();

    var header = {
      "p1": loginCont.userRegisterModel?.data?.umId,
      "p2": jobId,
      "p3": true,
    };

    var res = await CommonWidget.apiCallWithLoading(
        DioClient().post(EndPoints.jobapply, null, headers: header));
    if (res is DioResponse) {
      var map = jsonDecode(res.data);

      if (map['code'] == 1) {
        CommonWidget.showToast("Applied Successfully");
        Get.back();
      } else {
        CommonWidget.showToast(map['message'] ?? "Failed to apply");
      }
    }
  }
}
