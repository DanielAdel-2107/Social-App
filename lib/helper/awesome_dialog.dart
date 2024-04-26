import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog dialog({
  required BuildContext context,
  required String message,
  void Function()? btnOkOnPress,
  void Function()? btnCancelOnPress,
  String? btnOkText = 'Ok',
  String? btnCancelText = 'Cancel',
  DialogType dialogType = DialogType.error,
}) {
  return AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: dialogType,
    body: Center(
      child: Text(
        message,
        style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    ),
    title: dialogType.name,
    titleTextStyle: const TextStyle(
        fontStyle: FontStyle.italic, fontSize: 24, fontWeight: FontWeight.bold),
    btnCancelText: btnCancelText,
    btnOkText: btnOkText,
    btnOkOnPress: btnOkOnPress,
    btnCancelOnPress: btnCancelOnPress,
  )..show();
}
