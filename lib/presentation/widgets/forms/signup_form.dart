import 'package:book/presentation/bloc/cubit/user_cubit.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  /// Es un formulario customizado [ Form ] que extiende de un widget de tipo [ StatefulWidget ]
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<SignUpForm> with Validators {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  String age = "";
  String email = "";
  String username = "";
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
                        signUp(age, email, username, password, UserCubit());
                      },
                      icon: const Icon(Icons.save),
                      label: const Text('Crear Cuenta')),
                ],
              ));
        },
      ),
    );
  }

  signUp(String age, String email, String username, String password,
      UserCubit userCubit) {
    _fromKey.currentState?.validate();
    userCubit.onSignUp(context, age, email, username, password);
  }
}
