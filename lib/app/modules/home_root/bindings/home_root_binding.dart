import 'package:get/get.dart';

import '../controllers/home_root_controller.dart';

class HomeRootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRootController>(
      () => HomeRootController(),
    );
  }
}
