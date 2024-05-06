import 'package:book/presentation/bloc/cubit/user_cubit.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget with CustomAppBar {
  final String name = "Signup";
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: appBarWithReturnButton(
            title: name, backgroundcolor: colors.onPrimary),
        body: BlocProvider(
          create: (context) => UserCubit(),
          child: const _SignupView(),
        ));
  }
}

class _SignupView extends StatelessWidget {
  const _SignupView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SignUpForm(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
//  mario@gmail.com
//  123456