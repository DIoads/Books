import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  final String name = "Home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material app',
      home: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: const Text('Knowledge Book'),
        ),
        body: const Center(
          child: Text('hola'),
        ),
      ),
    );
  }
}
/*
class HomeScreen extends StatelessWidget {
  final String name = "Home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("PANTALLA PRINCIPAL"),
    );
  }
}*/
/*
class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        appBar: AppBar(title: const Text('Menu de libros')),
        body: ListView.builder(
            itemCount: appMenuItems.length, itemBuilder: menuList),
        drawer: SideMenu(scaffoldKey: scaffoldKey));
  }

  Widget menuList(BuildContext context, int index) {
    final menuItem = appMenuItems[index];
    return _CustomListTitle(menuItem: menuItem);
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}
*/