import 'package:book/presentation/providers/user_provider.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
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

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<_HomeView>
    with CustomGestureDetector {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? userName = ref.watch(userNotifierProvider).getUsername;
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
                '$userName',
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
            ButtonsRow(
              context: context,
            )
          ],
        )),
      ),
    );
  }

  logout({required BuildContext context, required UserNotifier userNotifier}) {
    userNotifier.logOut(context);
  }
}
