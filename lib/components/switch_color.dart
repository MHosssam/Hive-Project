import 'package:hive_project/common.dart';
import 'package:switcher_button/switcher_button.dart';

class SwitchColor extends StatelessWidget {
  const SwitchColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObxValue<RxBool>(
      (val) {
        return SwitcherButton(
          size: 40,
          value: val.value,
          onColor: context.theme.colorScheme.secondary,
          offColor: context.theme.colorScheme.onBackground,
          onChange: (value) async {
            final themeValue = val.value = value;
            Get.changeThemeMode(themeValue ? ThemeMode.dark : ThemeMode.light);

            // await Get.find<CacheService>()
            //     .meta
            //     .setIsDark(themeValue, andUpdateApp: true);
          },
        );
      },
      false.obs,
    );
  }
}
