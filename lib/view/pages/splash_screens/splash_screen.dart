import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toxic_products/view/pages/home_page/home_page.dart';
import 'package:toxic_products/view/pages/splash_screens/login_or_signup.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginorSignUp()));
    });
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/pexelbggg.jpg",
              ),
              fit: BoxFit.cover)),
      child: const Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
