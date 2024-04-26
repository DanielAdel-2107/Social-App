import 'package:flutter/material.dart';
import 'package:social_app/views/auth/widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterBody(),
    );
  }
}