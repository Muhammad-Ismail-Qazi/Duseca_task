import 'package:flutter/material.dart';

import '../modules/signup/controllers/signup_controller.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    SignupController signupController = SignupController();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        textStyle: const TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}