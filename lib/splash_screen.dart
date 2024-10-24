import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';  // This will navigate to the home screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Define a Tween for the zoom effect (start smaller and grow)
    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller!, curve: Curves.easeInOut)
    );

    // Start the animation
    _controller!.forward();

    // Navigate to home screen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen())
      );
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash.png',  // Background image
              fit: BoxFit.cover,           // Ensure the image covers the screen
            ),
          ),

          // Centered logo with zoom animation
          Center(
            child: AnimatedBuilder(
              animation: _animation!,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation!.value, // Apply the zoom effect
                  child: Container(
                    width: 150,  // Set a fixed width for the image
                    height: 150, // Set a fixed height for the image
                    child: Image.asset('assets/images/logo.jpeg', fit: BoxFit.contain),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
