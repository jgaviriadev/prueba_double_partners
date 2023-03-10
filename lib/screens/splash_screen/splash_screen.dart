import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      context.go('/login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child:  Stack(
                children: const [
                  Positioned(
                    right: -120,
                    top: -80,
                    child: Circle(
                      size: 200,
                    )
                  ),
                ],
              )
            ),
            const Expanded(
              child: LogoWidget(),
            ),
            Expanded(
              child:  Stack(
                children: const [
                  Positioned(
                    left: -150,
                    bottom: -100,
                    child: Circle(
                      size: 300,
                    )
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}