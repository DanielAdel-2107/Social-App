import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social_app/view_models/login_auth.dart';
import 'package:social_app/views/auth/register_screen/register_screen.dart';
import 'package:social_app/views/auth/widgets/custom_button.dart';
import 'package:social_app/views/auth/widgets/custom_text.dart';
import 'package:social_app/views/auth/widgets/custom_text_field.dart';
import 'package:social_app/views/auth/widgets/custom_title.dart';
import 'package:social_app/views/auth/widgets/logo.dart';
import 'package:social_app/views/auth/widgets/task_bar.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(),
              const Gap(10),
              const CustomTitle(),
              const Gap(10),
              const CustomText(
                text: 'Welcome Back',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const Gap(15),
              CustomTextField(
                textEditingController: emailCon,
                hintText: 'Email',
                icon: const Icon(Icons.email_outlined),
              ),
              const Gap(10),
              CustomTextField(
                hintText: 'Password',
                obscureText: true,
                textEditingController: passwordCon,
                icon: const Icon(Icons.password_outlined),
              ),
              const Gap(25),
              CustomButton(
                  onPressed: () {
                    LoginAuth().signWithEmail(
                        emailAddress: emailCon.text,
                        password: passwordCon.text,
                        context: context);
                  },
                  text: 'Sign in'),
              const Taskbar(
                navigateTo: RegisterScreen(),
                title: "Don't have an account?",
                task: 'Sign up now',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
