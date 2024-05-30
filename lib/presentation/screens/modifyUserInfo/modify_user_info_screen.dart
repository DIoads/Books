import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ModifyUserInfoScreen extends StatelessWidget with CustomAppBar {
  final String name = "Modificar información";
  const ModifyUserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: appBarWithReturnButton(
            title: name, backgroundcolor: colors.onPrimary),
        body: const _ModifyUserInfoScreenView());
  }
}

class _ModifyUserInfoScreenView extends StatelessWidget {
  const _ModifyUserInfoScreenView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ModifyUserInfoForm(),
      ),
    );
  }
}
