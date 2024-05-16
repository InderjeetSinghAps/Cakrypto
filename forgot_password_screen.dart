import 'package:cakrypto/helper_classes/my_app_bar.dart';
import 'package:cakrypto/screens/verification_screen.dart';
import 'package:flutter/material.dart';

import '../helper_classes/button.dart';
import '../helper_classes/textfield.dart';
import '../singleton_classes/colors.dart';
import '../singleton_classes/strings.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  TextEditingController controller = new TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body:Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(title: MyStrings.instance.forgotPassword),
              SizedBox(height: 40),
              Text(MyStrings.instance.pleaseEnterYourMailThatYouUseToSignUpToCryptoCoin, style: TextStyle(color: MyColors.instance.textArticleColor, fontSize: 13)),
              SizedBox(height: 20),
              Text(MyStrings.instance.emailAddress, style: TextStyle(color: MyColors.instance.textColor),),
              SizedBox(height: 10),
              MyTextField(hintText: MyStrings.instance.enterYourEmailAddress,  errorText: MyStrings.instance.pleaseEnterYourMail, controller: controller),
              SizedBox(height: 60),
              Container(
                width: double.infinity,
                child: MyButton(buttonText: MyStrings.instance.next, onTap: (){
                  if(key.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationScreen()));
                  }
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
