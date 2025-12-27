import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_noire_hub/views/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(           // <- Important: Use GetMaterialApp
      title: 'The Noire Hub(cx2)',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
