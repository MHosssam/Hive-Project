import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hive_project/common.dart';

import 'package:uuid/uuid.dart';

class AddStudentDialogController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final isLoading = false.obs;

  final int? studentIndex;
  final String studentId;
  bool get isAdd => studentId == '_';
  AddStudentDialogController({
    required this.studentId,
    required this.studentIndex,
  });

  final kName = 'name';
  final kAge = 'age';
  final kBio = 'bio';
  final initialValues = <String, dynamic>{};

  void getStudentById() {
    final studentBox = Hive.box(studentBoxName);
    Student student = studentBox.getAt(studentIndex!);
    initialValues[kName] = student.name;
    initialValues[kAge] = student.age.toString();
    initialValues[kBio] = student.bio;
  }

  void addData() async {
    final box = Hive.box(studentBoxName);
    final state = formKey.currentState;
    if (state == null || state.saveAndValidate() != true) return;
    final value = state.value;
    final std = Student(
      studentId: const Uuid().v1(),
      name: value[kName],
      age: value[kAge],
      bio: value[kBio],
    );
    box.add(std);
    Get.back();
  }

  void updateData() {
    final box = Hive.box(studentBoxName);
    final state = formKey.currentState;
    if (state == null || state.saveAndValidate() != true) return;
    final value = state.value;
    final std = Student(
      studentId: studentId,
      name: value[kName],
      age: value[kAge],
      bio: value[kBio],
    );
    box.putAt(studentIndex!, std);
    Get.back();
  }

  @override
  void onInit() {
    if (!isAdd) getStudentById();
    super.onInit();
  }
}

class AddStudentDialog extends StatelessWidget {
  const AddStudentDialog({
    Key? key,
    required this.studentId,
    required this.studentIndex,
  }) : super(key: key);

  final String studentId;
  final int? studentIndex;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddStudentDialogController>(
      init: AddStudentDialogController(
        studentId: studentId,
        studentIndex: studentIndex,
      ),
      builder: (controller) => AppDialog(
        title: controller.isAdd ? 'Add Student' : 'Update Student',
        onConfirmTap: () =>
            controller.isAdd ? controller.addData() : controller.updateData(),
        child: Obx(
          () => (controller.isLoading.value == true)
              ? const Center(child: CircularProgressIndicator())
              : FormBuilder(
                  key: controller.formKey,
                  initialValue: controller.initialValues,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppUi.shared.h10,
                        AppFormBuilderTextField(
                          name: controller.kName,
                          labelText: 'Student Name',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                          ]),
                        ),
                        AppUi.shared.h10,
                        AppFormBuilderTextField(
                          name: controller.kAge,
                          labelText: 'Age',
                          valueTransformer: (value) =>
                              value == null ? null : int.tryParse(value),
                          keyboardType: TextInputType.number,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.integer(context),
                          ]),
                        ),
                        AppUi.shared.h10,
                        AppFormBuilderTextField(
                          name: controller.kBio,
                          labelText: 'Bio',
                          maxLines: null,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
