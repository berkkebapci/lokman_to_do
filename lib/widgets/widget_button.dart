import 'package:flutter/material.dart';
import 'package:lokman_to_do/shared/uicolor.dart';
import 'widget_text.dart';

class ButtonBasic extends StatelessWidget {
  final String? buttonText;
  final Color? bgColor;
  final Color? textColor;
  final Function()? onTap;
  final int? flex;
  final double radius;
  final double? height;
  final double? padding;
  final Widget? prefixIcon;
  final double elevation;

  // ignore: use_key_in_widget_constructors
  const ButtonBasic(
      {this.buttonText,
      this.bgColor,
      this.textColor,
      this.onTap,
      this.flex,
      this.radius = 14,
      this.height,
      this.padding,
      this.prefixIcon,
      this.elevation = 0});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height ?? 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: UIColor.osloGray, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          margin: EdgeInsets.symmetric(horizontal: padding ?? 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (prefixIcon != null) prefixIcon!,
              Flexible(
                child: TextBasic(
                  text: buttonText ?? "",
                  color: textColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
