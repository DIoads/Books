import 'package:book/presentation/providers/user_provider.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModifyUserInfoForm extends ConsumerStatefulWidget {
  /// Es un formulario customizado [ Form ] que extiende de un widget de tipo [ StatefulWidget ]
  const ModifyUserInfoForm({super.key});

  @override
  ModifyUserInfoFormState createState() => ModifyUserInfoFormState();
}

class ModifyUserInfoFormState extends ConsumerState<ModifyUserInfoForm>
    with Validators {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  String age = "";
  String username = "";

  @override
  Widget build(BuildContext context) {
    final UserNotifier userNotifier = ref.watch(userNotifierProvider.notifier);

    return Form(
        key: _fromKey,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Nombre de Usuario',
              onChanged: (_) {
                username = _;
              },
              validator: userNameValidator,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Edad',
              onChanged: (_) {
                age = _;
              },
              validator: ageValidator,
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonalIcon(
                onPressed: () {
                  final isValid = _fromKey.currentState!.validate();
                  if (!isValid) return;
                  update(
                      age: age, username: username, userNotifier: userNotifier);
                },
                icon: const Icon(Icons.update),
                label: const Text('Actualizar Datos')),
          ],
        ));
  }

  update(
      {required String age,
      required String username,
      required UserNotifier userNotifier}) async {
    _fromKey.currentState?.validate();
    // await userNotifier.update(context: context, username: username, age: age);
  }
}
