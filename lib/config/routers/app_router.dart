import 'package:book/config/routers/list_router.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/modifyUserInfo',
    routes: routes);
