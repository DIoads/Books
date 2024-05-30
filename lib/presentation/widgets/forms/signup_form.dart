import 'package:book/presentation/providers/user_provider.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerStatefulWidget {
  /// Es un formulario customizado [ Form ] que extiende de un widget de tipo [ StatefulWidget ]
  const SignUpForm({super.key});

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends ConsumerState<SignUpForm> with Validators {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  String age = "";
  String email = "";
  String username = "";
  String password = "";

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
            CustomTextFormField(
              label: 'Correo Electrónico',
              onChanged: (_) {
                email = _;
              },
              validator: emailValidator,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              onChanged: (_) {
                password = _;
              },
              validator: passwordValidator,
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonalIcon(
                onPressed: () {
                  final isValid = _fromKey.currentState!.validate();
                  if (!isValid) return;
                  signUp(
                      age: age,
                      email: email,
                      username: username,
                      password: password,
                      userNotifier: userNotifier);
                },
                icon: const Icon(Icons.app_registration),
                label: const Text('Crear Cuenta')),
          ],
        ));
  }

  signUp(
      {required String age,
      required String email,
      required String username,
      required String password,
      required UserNotifier userNotifier}) async {
    _fromKey.currentState?.validate();
    await userNotifier.signUp(
        age: age,
        context: context,
        email: email,
        password: password,
        username: username);
  }
}
