import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

mixin AlertDialogs {
  cancelAlertDialog(BuildContext context) {
    // set up the buttons
    TextButton cancelButton = TextButton(
      child: const Text("Cancelar"),
      onPressed: () {
        context.pop();
      },
    );
    TextButton continueButton = TextButton(
      child: const Text("Continuar"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Alerta de confirmacion"),
      content: const Text(
          'Al confirmar se eliminaran los datos de la cuenta de manera permanente, presione continuar para confirmar.'),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
