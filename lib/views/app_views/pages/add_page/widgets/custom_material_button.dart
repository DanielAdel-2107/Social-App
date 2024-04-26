import 'package:flutter/material.dart';
import 'package:social_app/constants/app_color.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({super.key, this.onPressed, this.child});
  final void Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      padding: EdgeInsets.all(20),
      onPressed: onPressed,
      child: child,
    );
  }
}
