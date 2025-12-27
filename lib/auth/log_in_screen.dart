import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_noire_hub/utils/app_colors.dart';
import 'controller/log_in_screen_controller.dart';
import 'package:the_noire_hub/widget/social_button.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  // Use Get.put here once for the entire app lifetime
  final LogInScreenController controller = Get.put(LogInScreenController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final baseImageHeight = screenHeight * 0.36;

    return Scaffold(
      body: Stack(
        children: [
          // Top image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: baseImageHeight,
            child: Image.asset(
              'assets/images/customer_log_in.png',
              fit: BoxFit.cover,
            ),
          ),

          // Gradient overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: baseImageHeight,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.1)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.7, 1.0],
                ),
              ),
            ),
          ),

          // Login container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight * 0.68,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Drag handle
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                  // Scrollable content
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            30, 20, 30, MediaQuery.of(context).viewInsets.bottom + 20),
                        child: Obx(
                              () => Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                'Sign in to TNP',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text('Email', style: TextStyle(fontSize: 14)),
                              const SizedBox(height: 8),
                              TextField(
                                controller: controller.emailController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text('Password', style: TextStyle(fontSize: 14)),
                              const SizedBox(height: 8),
                              TextField(
                                controller: controller.passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Enter your password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Checkbox(
                                          value: controller.rememberMe.value,
                                          onChanged: (bool? value) {
                                            controller.toggleRememberMe(value ?? false);
                                          },
                                          activeColor: AppColors.primaryColor,
                                          checkColor: AppColors.secondaryColor,
                                        )

                                      ),
                                      const SizedBox(width: 8),
                                      const Text('Remember Me'),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: controller.forgotPassword,
                                    child: const Text(
                                      'Forgot Password',
                                      style: TextStyle(color: Color(0xFFB8A574)),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: controller.isLoading.value ? null : controller.signIn,
                                child: controller.isLoading.value
                                    ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                )
                                    : const Text('Sign in'),
                              ),
                              const SizedBox(height: 10),
                              TextButton(
                                onPressed: controller.createAccount,
                                child: const Text('Create Account'),
                              ),
                              const SizedBox(height: 15),
                              buildSocialButton(
                                imageIconPath: 'assets/images/google_icon_image.png',
                                text: 'Continue with Google',
                                backgroundColor: AppColors.socialButtonColor,
                                textColor: AppColors.blackColor,
                                onPressed: controller.signInWithGoogle,
                              ),
                              const SizedBox(height: 12),
                              buildSocialButton(
                                imageIconPath: 'assets/images/apple_icon_image.png',
                                text: 'Continue with Apple',
                                backgroundColor: AppColors.socialButtonColor,
                                textColor: AppColors.blackColor,
                                onPressed: controller.signInWithApple,
                              ),
                              const SizedBox(height: 12),
                              buildSocialButton(
                                imageIconPath: 'assets/images/facebook_icon_image.png',
                                text: 'Continue with Facebook',
                                backgroundColor: AppColors.socialButtonColor,
                                textColor: AppColors.blackColor,
                                onPressed: controller.signInWithFacebook,
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
