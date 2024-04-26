import 'package:flutter/material.dart';
import 'package:social_app/views/auth/widgets/custom_text.dart';
import 'package:social_app/views/auth/widgets/custom_text_button.dart';

class Taskbar extends StatelessWidget {
  const Taskbar({
    super.key,
    required this.title,
    required this.task, required this.navigateTo,
  });
  final String title;
  final String task;
  final Widget navigateTo;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        CustomTextButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return navigateTo;
              },
            ));
          },
          textButton: task,
        )
      ],
    );
  }
}
