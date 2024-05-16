import 'package:cakrypto/helper_classes/button.dart';
import 'package:cakrypto/helper_classes/my_app_bar.dart';
import 'package:cakrypto/helper_classes/textfield.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:flutter/material.dart';

import '../singleton_classes/colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(title: MyStrings.instance.changePassword),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text(MyStrings.instance.currentPassword, style: TextStyle(color: MyColors.instance.textColor)),
                  SizedBox(height: 10),
                  MyTextField(hintText: MyStrings.instance.enterYourCurrentPassword, errorText: MyStrings.instance.pleaseEnterYourCurrentPassword, controller: controller),
                  SizedBox(height: 20),
                  Text(MyStrings.instance.newPassword, style: TextStyle(color: MyColors.instance.textColor)),
                  SizedBox(height: 10),
                  MyTextField(hintText: MyStrings.instance.enterYourNewPassword, errorText: MyStrings.instance.pleaseEnterYourNewPassword, controller: controller),
                  SizedBox(height: 10),
                  Text(MyStrings.instance.atLeastEightCharacter, style: TextStyle(color: MyColors.instance.black73, fontSize: 13)),
                  SizedBox(height: 20),
                  Text(MyStrings.instance.confirmNewPassword, style: TextStyle(color: MyColors.instance.textColor)),
                  SizedBox(height: 10),
                  MyTextField(hintText: MyStrings.instance.repeatYourNewPassword, errorText: MyStrings.instance.pleaseRepeatYourNewPassword, controller: controller),
                ],
              ),
            ),
            SizedBox(height: 250),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: MyButton(buttonText: MyStrings.instance.changePassword, onTap: (){})
            )
          ],
        ),
      ),
    );
  }
}
