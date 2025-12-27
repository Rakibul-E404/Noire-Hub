import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInScreenController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var rememberMe = false.obs;
  var isLoading = false.obs;

  void toggleRememberMe(bool value) => rememberMe.value = value;

  Future<void> signIn() async {
    if (!_validateForm()) return;

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // simulate API

    // Demo success logic
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      Get.snackbar('Success', 'Logged in successfully!', backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      Get.snackbar('Error', 'Please enter valid credentials', backgroundColor: Colors.red, colorText: Colors.white);
    }
    isLoading.value = false;
  }

  void forgotPassword() {
    Get.defaultDialog(
      title: 'Forgot Password',
      content: const Text('Password reset feature coming soon!'),
      textConfirm: 'OK',
      onConfirm: () => Get.back(),
    );
  }

  void createAccount() {
    Get.snackbar('Info', 'Navigate to sign up screen', backgroundColor: Colors.blue, colorText: Colors.white);
  }

  void signInWithGoogle() => _simulateSocialSignIn('Google', Colors.blue);
  void signInWithApple() => _simulateSocialSignIn('Apple', Colors.black);
  void signInWithFacebook() => _simulateSocialSignIn('Facebook', Color(0xFF1877F2));

  void _simulateSocialSignIn(String provider, Color color) {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar('$provider Sign-In', '$provider authentication coming soon!', backgroundColor: color, colorText: Colors.white);
    });
  }

  bool _validateForm() {
    if (emailController.text.isEmpty) {
      Get.snackbar('Validation Error', 'Please enter your email', backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (passwordController.text.isEmpty) {
      Get.snackbar('Validation Error', 'Please enter your password', backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (!emailController.text.contains('@')) {
      Get.snackbar('Validation Error', 'Please enter a valid email', backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
