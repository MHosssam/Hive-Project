import 'package:get/get.dart';

import '../controllers/hive_page_controller.dart';

class HivePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HivePageController>(
      () => HivePageController(),
    );
  }
}
