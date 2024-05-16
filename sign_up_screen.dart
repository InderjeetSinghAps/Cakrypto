import 'package:cakrypto/helper_classes/my_app_bar.dart';
import 'package:cakrypto/screens/login_screen.dart';
import 'package:cakrypto/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../helper_classes/button.dart';
import '../helper_classes/passwordTextField.dart';
import '../helper_classes/textfield.dart';
import '../singleton_classes/colors.dart';
import '../singleton_classes/strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final key = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyAppBar(title: MyStrings.instance.signUp),
                    const SizedBox(height: 40),
                    Text(MyStrings.instance.emailAddress, style: TextStyle(color: MyColors.instance.textColor),),
                    SizedBox(height: 10),
                    MyTextField(hintText: MyStrings.instance.enterYourEmailAddress,  errorText: MyStrings.instance.pleaseEnterYourMail, controller: emailController,),
                    SizedBox(height: 20),
                    Text(MyStrings.instance.password, style: TextStyle(color: MyColors.instance.textColor)),
                    SizedBox(height: 10),
                    MyPasswordTextField(hintText: MyStrings.instance.enterYourPassword, errorText: MyStrings.instance.pleaseEnterPassword, controller: passwordController),
                    SizedBox(height: 10),
                    Text(MyStrings.instance.atLeastEightCharacter, style: TextStyle(color: MyColors.instance.textColor, fontSize: 13)),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: SizedBox(
                              height: 40,
                              width: 20,
                              child: Checkbox(
                                  value: checkBoxValue,
                                  activeColor: MyColors.instance.yellowColor,
                                  checkColor: MyColors.instance.backgroundBlackColor,
                                  onChanged: (value){
                                    setState(() {
                                      checkBoxValue = value!;
                                    });
                                  }
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          RichText(text: TextSpan( style: TextStyle(fontSize: 17),
                            children: [
                              TextSpan(text: MyStrings.instance.accept, style: TextStyle(color: MyColors.instance.textColor)),
                              TextSpan(text: MyStrings.instance.termsOfUse, style: TextStyle(color: MyColors.instance.yellowColor)),
                              TextSpan(text: MyStrings.instance.andSign, style: TextStyle(color: MyColors.instance.textColor)),
                              TextSpan(text: MyStrings.instance.privacyPolicy, style: TextStyle(color: MyColors.instance.yellowColor)),
                            ]
                          ))
                        ],
                      ),
                    ),
                    SizedBox(height: 60),
                    Container(
                      width: double.infinity,
                      child: MyButton(buttonText: MyStrings.instance.signUp, onTap: (){
                        if(key.currentState!.validate()){
                          if(checkBoxValue == true){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationScreen()));
                          }
                          else{
                            Fluttertoast.showToast(msg: MyStrings.instance.acceptArgument);
                          }
                        }
                      },),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(MyStrings.instance.alreadyHaveAnAccount, style: TextStyle(color: MyColors.instance.grey80)),
                  SizedBox(width: 4),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: Text(MyStrings.instance.logInWithMark, style: TextStyle(color: MyColors.instance.yellowColor),)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
