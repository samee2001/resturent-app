import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;
  

  const TextFields(
      {super.key,
      required this.hintText,
      required this.obsecureText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        hintText: hintText,
      
      ),
    );
  }
}
