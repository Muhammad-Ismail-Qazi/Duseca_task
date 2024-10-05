import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final bool obscureText;
  final IconButton? sufIcon;
  final IconButton? preIcon;

  final String? Function(String?)? validate;

  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.label,
    this.obscureText = false,
    this.sufIcon,
    this.validate,
    this.preIcon
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: sufIcon,
        prefixIcon: preIcon,
      ),
    );
  }
}