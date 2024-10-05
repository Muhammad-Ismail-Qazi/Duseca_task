import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../services/firebase_auth_service.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final firebaseAuthenticationService = FirebaseAuthenticationService();

  RxBool isVisible = false.obs;

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        await firebaseAuthenticationService
            .login(usernameEmailController.text, passwordController.text);

        usernameEmailController.clear();
        passwordController.clear();
      } catch (e) {
        throw e.toString();
      }
    }
  }
}