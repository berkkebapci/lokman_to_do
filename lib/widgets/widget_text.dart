// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lokman_to_do/shared/uicolor.dart';

class TextBasic extends StatelessWidget {
  String text;
  final Color? color;
  final double? fontSize;
  final double? lineHeight;
  final bool? underline;
  final TextAlign? textAlign;
  final int? maxLines;
  final FontWeight? fontWeight;

  TextBasic(
      {Key? key,
      required this.text,
      this.color,
      this.fontSize,
      this.lineHeight,
      this.underline = false,
      this.textAlign,
      this.maxLines,
      this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: maxLines ?? 999,
      textScaleFactor: 1.0,
      style: TextStyle(
        color: color ?? UIColor.darkGray,
        fontSize: fontSize,
        decoration: underline! ? TextDecoration.underline : null,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: lineHeight ?? 1.2,
      ),
    );
  }
}
