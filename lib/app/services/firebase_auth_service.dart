import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../constants/firebase.dart';
import 'auth_service.dart';

class FirebaseAuthenticationService implements AuthenticationService {
  // Implement login, signup, signOut, and user methods using Firebase Auth

  String? sentOTP = "123"; // Variable to store the sent OTP


  @override
  Future<bool> isAuthenticated() async {
    final currentUser = auth.currentUser;
    if (currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Alert', 'Please provide all the information');
    } else {
      try {
        await auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Get.snackbar('Success', 'login successful');
          Get.toNamed("/home");
        });
      } on FirebaseAuthException catch (error) {
        Get.snackbar('Error', error.toString());
      }
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signup(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Alert', 'Please provide all the information');
    } else {
      try {
        await auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Get.snackbar('Success', 'Registration successful');
          Get.toNamed("/send-otp");
        });
      } on FirebaseAuthException catch (error) {
        Get.snackbar('Error', error.toString());
      } catch (exception) {
        throw exception.toString();
      }
    }
  }

  @override
  // TODO: implement user
  Stream<User?> get user => throw UnimplementedError();

  @override
  Future<void> sendOTP(String email) async {
    if (email.isEmpty) {
      Get.toNamed('/signup');
    } else {
      try {
        EmailOTP.config(
          appName: 'Duseca Task',
          otpType: OTPType.numeric,
          expiry: 60000,
          emailTheme: EmailTheme.v6,
          appEmail: email,
          otpLength: 4,
        );

        final isSent = await EmailOTP.sendOTP(email: email); // Send the OTP
        if (isSent) {
          sentOTP = EmailOTP.getOTP();
          print("The Otp is :"+sentOTP.toString());
          Get.snackbar('Success', 'OTP sent successfully');
        } else {
          Get.snackbar('Error', 'Failed to send OTP');
        }
      } catch (exception) {
        Get.snackbar('Error', exception.toString());
        throw exception.toString();
      }
    }
  }

  @override
  Future<bool> verifyOTP(String otp) async {
    try {
      // Get the actual OTP from EmailOTP
      String? actualOTP = EmailOTP.getOTP();

      print("Successfully matched OTP from user $otp and system $actualOTP");

      if (otp != actualOTP) {
        print("OTP is not match");
        return false;
      }

      return true;
    } catch (exception) {
      throw exception.toString();
    }
  }
}