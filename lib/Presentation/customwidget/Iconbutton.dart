// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Iconbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String path;
  const Iconbutton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.path});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        icon: Image.asset(path), onPressed: onPressed, label: Text(text));
  }
}
