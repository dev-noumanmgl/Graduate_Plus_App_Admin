// Import necessary packages
import 'package:flutter/material.dart';
import 'dart:async'; // For using Timer
import 'package:graduate_plus_admin/utilities/appColors.dart';
import 'package:graduate_plus_admin/views/uploadStudentInfoScreenView.dart';

// Splash screen widget with state management
class SplashScreenView extends StatefulWidget {
  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    // Navigate to WelcomeScreenView after a 3-second delay
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => UploadStudentInfoScreenView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with dark blue color
          Container(color: darkBlue),

          // Centered animated logo inside a circular container
          Center(
            child: Container(
              width:
                  MediaQuery.of(context).size.width * 0.4, // Responsive width
              height:
                  MediaQuery.of(context).size.width * 0.4, // Responsive height
              decoration: BoxDecoration(
                color: Colors.white, // Circle background color
                shape: BoxShape.circle, // Circular shape
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/bcuLogo1.png', // Logo image
                  height:
                      MediaQuery.of(context).size.height *
                      0.15, // Responsive image height
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
