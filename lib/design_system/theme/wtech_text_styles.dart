import 'package:flutter/material.dart';
import '../design_system.dart';
import 'wtech_colors.dart';

class WtechTextStyles {
  static const headline = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: WtechColors.textDarkGray,
  );

  static const bodyHeadLine = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: WtechColors.textDarkGray,
  );

  static const body = TextStyle(
    fontSize: 20,
    color: WtechColors.textCyan,
  );

  static const button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: WtechColors.textWhite,
  );
}