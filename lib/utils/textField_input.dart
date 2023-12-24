import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;

  const TextFieldInput({
    Key? key,
    required this.controller,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        textAlign: TextAlign.right,
        textAlignVertical: TextAlignVertical.bottom,
        keyboardType: textInputType,
        controller: controller,
        maxLines: 3,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
