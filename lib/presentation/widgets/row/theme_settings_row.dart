import 'package:book/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ThemeSettingsRow extends ConsumerWidget {
  const ThemeSettingsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkmode = ref.watch(themeNotifierProvider).isDarkMode;

    return Column(
      children: [
        const Text('Ajustes de Tema'),
        IconButton(
            icon: const Icon(Icons.palette),
            onPressed: () {
              context.push('/themechanger');
            }),
        IconButton(
            icon: Icon(isDarkmode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            })
      ],
    );
  }
}
