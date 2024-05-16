import 'dart:async';

import 'package:cakrypto/helper_classes/button.dart';
import 'package:cakrypto/helper_classes/my_app_bar.dart';
import 'package:cakrypto/screens/verify_choose_document_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../singleton_classes/colors.dart';
import '../singleton_classes/strings.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  int num = 60;
  bool isOtpFilled = false;
  TextEditingController controller = new TextEditingController();


  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if(num > 0){
        num-=1;
        setState(() {
        });
      }
      else{
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body:Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyAppBar(title: MyStrings.instance.verification),
                SizedBox(height: 40),
                Text(MyStrings.instance.codeHaveBeenSentToYourEmail, style: TextStyle(color: MyColors.instance.textArticleColor, fontSize: 13)),
                Text(MyStrings.instance.userMail, style: TextStyle(color: MyColors.instance.textColor),),
                SizedBox(height: 80),
                PinCodeTextField(
                  controller: controller,
                  appContext: context,
                  length: 4,
                  textStyle: TextStyle(color: MyColors.instance.white),
                  animationType: AnimationType.fade,
                  cursorColor: MyColors.instance.yellowColor,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    activeColor: MyColors.instance.yellowColor,
                    selectedColor: MyColors.instance.yellowColor,
                    inactiveColor: MyColors.instance.yellowColor,
                    borderRadius: BorderRadius.circular(10),
                    borderWidth: 0.5,
                    fieldHeight: 55,
                    fieldWidth: 55,
                    activeFillColor: MyColors.instance.transparent,
                    selectedFillColor: MyColors.instance.transparent,
                    inactiveFillColor: MyColors.instance.transparent,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(num<10 ? MyStrings.instance.timer + MyStrings.instance.zero +num.toString() : MyStrings.instance.timer + num.toString(), style: TextStyle(color: num==0 ? MyColors.instance.textArticleColor : MyColors.instance.yellowColor),),
                      GestureDetector(
                          onTap: (){
                            if(num==0){
                              num= 60;
                            }
                            else{
                              Fluttertoast.showToast(msg: MyStrings.instance.pleaseWait);
                            }
                          },
                          child: Text(MyStrings.instance.resendCode, style: TextStyle(color: num!=0 ? MyColors.instance.textArticleColor : MyColors.instance.yellowColor),)),
                    ],
                  ),
                ),
              ]
          ),
              ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.all(20),
              child: MyButton(
                buttonText: MyStrings.instance.verify,
                onTap: (){
                  if(controller.text.toString() == "1234"){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyChooseDocumentScreen()));
                  }
                  else if(controller.text.length < 4){
                    Fluttertoast.showToast(msg: MyStrings.instance.pleaseEnterOtp);
                  }
                  else{
                    Fluttertoast.showToast(msg: MyStrings.instance.pleaseEnterCorrectOtp);
                  }

                },)
            ),
          )
        ],
      ));
  }
}
