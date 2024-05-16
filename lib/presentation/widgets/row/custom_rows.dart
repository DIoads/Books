import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    final size = (MediaQuery.of(context).size.width / 77);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(mainText),
        SizedBox(
          width: size,
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

class ButtonsRow extends StatelessWidget {
  final BuildContext context;

  const ButtonsRow({
    super.key,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: const Text('inicio'),
          onPressed: () {
            context.go('/home');
          },
        ),
        const SizedBox(
          width: 20,
        ),
        TextButton(
          child: const Text('Recomendaciones'),
          onPressed: () {
            context.go('/recommendations');
          },
        ),
        const SizedBox(
          width: 20,
        ),
        TextButton(
          child: const Text('Busqueda'),
          onPressed: () {
            // context.go('/search');
          },
        ),
      ],
    );
  }
}
