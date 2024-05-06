import 'package:book/presentation/bloc/cubit/user_cubit.dart';
import 'package:book/presentation/providers/user_provider.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget with CustomAppBar {
  final String name = "Home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: appBarWithOutReturnButton(
            title: name, backgroundcolor: colors.onPrimary),
        body: BlocProvider(
          create: (context) => UserCubit(),
          child: const _HomeView(),
        ));
  }
}

class _HomeView extends ConsumerWidget with CustomGestureDetector {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? email = ref.watch(userNotifierProvider).getEmail;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'Bienvenido usuario $email, \n Esta pantalla esta en construccion!'),
          iconlessnlGestureDetector(() {
            logout(context, UserCubit());
          }, 'Log Out'),
        ],
      )),
    );
  }

  logout(BuildContext context, UserCubit userCubit) {
    userCubit.onLogOut(context);
  }
}
