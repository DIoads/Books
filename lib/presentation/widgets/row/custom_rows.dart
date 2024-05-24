import 'package:book/presentation/providers/overview_response_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class ButtonsRow extends ConsumerWidget {
  const ButtonsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responseNotifier =
        ref.watch(overviewResponseNotifierProvider.notifier);

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
          onPressed: () async {
            await responseLoad(responseNotifier);
            if (context.mounted) context.go('/recommendations');
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

  Future<void> responseLoad(OverviewResponseNotifier responseNotifier) async {
    await responseNotifier.initialLoad();
  }
}
