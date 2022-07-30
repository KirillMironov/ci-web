import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
      ),
      validator: (value) => value!.isEmpty ? '$hintText cannot be empty' : null,
    );
  }
}
