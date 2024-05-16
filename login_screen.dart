import 'package:cakrypto/helper_classes/button.dart';
import 'package:cakrypto/helper_classes/textfield.dart';
import 'package:cakrypto/screens/bottom_navigation_screen.dart';
import 'package:cakrypto/screens/forgot_password_screen.dart';
import 'package:cakrypto/screens/sign_up_screen.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../helper_classes/my_app_bar.dart';
import '../helper_classes/passwordTextField.dart';
import '../singleton_classes/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body:Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyAppBar(title: MyStrings.instance.logIn),
                  SizedBox(height: 40),
                  Text(MyStrings.instance.emailAddress, style: TextStyle(color: MyColors.instance.textColor),),
                  SizedBox(height: 10),
                  MyTextField(hintText: MyStrings.instance.enterYourEmailAddress,  errorText: MyStrings.instance.pleaseEnterYourMail, controller: emailController),
                  SizedBox(height: 20),
                  Text(MyStrings.instance.password, style: TextStyle(color: MyColors.instance.textColor)),
                  SizedBox(height: 10),
                  MyPasswordTextField(hintText: MyStrings.instance.enterYourPassword, errorText: MyStrings.instance.pleaseEnterPassword, controller: passwordController),
                  SizedBox(height: 10),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                      },
                      child: Text(MyStrings.instance.forgotPasswordWithQestionMark, style: TextStyle(color: MyColors.instance.yellowColor))
                  ),
                  SizedBox(height: 60),
                  Container(
                    width: double.infinity,
                    child: MyButton(buttonText: MyStrings.instance.logIn, onTap: (){
                      if(key.currentState!.validate()){
                        if(emailController.text == "karangoyal646@gmail.com" && passwordController.text == "karan@123"){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationScreen()));
                        }
                      else{
                          Fluttertoast.showToast(msg: "Invalid Credentials!");
                        }

                      }
                    },),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(MyStrings.instance.newToCrypCoin, style: TextStyle(color: MyColors.instance.grey80)),
                  SizedBox(width: 5),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                      },
                      child: Text(MyStrings.instance.createAnAccount, style: TextStyle(color: MyColors.instance.yellowColor),)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
