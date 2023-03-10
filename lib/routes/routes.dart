import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

final GoRouter customRoutes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen()
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen()
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen()
    )
  ]
);