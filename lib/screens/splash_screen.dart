import 'package:flutter/material.dart';
import 'package:prueba_double_partners/widgets/circle.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



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
            Expanded(
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
              ),
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