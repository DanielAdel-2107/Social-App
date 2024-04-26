import 'package:flutter/material.dart';
import 'package:social_app/constants/app_color.dart';
import 'package:social_app/views/auth/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kSecondColor,
            // fixedSize: Size(double.infinity, 50)),
          ),
          onPressed: onPressed,
          child: CustomText(
            text: text,
            fontSize: 20,
            color: kThirdColor,
          ),
        ),
      ),
    ]);
  }
}
