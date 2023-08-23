import 'package:flutter/material.dart';

class AppColors {
  static Color white = Colors.white;
  static Color lightBlack = Colors.black87;
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
