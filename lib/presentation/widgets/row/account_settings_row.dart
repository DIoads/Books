import 'package:book/presentation/providers/user_provider.dart';
import 'package:book/presentation/widgets/buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountSettingsRow extends ConsumerWidget {
  const AccountSettingsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserNotifier userNotifier = ref.watch(userNotifierProvider.notifier);
    return Column(
      children: [
        Text('Ajustes de cuenta'),
        CustomButton(text: 'Actualizar datos', onpress: () {}),
        CustomButton(text: 'Eliminar cuenta', onpress: () {}),
        CustomButton(
            text: 'Cerrar sesión',
            onpress: () {
              userNotifier.logOut(context);
            }),
      ],
    );
  }
}
