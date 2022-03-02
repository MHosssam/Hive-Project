import 'package:hive_project/common.dart';

class HivePageController extends GetxController {
  Student getStudentById(int index) {
    final studentBox = Hive.box(studentBoxName);
    var studentById = studentBox.getAt(index);
    return studentById;
  }

  Future<void> deleteStudent(int studentId) async {
    try {
      final contactsBox = Hive.box(studentBoxName);
      contactsBox.deleteAt(studentId);
      Get.back();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  void onClose() {
    super.onClose();
    Hive.box(studentBoxName).close();
  }
}
