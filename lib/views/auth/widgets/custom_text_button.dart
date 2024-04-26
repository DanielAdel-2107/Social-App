import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.textButton,
    this.onPressed,
  });
  final void Function()? onPressed;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          textButton,
          style: TextStyle(
            // color: kPrimaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
