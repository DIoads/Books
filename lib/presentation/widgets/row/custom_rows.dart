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
  final VoidCallback goHome;
  final VoidCallback goRecommended;
  final VoidCallback goSearch;

  const ButtonsRow({
    super.key,
    required this.goHome,
    required this.goRecommended,
    required this.goSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: const Text('inicio'),
          onPressed: () {
            goHome.call();
          },
        ),
        const SizedBox(
          width: 20,
        ),
        TextButton(
          child: const Text('Recomendaciones'),
          onPressed: () {
            goRecommended.call();
          },
        ),
        const SizedBox(
          width: 20,
        ),
        TextButton(
          child: const Text('Busqueda'),
          onPressed: () {
            goSearch.call();
          },
        ),
      ],
    );
  }
}
