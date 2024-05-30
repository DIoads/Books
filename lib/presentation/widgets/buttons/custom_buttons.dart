import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onpress});
  final String text;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: 200,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(colors.background)),
        onPressed: () {
          onpress.call();
        },
        child: Text(text),
      ),
    );
  }
}
