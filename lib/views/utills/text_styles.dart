import 'package:flutter/material.dart';

class CustomTextStyles {
  static TextStyle headingBoldTextStyle(Color color, double fontSize) {
    return TextStyle(fontFamily: 'bold', fontSize: fontSize, color: color);
  }

  static TextStyle contentRegularTextStyle(Color color, double fontSize) {
    return TextStyle(fontFamily: 'regular', fontSize: fontSize, color: color);
  }
}
