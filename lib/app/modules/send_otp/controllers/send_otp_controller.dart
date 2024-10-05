import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../components/custom_button.dart';
import '../../../services/firebase_auth_service.dart';

class SendOtpController extends GetxController {
  final formKey = GlobalKey<FormState>();

  RxInt countdownTime = 10.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startCountdown();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdownTime.value > 0) {
        countdownTime--;
      } else {
        _timer?.cancel(); // Stop the timer when countdown reaches 0
      }
      update();
    });
  }

  bool isTimerEnded() {
    if(countdownTime.value == 0){
      return true;
    }
    return false;
  }

  // void resendOTP() {
  //   // Your logic to resend OTP (e.g., call sendOTP function)
  //   countdownTime = 60; // Reset countdown for resending
  // }

  final firstController = TextEditingController();
  final secondController = TextEditingController();
  final thirdController = TextEditingController();
  final fourthController = TextEditingController();

  final firebaseAuthenticationService = FirebaseAuthenticationService();

  Future<void> verifyOTP(BuildContext context) async {
    String otp = firstController.text +
        secondController.text +
        thirdController.text +
        fourthController.text;
    print(otp);
    try {
      firebaseAuthenticationService.verifyOTP(otp).then((value) {
        if (value == true) {
          Get.defaultDialog(
              barrierDismissible: false,
              confirm: CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    Get.toNamed('/choose-language');
                  }),
              title: 'Verification Successful',
              middleText: 'Your account is successfully verified ');
          firstController.clear();
          secondController.clear();
          thirdController.clear();
          fourthController.clear();
        } else {
          Get.snackbar('Fail', 'Wrong Otp');
          firstController.clear();
          secondController.clear();
          thirdController.clear();
          fourthController.clear();
        }
      });
    } catch (e) {
      throw e.toString();
    }
  }
}