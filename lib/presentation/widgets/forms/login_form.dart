import 'package:book/presentation/bloc/cubit/user_cubit.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogInForm extends StatefulWidget {
  /// Es un formulario customizado [ Form ] que extiende de un widget de tipo [ StatefulWidget ]
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => LogInFormState();
}

class LogInFormState extends State<LogInForm> with Validators {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
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
                      onPressed: () {
                        final isValid = _fromKey.currentState!.validate();
                        if (!isValid) return;
                        login(context, email, password, UserCubit());
                      },
                      icon: const Icon(Icons.login),
                      label: const Text('Iniciar Sesion.')),
                  CustomRows(
                      mainText: "Don't have an account?",
                      pressText: 'Sign Up',
                      onpress: () => context.push('/signup'))
                ],
              ));
        },
      ),
    );
  }

  login(BuildContext context, username, String password, UserCubit userCubit) {
    _fromKey.currentState?.validate();
    userCubit.onLogIn(context, username, password);
  }
}
