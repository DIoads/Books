import 'package:flutter/material.dart';

class CustomRows extends StatelessWidget {
  final String mainText;
  final String pressText;
  final VoidCallback onpress;
  const CustomRows(
      {super.key,
      required this.mainText,
      required this.pressText,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(mainText),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            onpress.call();
          },
          child: Text(
            pressText,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
