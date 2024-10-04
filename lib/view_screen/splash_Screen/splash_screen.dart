import 'dart:async'; // For handling timers and delays

import 'package:flutter/material.dart'; // Material UI components
import 'package:get/get.dart'; // State management
import 'package:flutter_screenutil/flutter_screenutil.dart'; // For responsive UI

import 'package:notepad/constant/colors.dart'; // Custom colors
import 'package:notepad/view_screen/home_screen/home_screen.dart'; // Home screen

// Stateful widget for the Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Initialize timer in the initState
  @override
  void initState() {
    super.initState();

    // Wait for 2 seconds and then navigate to the Home Screen
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Splash screen background color

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('asset/backG.jpg'), // Path to your background image
            fit: BoxFit.cover, // Ensures the image covers the entire background
          ),
        ),
        child: Center(
          child: Text(
            'Notepad App',
            style: context.textTheme.titleLarge?.copyWith(
                color: AppColor.blackall, // Custom text color
                fontSize: 40.sp, // Responsive font size
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
