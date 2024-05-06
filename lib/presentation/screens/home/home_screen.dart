import 'package:book/presentation/bloc/cubit/user_cubit.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> with CustomGestureDetector {
  late UserCubit userCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Bienvenido usuario ${UserCubit().state}, \n Esta pantalla esta en construccion!'),
                iconlessnlGestureDetector(() {
                  print(state.currentUser.email);
                  UserCubit().onLogOut(context);
                }, 'Log Out'),
              ],
            )),
          );
        },
      ),
    );
  }

  login(BuildContext context, username, String password, UserCubit userCubit) {
    userCubit.onLogIn(context, username, password);
  }
}
