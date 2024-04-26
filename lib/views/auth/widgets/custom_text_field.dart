import 'package:flutter/material.dart';
import 'package:social_app/constants/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.textEditingController,
    this.obscureText = false,
    this.maxLine = 1, this.color,
  });
  final String hintText;
  final bool obscureText;
  final Widget? icon;
  final TextEditingController? textEditingController;
  final int? maxLine;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
      controller: textEditingController,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: icon,
          fillColor:color?? kThirdColor,
          filled: true,
          border: buildBorder(BorderSide.none),
          focusedBorder: buildBorder(BorderSide(color: kPrimaryColor))),
    );
  }

  OutlineInputBorder buildBorder(BorderSide borderSide) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16), borderSide: borderSide);
  }
}
