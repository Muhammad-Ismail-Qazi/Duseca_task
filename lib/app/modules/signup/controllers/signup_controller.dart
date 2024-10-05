import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../services/firebase_auth_service.dart';

class SignupController extends GetxController {
  TextEditingController usernameEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  final firebaseAuthenticationService = FirebaseAuthenticationService();

  final formKey = GlobalKey<FormState>();

  RxBool isVisible = false.obs;

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }

  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      try {
        await firebaseAuthenticationService
            .signup(usernameEmailController.text, passwordController.text)
            .then(
              (value) => firebaseAuthenticationService
                  .sendOTP(usernameEmailController.text),
            );
        usernameEmailController.clear();
        passwordController.clear();
        repeatPasswordController.clear();
      } catch (e) {
        throw e.toString();
      }
    }
  }
}