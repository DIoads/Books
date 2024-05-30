import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.displayText,
  });

  final String displayText;

  @override
  Widget build(BuildContext context) {
    return Text(displayText);
  }
}
