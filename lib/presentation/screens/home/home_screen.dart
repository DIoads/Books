import 'package:book/presentation/providers/user_provider.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        body: const _HomeView());
  }
}

class _HomeView extends ConsumerWidget with CustomGestureDetector {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? email = ref.watch(userNotifierProvider).getEmail;
    final UserNotifier userNotifier = ref.watch(userNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                style: const TextStyle(fontSize: 20),
                '$email',
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            iconlessnlGestureDetector(() {
              logout(userNotifier: userNotifier, context: context);
            }, 'Log Out'),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Inicio'),
                SizedBox(
                  width: 20,
                ),
                Text('Recomendación'),
                SizedBox(
                  width: 20,
                ),
                Text('Busqueda')
              ],
            ),
          ],
        )),
      ),
    );
  }

  logout({required BuildContext context, required UserNotifier userNotifier}) {
    userNotifier.logOut(context);
  }
}
