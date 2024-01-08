import 'package:flutter/material.dart';

TextStyle stylish(double size, Color color){
  TextStyle myStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: size,
      fontFamily: 'Roboto',
      color: color
  );
  return myStyle;
}
Color primColor = const Color(0xFF8B0000);
Color secColor = const Color(0xFFEEEEEE);
Color thirdColor = Colors.blue;