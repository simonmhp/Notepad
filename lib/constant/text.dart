import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormate {
  final Color? colors;

  TextFormate( {required this.colors});


  TextStyle? textLargeFormate(BuildContext context) {
    return context.textTheme.titleLarge?.copyWith(
      color: colors ?? Colors.black,
    );
  }

  TextStyle? textMediumFormate(BuildContext context) {
    return context.textTheme.titleMedium?.copyWith(
      color: colors ?? Colors.black,
    );
  }

  TextStyle? textSmallFormate(BuildContext context) {
    return context.textTheme.titleSmall?.copyWith(
    );
  }
}