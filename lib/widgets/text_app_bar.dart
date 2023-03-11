import 'package:flutter/material.dart';

class TextAppBar extends StatelessWidget {
  const TextAppBar({
    Key? key, 
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black
          ),
        ),
      ),
    );
  }
}