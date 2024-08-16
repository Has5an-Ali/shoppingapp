// ignore_for_file: file_names, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoppingapp/utils/appconstant.dart';

class customtextfield extends StatelessWidget {
  final String text;

  const customtextfield({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppConstant.appmaincolor)),
        ),
      ),
    );
  }
}
