import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:prueba_double_partners/providers/d_p_provider.dart';
import 'package:prueba_double_partners/screens/screens.dart';

void main() {
  runApp(const MyApp());
}
final GoRouter _route = GoRouter(
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
    )
  ]
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DPProvider(),)
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _route,
        theme: ThemeData(
          primaryColor: const Color(0xFFD0EDF2),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme
          )
        ),
      ),
    );
  }
}