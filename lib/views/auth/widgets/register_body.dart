import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social_app/view_models/register_auth.dart';
import 'package:social_app/views/auth/login_screen/login_screen.dart';
import 'package:social_app/views/auth/widgets/custom_button.dart';
import 'package:social_app/views/auth/widgets/custom_text_field.dart';
import 'package:social_app/views/auth/widgets/custom_title.dart';
import 'package:social_app/views/auth/widgets/logo.dart';
import 'package:social_app/views/auth/widgets/task_bar.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({
    super.key,
  });

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  TextEditingController displayCon = TextEditingController();
  TextEditingController userCon = TextEditingController();
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
              const Gap(15),
              CustomTextField(
                textEditingController: displayCon,
                hintText: 'Display name',
                icon: const Icon(Icons.person_pin_rounded),
              ),
              const Gap(10),
              CustomTextField(
                textEditingController: userCon,
                hintText: 'User name',
                icon: const Icon(Icons.person_outline_sharp),
              ),
              const Gap(10),
              CustomTextField(
                textEditingController: emailCon,
                hintText: 'Email',
                icon: const Icon(Icons.email_outlined),
              ),
              const Gap(10),
              CustomTextField(
                textEditingController: passwordCon,
                hintText: 'Password',
                obscureText: true,
                icon: const Icon(Icons.password_outlined),
              ),
              const Gap(25),
              CustomButton(
                  onPressed: () async {
                    await RegisterAuth().RegisterWithEmail(
                      emailAddress: emailCon.text,
                      password: passwordCon.text,
                      displayName: displayCon.text,
                      userName: userCon.text,
                      context: context,
                    );
                  },
                  text: 'Sign up'),
              const Taskbar(
                navigateTo: LoginScreen(),
                title: "Do you have an account?",
                task: 'Sign in now',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
