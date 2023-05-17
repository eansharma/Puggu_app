import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pugau/util/theme/Pugau_images.dart';

import '../Users/Auth/signup.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignUp(
              title: '',
            ),
          ));
    });
    // TO DO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Pugau_Images.Splash_Image),
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
