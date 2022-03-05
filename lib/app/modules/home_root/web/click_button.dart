import 'package:hive_project/common.dart';

class ClickButton extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String image;
  final void Function() onButtonTap;
  const ClickButton({
    Key? key,
    required this.isSelected,
    required this.onButtonTap,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonTap,
      hoverColor: AppUi.colors.apptransparent,
      child: Container(
        width: 50,
        height: 140,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(100),
            bottomStart: Radius.circular(100),
          ),
          color: isSelected
              ? context.theme.colorScheme.primary
              : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: context.theme.colorScheme.surface,
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AppText(
              text: title,
              color: isSelected
                  ? context.theme.colorScheme.onPrimary
                  : context.theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
