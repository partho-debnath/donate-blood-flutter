import 'dart:developer';

import 'package:get/get.dart';

import '/services/urls.dart';
import '../../models/donal_model_data.dart';
import '../../models/network_response.dart';
import '../../services/network_caller.dart';

class DonalListController extends GetxController {
  bool _isDonarDataInProgress = true;
  late DonarModelData _donarDataModel;

  bool get isDonarDataInProgress => _isDonarDataInProgress;
  DonarModelData get donarDataModel => _donarDataModel;

  Future<void> getDonarData() async {
    try {
      final NetworkResponse networkResponse =
          await NetworkCaller.getRequest(url: URL.donarUrl);

      _isDonarDataInProgress = false;
      update();

      if (networkResponse.statusCode == 200) {
        _donarDataModel = DonarModelData.fromJson(networkResponse.data ?? {});
      }
      _isDonarDataInProgress = false;
      update();
    } catch (e) {
      log('DonalListController Error: $e');
    }
  }
}
