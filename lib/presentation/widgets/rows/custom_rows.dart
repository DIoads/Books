import 'package:book/presentation/widgets/buttons/custom_text_button.dart';
import 'package:flutter/material.dart';

class AuthFormRow extends StatelessWidget {
  final String mainText;
  final String pressText;
  final VoidCallback onpress;
  const AuthFormRow(
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
              color: Color.fromARGB(255, 34, 140, 226),
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
        CustomTextButton(text: 'Inicio', onPress: goHome),
        const SizedBox(
          width: 20,
        ),
        CustomTextButton(text: 'Recomendacion', onPress: goRecommended),
        const SizedBox(
          width: 20,
        ),
        CustomTextButton(text: 'Busqueda', onPress: goSearch),
      ],
    );
  }
}
