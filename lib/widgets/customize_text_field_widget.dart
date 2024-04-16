import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class CustomizeTextFieldWidget extends StatelessWidget {
  const CustomizeTextFieldWidget({super.key, required this.controller, required this.labelText});

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: pColorGrayPalette,
          ),
          fillColor: pColorGrayPalette,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: pColorGrayPalette,
              width: 2.0,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: pColorGrayPalette,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
