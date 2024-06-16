import 'package:get/get.dart';

import '../presentation/state_holder/donar_list_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(DonalListController());
  }
}
