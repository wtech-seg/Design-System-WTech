import 'package:flutter/material.dart';
import '../design_system.dart';
import 'wtech_colors.dart';

class WtechTextStyles {
  static const headline = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    color: WtechColors.textDarkGray,
  );

  static const body = TextStyle(
    fontSize: 16,
    color: WtechColors.textDarkGray,
  );

  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: WtechColors.textWhite,
  );
}