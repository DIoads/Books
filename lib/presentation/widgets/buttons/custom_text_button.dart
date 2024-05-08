import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const CustomTextButton(
      {required this.text, required this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text),
      onPressed: () {
        onPress.call();
      },
    );
  }
}
