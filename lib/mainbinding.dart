import 'package:hive_project/common.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InitServices());
    Get.put(DioHelperService());
  }
}
