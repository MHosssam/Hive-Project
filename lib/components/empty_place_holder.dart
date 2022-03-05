import 'package:hive_project/common.dart';

class EmptyPlaceHolder extends StatelessWidget {
  const EmptyPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                AppUi.assets.logo,
                fit: BoxFit.contain,
                width: 220,
                height: 220,
              ),
            ),
            const SizedBox(height: 50),
            AppText(
              text: 'Please Select The Page',
              color: context.theme.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ],
        ),
      ),
    );
  }
}
