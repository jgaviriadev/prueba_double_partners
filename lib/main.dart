import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:prueba_double_partners/providers/dvp_provider.dart';

import 'routes/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DVPProvider(),)
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: customRoutes,
        theme: ThemeData(
          primaryColor: const Color(0xFF00C0E4),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme
          )
        ),
      ),
    );
  }
}