import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TNP Sign In',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      home: const TNPSignInScreen(),
    );
  }
}

class TNPSignInScreen extends StatefulWidget {
  const TNPSignInScreen({super.key});

  @override
  State<TNPSignInScreen> createState() => _TNPSignInScreenState();
}

class _TNPSignInScreenState extends State<TNPSignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  double _sheetHeight = 0.68;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final baseImageHeight = screenHeight * 0.36;

    // Calculate blur and gradient opacity based on sheet height
    double blurAmount = 0.0;
    double gradientOpacity = 0.0;

    // When sheet is at minimum (0.68), no blur or gradient
    // When sheet expands, gradually add blur and gradient
    if (_sheetHeight > 0.68) {
      double progress = (_sheetHeight - 0.68) / (1.05 - 0.68); // Updated to 1.05
      blurAmount = progress * 10; // Max blur of 10
      gradientOpacity = progress * 0.4; // Max opacity of 0.4
    }

    // Calculate container position from bottom
    final containerHeight = screenHeight * _sheetHeight;

    return Scaffold(
      body: Stack(
        children: [
          // Top image header with blur animation
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: baseImageHeight,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/customer_log_in.png',
                  fit: BoxFit.cover,
                  width: screenWidth,
                  height: baseImageHeight,
                ),
                // Blur overlay - only shown when sheet is expanded
                if (blurAmount > 0)
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: blurAmount,
                      sigmaY: blurAmount,
                    ),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
              ],
            ),
          ),
          // Gradient overlay - only shown when sheet is expanded
          if (gradientOpacity > 0)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: baseImageHeight,
              child: Opacity(
                opacity: gradientOpacity,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.4),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
          // Draggable login container
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                setState(() {
                  // Calculate new height based on drag
                  double delta = -details.delta.dy / screenHeight;
                  _sheetHeight = (_sheetHeight + delta).clamp(0.68, 1.05); // Updated max to 1.05
                });
              },
              onVerticalDragEnd: (details) {
                setState(() {
                  // Auto-expand when crossing 80%
                  if (_sheetHeight > 0.80) {
                    _sheetHeight = 1.05; // Updated to 1.05
                  } else if (_sheetHeight < 0.74) {
                    _sheetHeight = 0.68;
                  }
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: containerHeight,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: _sheetHeight >= 1.0
                      ? BorderRadius.zero // No radius when at or above 100%
                      : const BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    // Drag handle area (non-scrollable)
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                'Sign in to TNP',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text('Email', style: TextStyle(fontSize: 14)),
                              const SizedBox(height: 8),
                              TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text('Password', style: TextStyle(fontSize: 14)),
                              const SizedBox(height: 8),
                              TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Enter your password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
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
                                          value: rememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              rememberMe = value ?? false;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Text('Remember Me'),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: const Size(0, 0),
                                    ),
                                    child: const Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        color: Color(0xFFB8A574),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2C4A3B),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Create Account',
                                  style: TextStyle(
                                    color: Color(0xFF2C4A3B),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              _buildSocialButton(
                                icon: 'G',
                                text: 'Continue with Google',
                                backgroundColor: const Color(0xFFF5F5F5),
                                textColor: Colors.black87,
                              ),
                              const SizedBox(height: 12),
                              _buildSocialButton(
                                icon: '',
                                text: 'Continue with Apple',
                                backgroundColor: const Color(0xFFF5F5F5),
                                textColor: Colors.black87,
                              ),
                              const SizedBox(height: 12),
                              _buildSocialButton(
                                icon: 'f',
                                text: 'Continue with Facebook',
                                backgroundColor: const Color(0xFFF5F5F5),
                                textColor: Colors.black87,
                                iconColor: const Color(0xFF1877F2),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required String icon,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    Color? iconColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon.isNotEmpty)
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: iconColor ?? Colors.white,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      icon,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: iconColor != null ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                if (icon.isNotEmpty) const SizedBox(width: 10),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 15,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


