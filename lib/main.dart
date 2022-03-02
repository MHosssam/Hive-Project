import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';

import 'package:hive_project/common.dart';
import 'package:path_provider/path_provider.dart' as path;

import 'app/modules/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // if web
    await Hive.openBox(studentBoxName);
  } else {
    // if android or tablet
    final pathDoc = await path.getApplicationDocumentsDirectory();
    Hive.init(pathDoc.path);
    await Hive.openBox(studentBoxName);
  }
  // Hive.initFlutter('v10');

  Hive.registerAdapter(StudentAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      scrollBehavior: MyScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: "Hive Demo",
      localizationsDelegates: const [
        S.delegate,
        FormBuilderLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      builder: (context, child) {
        if (child == null) throw Exception("child can never be null");
        return FutureBuilder<void>(
          future: Get.find<InitServices>().init(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const SplashView();
            }
            return child;
          },
        );
      },
      initialBinding: MainBinding(),
      theme: AppUi.themes.lightTheme,
      darkTheme: AppUi.themes.darkTheme,
      getPages: AppPages.routes,
    );
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
