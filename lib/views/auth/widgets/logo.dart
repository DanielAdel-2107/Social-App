import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app/constants/app_color.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/n_logo.svg',
      colorFilter: ColorFilter.mode(
        kPrimaryColor,
        BlendMode.srcIn,
      ),
      height: 150,
    );
  }
}
