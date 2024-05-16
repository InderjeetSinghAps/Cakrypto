import 'package:cakrypto/helper_classes/button.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:flutter/material.dart';

import '../singleton_classes/colors.dart';
import 'notification_screen.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 20),
                  Text(MyStrings.instance.myPortfolio, style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.bold, fontSize:17),),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                      },
                      child: Icon(Icons.notifications_none_outlined, color: MyColors.instance.white, size: 30,)
                  )
                ],
              ),
              SizedBox(height: 100),
              Image.asset("assets/images/empty_portfolio.png",),
              SizedBox(height: 40),
              Text(MyStrings.instance.yourPortfolioIsEmpty, style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.bold, fontSize:25),),
              SizedBox(height: 20),
              Text(MyStrings.instance.clickAddTransactionToBuyYourFirstCryptoCurrency, style: TextStyle(color: MyColors.instance.hintTextColor, fontSize:14), textAlign: TextAlign.center,),
              SizedBox(height: 50),
              Container(
                  width: double.infinity,
                  child: MyButton(buttonText: MyStrings.instance.addTransaction, onTap: (){})
              )
            ],
          ),
        ),
      ),
    );
  }
}
