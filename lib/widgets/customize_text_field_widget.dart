import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class CustomizeTextFieldWidget extends StatelessWidget {
  const CustomizeTextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: pColorGrayPalette,
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: pColorGrayPalette,
            fontSize: 18,
            fontFamily: 'IRANSans',
            fontWeight: FontWeight.bold,
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
        style: const TextStyle(
          color: pColorGrayPalette,
          fontSize: 18,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
