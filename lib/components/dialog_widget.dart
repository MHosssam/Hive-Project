import 'package:hive_project/common.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String? confirmText, cancelText;
  final void Function()? onConfirmTap;
  final void Function()? onCancelTap;
  final Widget child;
  final ScrollPhysics? physics;
  const AppDialog({
    Key? key,
    this.physics,
    required this.title,
    this.confirmText,
    this.cancelText,
    this.onConfirmTap,
    this.onCancelTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500, maxHeight: 500),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            width: Get.width / 2,
            child: SingleChildScrollView(
              physics: physics,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.primary,
                    ),
                    child: Center(
                      child: AppText(
                        text: title,
                        color: context.theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  child,
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            onTap: onCancelTap ?? () => Get.back(),
                            height: 40.0,
                            title: cancelText ?? 'Cancel',
                            titleColor: context.theme.colorScheme.onError,
                            color: context.theme.colorScheme.error,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: AppButton(
                            onTap: onConfirmTap,
                            height: 40.0,
                            title: confirmText ?? 'Confirm',
                            titleColor: context.theme.colorScheme.onPrimary,
                            color: context.theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
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
