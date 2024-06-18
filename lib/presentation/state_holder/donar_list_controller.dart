import 'dart:developer';

import 'package:get/get.dart';

import '/services/urls.dart';
import '../../models/donar_model_data.dart';
import '../../models/network_response.dart';
import '../../services/network_caller.dart';

class DonarListController extends GetxController {
  bool _isDonarDataInProgress = true;
  DonarModelData? _donarDataModel;

  bool get isDonarDataInProgress => _isDonarDataInProgress;
  DonarModelData? get donarDataModel => _donarDataModel;

  Future<void> getDonarData() async {
    log('From DonarListController.');
    try {
      _isDonarDataInProgress = true;
      update();
      final NetworkResponse networkResponse =
          await NetworkCaller.getRequest(url: URL.donarUrl);

      _isDonarDataInProgress = false;
      update();
      print(networkResponse.statusCode);
      if (networkResponse.statusCode == 200) {
        _donarDataModel = DonarModelData.fromJson(networkResponse.data ?? {});
      } else if (networkResponse.statusCode == 401) {
        // * Authentication credentials were not provided.
        // ! Navigate to the Login Screen.
        print(networkResponse.message);
      } else if (networkResponse.statusCode == -200) {
        // * API caller failed.
      } else {
        _donarDataModel = DonarModelData.fromJson(networkResponse.data ?? {});
      }
    } catch (e) {
      log('DonarListController Error: $e');
    }
  }
}
