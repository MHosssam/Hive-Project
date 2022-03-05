import 'package:hive_project/common.dart';

class DashboardButtons {
  final String title;
  final String? route;
  final String? image;
  final void Function()? onTap;
  final bool Function(GetNavConfig? currentRoute)? isSelected;
  void effectiveOnTap() {
    if (onTap == null && route != null) {
      Get.rootDelegate.toNamed(route!);
    } else {
      onTap!();
    }
  }

  DashboardButtons({
    required this.title,
    this.onTap,
    this.route,
    this.image,
    this.isSelected,
  });
}
