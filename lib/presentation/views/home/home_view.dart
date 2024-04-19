import 'package:book/domain/entities/user_entity.dart';
import 'package:book/presentation/providers/user_provider.dart';
import 'package:book/presentation/widgets/gesture/gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget with CustomGestureDetector {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser currentUser = ref.watch(userNotifierProvider);
    final String? eMail = currentUser.getEMail;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'Bienvenido usuario $eMail, \n Esta pantalla esta en construccion!'),
          iconlessnlGestureDetector(() {
            ref.watch(userNotifierProvider.notifier).logOut(context);
          }, 'Log Out'),
        ],
      )),
    );
  }
}
