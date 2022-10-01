import 'package:flutter/material.dart';
import 'package:lokman_to_do/shared/uicolor.dart';
import 'package:lokman_to_do/shared/uisize.dart';

class LoginTextField extends StatelessWidget {
  final String? title;
  final String? label;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? requestFocus;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final int? maxLength;
  final int? maxLines;
  final double? fontSize;
  final double? hintSize;
  final bool? enabled;
  final double? radius;
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function? onChanged;

  // ignore: use_key_in_widget_constructors
  const LoginTextField({
    this.title,
    this.label,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.requestFocus,
    this.validator,
    this.fontSize,
    this.hintSize,
    this.controller,
    required this.obscureText,
    this.maxLength,
    this.maxLines,
    this.enabled,
    this.radius,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 54 * UISize.autoSize,
        child: TextFormField(
          enabled: enabled,
          cursorColor: UIColor.black,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onFieldSubmitted: (v) {
            if (requestFocus != null) {
              FocusScope.of(context).requestFocus(requestFocus);
            }
          },
          controller: controller,
          obscureText: obscureText,
          maxLines: maxLines ?? 1,
          validator: validator,
          style: TextStyle(
            color: UIColor.lokmanColor.withOpacity(.8),
            fontSize: fontSize ?? 14,
          ),
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: UIColor.lokmanColor.withOpacity(.8),
                fontSize: hintSize ?? 14,
              ),
              errorStyle: TextStyle(color: UIColor.red),
              fillColor: UIColor.transparent,
              filled: true,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: UIColor.lokmanColor)),
              labelText: label,
              labelStyle: const TextStyle(color: Colors.black54),
              focusColor: UIColor.lokmanColor,
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: UIColor.red),
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: UIColor.red))),
        ),
      ),
    );
  }
}
