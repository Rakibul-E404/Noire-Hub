import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_noire_hub/utils/app_colors.dart';

import '../../auth/log_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // Navigate using GetX
        Get.offAll(() =>  LogInScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image covering the entire screen
          SizedBox.expand(
            child: Image.asset(
              'assets/images/splash_image.png', // Your background image
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.black,
              ),
            ),
          ),

          // GIF in the center on top of the background
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   'TNP',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 96,
                //     fontFamily: 'Modak-Regular',
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
                // const SizedBox(height: 12,),
                // Text(
                //   'culture meets care',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 16,
                //     fontFamily: 'Inter',
                //     fontWeight: FontWeight.w800,
                //   ),
                // ),
                // const SizedBox(height: 12,),
                Image.asset(
                  'assets/icons/loading.gif', // Your GIF file
                  fit: BoxFit.contain,
                  height: 80, // Adjust height as needed
                  width: 80, // Adjust width as needed

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}