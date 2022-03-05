import '../components/logo.dart';

import '../controllers/home_root_controller.dart';
import 'package:hive_project/common.dart';

class MobileDrawer extends GetView<HomeRootController> {
  final GetNavConfig? route;
  final void Function() afterNav;
  const MobileDrawer({
    Key? key,
    required this.route,
    required this.afterNav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: context.theme.colorScheme.surface,
        child: SizedBox(
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppUi.shared.h20,
                const Logo(),
                AppUi.shared.h20,
                ...controller.myButtons.map(
                  (item) {
                    final isSelected = item.isSelected?.call(route) ??
                        (controller.isRouteSelected(
                              item.route!,
                              route!,
                            ) ||
                            route!.location == '/');
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 20,
                      ),
                      child: InkWell(
                        onTap: () {
                          item.effectiveOnTap();
                          afterNav();
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: context.theme.colorScheme.surface,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(item.image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            AppUi.shared.w10,
                            Expanded(
                              child: AppText(
                                text: item.title,
                                fontSize: isSelected ? 25 : 20,
                                textAlign: TextAlign.start,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isSelected
                                    ? context.theme.colorScheme.primary
                                    : context.theme.colorScheme.onBackground,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const Divider(thickness: 0.4),
                const SwitchColor(),
                const Divider(thickness: 0.4),
                AppUi.shared.h10,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
