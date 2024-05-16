import 'package:cakrypto/helper_classes/button.dart';
import 'package:cakrypto/helper_classes/my_app_bar.dart';
import 'package:cakrypto/screens/bottom_navigation_screen.dart';
import 'package:cakrypto/screens/home_screen.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:flutter/material.dart';

import '../singleton_classes/colors.dart';

class VerifiedScreen extends StatefulWidget {
  const VerifiedScreen({super.key});

  @override
  State<VerifiedScreen> createState() => _VerifiedScreenState();
}

class _VerifiedScreenState extends State<VerifiedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/user_verified.png"),
                SizedBox(height: 30),
                Text(MyStrings.instance.youAreVerified, style: TextStyle(color: MyColors.instance.white, fontSize: 27, fontWeight: FontWeight.w600),),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(MyStrings.instance.youHaveBeenVerifiedYourInformationCompletely, style: TextStyle(color: MyColors.instance.textColor, fontSize: 13), textAlign: TextAlign.center,),
                ),
                SizedBox(height: 50),
                Container(
                  width: double.infinity,
                    child: MyButton(buttonText: MyStrings.instance.backToHome, onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationScreen()));
                    })
                )
              ],
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: MyAppBar(title: MyStrings.instance.emptyText,)
          )
        ],
      ),
    );
  }
}
