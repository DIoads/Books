import 'package:book/presentation/providers/user_provider.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountSettingsRow extends ConsumerWidget with AlertDialogs {
  const AccountSettingsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserNotifier userNotifier = ref.watch(userNotifierProvider.notifier);
    return Column(
      children: [
        const Text('Ajustes de cuenta'),
        CustomButton(
            text: 'Datos de cuenta',
            onpress: () {
              context.push('/userInfo');
            }),
        CustomButton(
            text: 'Eliminar cuenta',
            onpress: () {
              cancelAlertDialog(
                  context: context,
                  cancelAction: () => deleteAccount(userNotifier));
            }),
        CustomButton(
            text: 'Cerrar sesión',
            onpress: () {
              userNotifier.logOut(context);
            }),
      ],
    );
  }

  Future<void> deleteAccount(UserNotifier userNotifier) async {
    await userNotifier.delete();
  }
}
