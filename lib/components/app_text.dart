import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final bool isSelectable;
  final String? text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
  final int? maxLines;
  final TextAlign? textAlign;
  final List<Shadow>? shadows;
  final String? fontFamily;
  final TextOverflow? textOverFlow;
  final TextDecoration? decoration;

  const AppText({
    Key? key,
    this.isSelectable = false,
    required this.text,
    this.color,
    this.textOverFlow,
    this.fontWeight,
    this.fontSize = 20,
    this.height = 1.5,
    this.maxLines,
    this.textAlign = TextAlign.center,
    this.shadows,
    this.fontFamily = 'ElMessiri',
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = DefaultTextStyle.of(context).style.copyWith(
          decoration: decoration,
          shadows: shadows,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          height: height,
          overflow: textOverFlow,
          fontFamily: fontFamily,
        );
    if (isSelectable) {
      return SelectableText(
        text ?? '',
        style: style,
        textAlign: textAlign ?? TextAlign.start,
        // textDirection: TextDirection.rtl,
        maxLines: maxLines,
      );
    } else {
      return Text(
        text ?? '',
        style: style,
        textAlign: textAlign ?? TextAlign.start,
        // textDirection: TextDirection.rtl,
        maxLines: maxLines,
      );
    }
  }
}
