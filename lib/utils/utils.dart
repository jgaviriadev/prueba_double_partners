import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showToast (context, color, txt){ 
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(txt)
      )
    );
  }
  static TextEditingController controllerDob (DateTime dob){ 
    return TextEditingController(text: "${dob.year}/${dob.month}/${dob.day}");
  }

  static const String textRandom = "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.";
  static const String textRandomLong = "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500.";
}