import 'package:book/presentation/providers/user_provider.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget with CustomAppBar {
  final String name = "Home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;
    return SizedBox(
      height: height,
      width: width,
      child: Scaffold(
          appBar: appBarWithOutReturnButton(
              title: name, backgroundcolor: colors.onPrimary),
          body: const _HomeView()),
    );
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
  Widget build(BuildContext context) {
    final String? userName = ref.watch(userNotifierProvider).getUsername;
    final UserNotifier userNotifier = ref.watch(userNotifierProvider.notifier);

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.palette),
              onTap: () {
                context.push('/themechanger');
              },
            ),
            iconlessnlGestureDetector(() {
              logout(userNotifier: userNotifier, context: context);
            }, 'Log Out'),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          style: const TextStyle(fontSize: 20),
          '$userName',
          textAlign: TextAlign.right,
        ),
      ),
      body: const Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 40,
          ),
          ButtonsRow()
        ],
      )),
    );
  }

  logout({required BuildContext context, required UserNotifier userNotifier}) {
    userNotifier.logOut(context);
  }
}
