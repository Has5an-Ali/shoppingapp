// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shoppingapp/utils/appconstant.dart';

class customtextfield extends StatelessWidget {
  final String text;
  final Icon? Prefixicon;
  final Icon? Suffixicon;

  const customtextfield({
    super.key,
    required this.text,
    this.Prefixicon,
    this.Suffixicon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        decoration: InputDecoration(
          suffix: Suffixicon,
          prefix: Prefixicon,
          hintText: text,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppConstant.appmaincolor)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppConstant.appmaincolor, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppConstant.appmaincolor, width: 2)),
        ),
      ),
    );
  }
}
