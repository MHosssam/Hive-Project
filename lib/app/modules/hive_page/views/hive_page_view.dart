import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/common.dart';

import '../components/add_student_dialog.dart';
import '../controllers/hive_page_controller.dart';

class HivePageView extends GetView<HivePageController> {
  const HivePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.secondary,
      appBar: context.isPhone
          ? null
          : AppBar(
              centerTitle: true,
              title: const AppText(
                text: 'Hive',
                fontSize: 20,
              ),
            ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: AppText(
              fontSize: 22,
              text: 'Student List',
              color: context.theme.colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: Hive.box(studentBoxName).listenable(),
              builder: (context, Box<dynamic> studentBox, child) =>
                  ListView.builder(
                itemCount: studentBox.length,
                itemBuilder: (context, index) {
                  final student = controller.getStudentById(index);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      color: Colors.green,
                      child: ListTile(
                        title: AppText(
                          text: student.name,
                          color: Colors.white,
                          textAlign: TextAlign.start,
                        ),
                        subtitle: AppText(
                          text:
                              student.age.toString() + ' Years ' + student.bio,
                          color: Colors.white,
                          textAlign: TextAlign.start,
                        ),
                        leading: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => Get.dialog(
                            AddStudentDialog(
                              studentId: student.studentId,
                              studentIndex: index,
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: context.theme.colorScheme.error,
                          ),
                          onPressed: () => Get.dialog(
                            DeleteDialog(
                              onConfirmTap: () =>
                                  controller.deleteStudent(index),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppButton(
              title: 'Add Student in List',
              onTap: () => Get.dialog(
                const AddStudentDialog(
                  studentId: '_',
                  studentIndex: null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
