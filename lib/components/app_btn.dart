import 'package:flutter/material.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final List<BoxShadow>? boxShadow;
  final Color? color, titleColor;
  final double? width, height, fontSize;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final AlignmentDirectional? alignment;
  final Clip? clip;

  const AppButton({
    Key? key,
    this.onTap,
    this.color,
    this.titleColor = Colors.white,
    required this.title,
    this.height,
    this.width,
    this.fontSize = 18.0,
    this.borderRadius,
    this.alignment,
    this.border,
    this.boxShadow,
    this.clip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Container(
      width: width,
      clipBehavior: clip ?? Clip.hardEdge,
      alignment: alignment,
      height: height ?? 40,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.primary,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        border: border,
        boxShadow: boxShadow,
      ),
      child: Center(
        child: AppText(
          isSelectable: false,
          text: title,
          fontSize: fontSize,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
          color: titleColor ?? Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: child,
      ),
    );
  }
}
