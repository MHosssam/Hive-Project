import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hive_project/common.dart';

import 'mobile_drawer.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({Key? key}) : super(key: key);

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage>
    with SingleTickerProviderStateMixin {
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  late AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
    value: -1.0,
  );

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegete, route) {
        return ZoomDrawer(
          slideWidth: 200,
          showShadow: true,
          clipMainScreen: true,
          openCurve: Curves.fastOutSlowIn,
          controller: zoomDrawerController,
          duration: const Duration(milliseconds: 500),
          menuScreen: MobileDrawer(
            route: route,
            afterNav: () => zoomDrawerController.close!(),
          ),
          mainScreen: Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: AppText(
                text: route?.currentPage?.title,
                color: context.theme.colorScheme.onSecondary,
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.short_text,
                  color: context.theme.colorScheme.onSecondary,
                ),
                onPressed: () => zoomDrawerController.toggle!(),
              ),
            ),
            body: GetRouterOutlet.pickPages(
              pickPages: (currentNavStack) => currentNavStack.currentTreeBranch
                  .pickAfterRoute(Routes.HOME_ROOT),
              emptyWidget: (delegate) => const EmptyPlaceHolder(),
              key: Get.nestedKey(Routes.HOME_ROOT),
            ),
          ),
        );
      },
    );
  }
}
