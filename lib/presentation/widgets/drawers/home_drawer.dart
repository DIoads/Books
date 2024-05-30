import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [AccountSettingsRow(), Divider(), ThemeSettingsRow()],
      ),
    );
  }
}