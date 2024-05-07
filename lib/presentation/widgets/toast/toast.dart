import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String message, required double textSize}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 165, 10, 226),
      textColor: Colors.white,
      fontSize: textSize);
}
