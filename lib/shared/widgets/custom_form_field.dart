// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?)?;

class CustomFormField extends StatelessWidget {
  final String? label;
  final String hint;
  final IconButton? suffix;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType textInputType;
  final int lines;
  final MyValidator validator;
  const CustomFormField(
      {super.key, this.label,
        required this.hint,
        this.isPassword = false,
        required this.controller,
        this.suffix,
        this.textInputType = TextInputType.text,
        this.lines = 1,
        required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          style: TextStyle(
            color: Colors.black
          ),
          /**
           * if You tapped outside , then close the Keyboard .
           */
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          obscureText: isPassword,
          controller: controller,
          keyboardType: textInputType,
          minLines: lines,
          maxLines: lines,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                // fontSize: 15
            ),
            border: InputBorder.none,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 15),
            labelText: label,
            suffixIcon: suffix,
          ),
        ),
      ),
    );
  }
}