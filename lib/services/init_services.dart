import 'package:hive_project/common.dart';

class InitServices extends GetxService {
  static InitServices get to => Get.find();

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  void onClose() {
    Hive.close();
    super.onClose();
  }
}
