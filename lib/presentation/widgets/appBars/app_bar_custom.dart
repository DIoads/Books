import 'package:flutter/material.dart';

mixin CustomAppBar {
  AppBar appBarWithOutReturnButton(
          {String title = 'no tiene Titulo', required backgroundcolor}) =>
      AppBar(
        backgroundColor: backgroundcolor,
        title: Center(child: Text(title)),
        automaticallyImplyLeading: false,
      );
  AppBar appBarWithReturnButton(
          {String title = 'no tiene Titulo', required backgroundcolor}) =>
      AppBar(
        backgroundColor: backgroundcolor,
        title: Center(child: Text(title)),
      );
}
