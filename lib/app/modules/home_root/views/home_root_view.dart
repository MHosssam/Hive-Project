import 'package:hive_project/app/modules/home_root/mobile/mobile_page.dart';
import 'package:hive_project/common.dart';

import '../controllers/home_root_controller.dart';
import '../web/web_page.dart';

class HomeRootView extends GetResponsiveView<HomeRootController> {
  HomeRootView({Key? key}) : super(key: key);

  @override
  Widget? phone() {
    return const MobilePage();
  }

  @override
  Widget? desktop() {
    return const WebPage();
  }
}
