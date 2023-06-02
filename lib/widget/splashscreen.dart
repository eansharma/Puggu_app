import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pugau/Users/Controller/AuthController/login_controller.dart';
import 'package:pugau/util/theme/Pugau_images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Users/Auth/DashBoard.dart';
import '../Users/Auth/signup.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  // void initState()  {
  //   Timer(Duration(seconds: 2), () {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => SignUp(
  //             title: '',
  //           ),
  //         ));
  //   });
  //   // TO DO: implement initState
  //   super.initState();
  // }
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  void initState() {
    
    super.initState();
    loadData();
  }


  // Chekc is signup or not if sigup skip signup page
  void loadData() async {
    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');
    // Get.find<AuthController>().login_check();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => userid == null
              ? SignUp(
            title: '',
          )
              : Home(title: ""),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
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
