import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationService {
  Future<void> signup(String email, String password);
  Future<void> login(String email, String password);
  Future<void> signOut();
  Future<bool> isAuthenticated();
  Future<void> sendOTP(String email);
  Future<void> verifyOTP(String otp);
  Stream<User?> get user; // Stream to observe user changes
}