import 'package:flutter/material.dart';

extension ColorFromHexString on String {
  Color hexStringToColor() {
    return new Color(int.parse(this.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
