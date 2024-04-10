import 'package:flutter/material.dart';

class CustomGestureDetector extends StatelessWidget {
  final String displayText;
  final bool isSigning;
  final VoidCallback onpress;
  const CustomGestureDetector(
      {super.key,
      required this.onpress,
      required this.isSigning,
      required this.displayText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onpress;
      },
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isSigning
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  displayText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
