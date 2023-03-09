import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({super.key, required this.size});

  final double size;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF00C0E4)
      ),
    );
  }
}