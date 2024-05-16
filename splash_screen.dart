import 'dart:async';

import 'package:cakrypto/model_classes/single_coin_details_model.dart';
import 'package:cakrypto/screens/coin_details_screen.dart';
import 'package:cakrypto/screens/onboarding_screen.dart';
import 'package:cakrypto/singleton_classes/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: Center(
          child: Container(
              height: 200,
              width: 200,
              child: Image.asset("assets/images/bitmanny_icon.png")
          )
      )
    );
  }
}
