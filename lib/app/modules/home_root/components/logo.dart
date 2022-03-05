import 'package:hive_project/common.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.theme.colorScheme.primary,
        ),
        image: DecorationImage(
          image: AssetImage(
            AppUi.assets.logo,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
