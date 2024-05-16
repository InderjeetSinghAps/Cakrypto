import 'package:cakrypto/helper_classes/my_app_bar.dart';
import 'package:cakrypto/screens/change_password_screen.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:flutter/material.dart';

import '../singleton_classes/colors.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {

  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: Column(
        children: [
          MyAppBar(title: MyStrings.instance.profileSetting),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(MyStrings.instance.name, style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.w600),),
                      Row(
                        children: [
                          Text(MyStrings.instance.karanGoyal, style: TextStyle(color: MyColors.instance.hintTextColor),),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_ios_outlined, color: MyColors.instance.hintTextColor, size: 17,)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  height: 0.6,
                  color: MyColors.instance.hintTextColor,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(MyStrings.instance.changePassword, style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.w600),),
                        Icon(Icons.arrow_forward_ios_outlined, color: MyColors.instance.hintTextColor, size: 17,)
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  height: 0.6,
                  color: MyColors.instance.hintTextColor,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(MyStrings.instance.email, style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.w600),),
                      Row(
                        children: [
                          Text(MyStrings.instance.karanMail, style: TextStyle(color: MyColors.instance.hintTextColor),),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_ios_outlined, color: MyColors.instance.hintTextColor, size: 17,)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  height: 0.6,
                  color: MyColors.instance.hintTextColor,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(MyStrings.instance.language, style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.w600),),
                      Row(
                        children: [
                          Text(MyStrings.instance.english, style: TextStyle(color: MyColors.instance.hintTextColor),),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_ios_outlined, color: MyColors.instance.hintTextColor, size: 17,)
                        ],
                      )                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  height: 0.6,
                  color: MyColors.instance.hintTextColor,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(MyStrings.instance.faceId, style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.w600),),
                      Container(
                        // color: Colors.red,
                        child: Switch(
                          value: isSwitched,
                          activeColor: MyColors.instance.white,
                          activeTrackColor: MyColors.instance.yellowColor,
                          onChanged: (value){
                            isSwitched = value;
                            setState(() {
                            });
                          },),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
