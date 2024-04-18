import 'package:book/domain/entities/user_entity.dart';
import 'package:book/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser currentUser = ref.watch(userNotifierProvider);
    final String? name = currentUser.getEMail;

    return Center(
      child: Text("Bienvenido $name\n Esta pantalla esta en construccion!"),
    );
  }
}
