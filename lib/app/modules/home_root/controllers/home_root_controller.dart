import 'package:hive_project/common.dart';

class HomeRootController extends GetxController {
  bool isRouteSelected(String route, GetNavConfig currentRoute) {
    return currentRoute.location?.endsWith(route) == true;
  }

  final myButtons = <DashboardButtons>[
    DashboardButtons(
      title: 'Hive',
      image: AppUi.assets.hive,
      route: Routes.HIVE_PAGE,
    ),
  ];
}
