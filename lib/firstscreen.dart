import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spinner_brahma/Home.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Start a timer to navigate to the home screen after 3 seconds
    Timer(Duration(seconds: 3), () {
      // Use Navigator to navigate to the Home screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    });

    // Initialize animation controller and animation
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    // Start animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.green,
            ],
          ),
        ),
        child: Center(child: Text("Rummy YummY" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30 , color: Colors.black),)),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
