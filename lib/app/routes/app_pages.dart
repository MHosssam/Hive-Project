import 'package:get/get.dart';

import '../modules/hive_page/bindings/hive_page_binding.dart';
import '../modules/hive_page/views/hive_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HIVE_PAGE,
      page: () => const HivePageView(),
      binding: HivePageBinding(),
    ),
  ];
}
