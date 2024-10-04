import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {
  static Color appbarcolor = const Color.fromARGB(255, 59, 59, 59);
  static Color bodycolor = const Color.fromARGB(255, 75, 75, 75)
      .withOpacity(0.8); // Soft light gray for body
  static Color addNbodycolor =
      const Color.fromARGB(255, 228, 232, 234); // Light gray for note screen
  static Color navigationbarcolor = const Color.fromARGB(
      255, 75, 75, 75); // Slightly lighter gray for the navigation bar
  static Color whiteall = Colors.white;
  static Color blackall = Colors.black;
  static const Color buttonColor =
      Color.fromARGB(255, 76, 175, 80); // A matching green for buttons
}
