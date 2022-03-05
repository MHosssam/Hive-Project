import 'package:hive_project/common.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.secondary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            AppUi.assets.logo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
