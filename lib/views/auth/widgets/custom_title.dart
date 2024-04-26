import 'package:flutter/material.dart';
import 'package:social_app/views/auth/widgets/custom_text.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomText(
          text: '06',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        CustomText(
          text: '16',
          fontSize: 26,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
