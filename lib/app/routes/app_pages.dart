import 'package:get/get.dart';

import '../modules/hive_page/bindings/hive_page_binding.dart';
import '../modules/hive_page/views/hive_page_view.dart';
import '../modules/home_root/bindings/home_root_binding.dart';
import '../modules/home_root/views/home_root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      title: 'Home',
      name: _Paths.HOME_ROOT,
      page: () => HomeRootView(),
      binding: HomeRootBinding(),
      participatesInRootNavigator: true,
      children: [
        GetPage(
          title: 'Hive',
          name: _Paths.HIVE_PAGE,
          page: () => const HivePageView(),
          binding: HivePageBinding(),
        ),
      ],
    ),
  ];
}
