import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo or image goes here
            Image.asset(
              'assets/images/logo.png', // Replace this with your image asset path
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            // Loading indicator
            CircularProgressIndicator(
              color: Colors.white, // Color of the loading indicator
            ),
          ],
        ),
      ),
    );
  }
}

