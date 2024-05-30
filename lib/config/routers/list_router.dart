import 'package:book/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> routes = [
  GoRoute(
    path: '/',
    name: const SplashScreen().name,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/login',
    name: const LoginScreen().name,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/home',
    name: const HomeScreen().name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/signup',
    name: const SignupScreen().name,
    builder: (context, state) => const SignupScreen(),
  ),
  GoRoute(
    path: '/recomendacion',
    name: const Recomendation().name,
    builder: (context, state) => const Recomendation(),
  ),
  GoRoute(
    path: '/libro',
    name: const LibroScreen().name,
    builder: (context, state) => const LibroScreen(),
  ),
  GoRoute(
    path: '/userInfo',
    name: const UserInfoScreen().name,
    builder: (context, state) => const UserInfoScreen(),
  ),
  GoRoute(
    path: '/modifyUserInfo',
    name: const ModifyUserInfoScreen().name,
    builder: (context, state) => const ModifyUserInfoScreen(),
  ),
];
