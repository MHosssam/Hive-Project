import 'package:hive_project/common.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    Key? key,
    required this.onConfirmTap,
  }) : super(key: key);

  final void Function()? onConfirmTap;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'Delete',
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: AppText(
          text: 'Delete Item',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onConfirmTap: onConfirmTap,
    );
  }
}
