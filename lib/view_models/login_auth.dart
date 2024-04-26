// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/constants/constansts.dart';
import 'package:social_app/helper/awesome_dialog.dart';
import 'package:social_app/views/app_views/pages/home_page/pages/home_page.dart';

class LoginAuth {
  signWithEmail({
    required String emailAddress,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final credential = await kUserAuth
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) => dialog(
              context: context,
              message: 'Login Successful.',
              dialogType: DialogType.success));
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        dialog(
            context: context,
            message: 'No user found for that email.',
            dialogType: DialogType.warning);
      } else if (e.code == 'wrong-password') {
        dialog(
            context: context,
            message: 'Wrong password provided for that user.',
            dialogType: DialogType.warning);
      }
    }
  }
}
