import 'package:flutter/material.dart';

ButtonStyle getTextButtonPrimaryStyle() {
  
  return TextButton.styleFrom(
    textStyle: const TextStyle(fontSize: 16),
    fixedSize: const Size(400, 50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
  );

}
