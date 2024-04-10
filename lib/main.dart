import 'dart:io';

import 'package:book/config/routers/app_router.dart';
import 'package:book/config/theme/app_theme.dart';
import 'package:book/presentation/providers/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (Platform.isAndroid) {
    // Android-specific code
    // await Firebase.initializeApp(
    //     options: const FirebaseOptions(
    //         apiKey: 'AIzaSyAwKKRHhczuLCrYjmd91PlPdVutK8XhOGQ',
    //         appId: '1:669283823826:android:03e17aca9cb42b0deafd0b',
    //         messagingSenderId: '669283823826',
    //         projectId: 'books-bac44'));
  } else if (Platform.isIOS) {
    // iOS-specific code
  }

  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      theme: appTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
