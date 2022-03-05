import 'click_button.dart';
import '../controllers/home_root_controller.dart';
import 'package:hive_project/common.dart';
import '../components/logo.dart';

class WebPage extends GetView<HomeRootController> {
  const WebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetRouterOutlet.builder(
        builder: (context, delegate, currentRoute) {
          return Scaffold(
            body: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      AppUi.shared.h20,
                      const Logo(),
                      AppUi.shared.h20,
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsetsDirectional.only(start: 8),
                          itemCount: controller.myButtons.length,
                          itemBuilder: (context, index) {
                            var item = controller.myButtons[index];
                            final isSelected =
                                item.isSelected?.call(currentRoute) ??
                                    controller.isRouteSelected(
                                      item.route!,
                                      currentRoute!,
                                    );
                            return ClickButton(
                              image: item.image!,
                              isSelected: isSelected,
                              onButtonTap: item.effectiveOnTap,
                              title: item.title,
                            );
                          },
                        ),
                      ),
                      const Divider(thickness: 0.4),
                      const SwitchColor(),
                      const Divider(thickness: 0.4),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.secondary,
                      borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(35),
                      ),
                    ),
                    child: GetRouterOutlet.pickPages(
                      pickPages: (currentNavStack) => currentNavStack
                          .currentTreeBranch
                          .pickAfterRoute(Routes.HOME_ROOT),
                      key: Get.nestedKey(Routes.HOME_ROOT),
                      emptyWidget: (delegate) => const EmptyPlaceHolder(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
