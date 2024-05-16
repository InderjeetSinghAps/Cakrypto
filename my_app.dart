import 'package:cakrypto/screens/splash_screen.dart';
import 'package:cakrypto/singleton_classes/colors.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CaKrypto',
      theme: ThemeData(
        fontFamily: "poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.instance.yellowColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}