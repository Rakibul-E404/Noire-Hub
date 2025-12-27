import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInScreenController extends GetxController {
  // Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Reactive state variables
  final rememberMe = false.obs;
  final isLoading = false.obs;

  // Toggle remember me
  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  // Sign in method
  Future<void> signIn() async {
    if (_validateForm()) {
      isLoading.value = true;
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Replace with your actual sign-in logic
      if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
        Get.snackbar(
          'Success',
          'Logged in successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        // Navigate to home screen or dashboard
        // Get.offAll(() => HomeScreen());
      } else {
        Get.snackbar(
          'Error',
          'Please enter valid credentials',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      isLoading.value = false;
    }
  }

  // Forgot password
  void forgotPassword() {
    Get.defaultDialog(
      title: 'Forgot Password',
      content: const Text('Password reset feature coming soon!'),
      textConfirm: 'OK',
      onConfirm: () => Get.back(),
    );
  }

  // Create account navigation
  void createAccount() {
    Get.snackbar(
      'Info',
      'Navigate to sign up screen',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
    // Get.to(() => SignUpScreen());
  }

  // Social sign-in methods
  void signInWithGoogle() {
    isLoading.value = true;
    // Simulate Google sign-in
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar(
        'Google Sign-In',
        'Google authentication coming soon!',
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    });
  }

  void signInWithApple() {
    isLoading.value = true;
    // Simulate Apple sign-in
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar(
        'Apple Sign-In',
        'Apple authentication coming soon!',
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );
    });
  }

  void signInWithFacebook() {
    isLoading.value = true;
    // Simulate Facebook sign-in
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar(
        'Facebook Sign-In',
        'Facebook authentication coming soon!',
        backgroundColor: Color(0xFF1877F2),
        colorText: Colors.white,
      );
    });
  }

  // Form validation
  bool _validateForm() {
    if (emailController.text.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Please enter your email',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    if (passwordController.text.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Please enter your password',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    if (!emailController.text.contains('@')) {
      Get.snackbar(
        'Validation Error',
        'Please enter a valid email',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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