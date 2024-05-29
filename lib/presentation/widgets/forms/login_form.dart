import 'package:book/presentation/providers/user_provider.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogInForm extends ConsumerStatefulWidget {
  /// Es un formulario customizado [ Form ] que extiende de un widget de tipo [ StatefulWidget ]
  const LogInForm({super.key});

  @override
  LogInFormState createState() => LogInFormState();
}

class LogInFormState extends ConsumerState<LogInForm> with Validators {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final UserNotifier userNotifier = ref.watch(userNotifierProvider.notifier);

    return Form(
        key: _fromKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                onPressed: () async {
                  final isValid = _fromKey.currentState!.validate();
                  if (!isValid) return;

                  await logIn(
                      email: email,
                      password: password,
                      userNotifier: userNotifier);
                },
                icon: const Icon(Icons.login),
                label: const Text('Iniciar Sesion.')),
            CustomRows(
                mainText: "Don't have an account?",
                pressText: 'Sign Up',
                onpress: () => context.push('/signup'))
          ],
        ));
  }

  logIn(
      {required String email,
      required String password,
      required UserNotifier userNotifier}) async {
    _fromKey.currentState?.validate();
    await userNotifier.logIn(
        email: email, password: password, context: context);
  }
}
