import 'package:cakrypto/helper_classes/button.dart';
import 'package:cakrypto/helper_classes/outlined_button.dart';
import 'package:cakrypto/screens/login_screen.dart';
import 'package:cakrypto/screens/sign_up_screen.dart';
import 'package:cakrypto/singleton_classes/colors.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController pageController = new PageController();
  int currentPageIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(MyStrings.instance.skip, style: TextStyle(color: MyColors.instance.yellowColor, fontSize: 16),),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
                  ),
              ],
            ),

            Container(
              height: 500,
              child: PageView(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  currentPageIndex = value;
                  setState(() {});
                },
                children: [
                  Column(
                    children: [
                      Container(
                        child: Image.asset("assets/images/onboarding_one.png"),
                        height: 400,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        alignment: Alignment.topLeft,
                        height: 100,
                        child: RichText(text: TextSpan( style: TextStyle(fontSize: 30, height: 1.3, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(text: MyStrings.instance.welcomeTo, style: TextStyle(color: MyColors.instance.white)),
                              TextSpan(text: "\n", style: TextStyle(color: MyColors.instance.white)),
                              TextSpan(text: MyStrings.instance.bit, style: TextStyle(color: MyColors.instance.white)),
                              TextSpan(text: MyStrings.instance.manny, style: TextStyle(color: MyColors.instance.yellowColor)),
                            ]
                        ),),
                      )
                    ],
                  ),
                  Column(
                      children: [
                        Container(
                            height: 400,
                            child: Image.asset("assets/images/onboarding_two.png")
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30),
                            alignment: Alignment.topLeft,
                            height: 100,
                            child: RichText(text: TextSpan( style: TextStyle(fontSize: 30, color: MyColors.instance.white,
                                height: 1.3, fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(text: MyStrings.instance.transaction),
                                  TextSpan(text: "\n"),
                                  TextSpan(text: MyStrings.instance.security),
                                ]
                            ),)
                        )]
                  ),
                  Column(
                    children: [
                      Container(
                          height: 400,
                          child: Image.asset("assets/images/onboarding_three.png")
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          alignment: Alignment.topLeft,
                          height: 100,
                          child: Text(MyStrings.instance.fastAndReliableMarketUpdated, style: TextStyle(color: MyColors.instance.white,  height: 1.3,
                              fontWeight: FontWeight.bold, fontSize: 30))),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          height: 400,
                          child: Image.asset("assets/images/onboarding_four.png")
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          alignment: Alignment.topLeft,
                          height: 100,
                          child: Text(MyStrings.instance.fastAndFlexibleTrading, style: TextStyle(fontSize: 30, color: MyColors.instance.white,
                              height: 1.3, fontWeight: FontWeight.bold),),)
                    ],
                  )
                ],
              ),
            ),

            currentPageIndex==3 ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 4,
                      child: MyOutlinedButton(buttonText: MyStrings.instance.signUp, onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                      },)
                  ),
                  SizedBox(width: 30),
                  Expanded(
                      flex: 4,
                      child: MyButton(buttonText: MyStrings.instance.logIn, onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      })
                  ),
                ],
              ),
            ) :
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DotsIndicator(
                    dotsCount: 4,
                    position: currentPageIndex,
                    decorator: DotsDecorator(
                      size: Size(14.0, 7.0),
                      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      activeSize: Size(32.0, 7.0),
                      activeColor: MyColors.instance.yellowColor,
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        if(currentPageIndex == 0){
                          currentPageIndex=1;
                          pageController.jumpToPage(1);
                        }
                        else if(currentPageIndex == 1){
                          currentPageIndex=2;
                          pageController.jumpToPage(2);
                        }
                        else if(currentPageIndex == 2){
                          currentPageIndex=3;
                          pageController.jumpToPage(3);
                        }
                        else if(currentPageIndex == 3){

                        }
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: MyColors.instance.yellowColor,
                      radius: 25,
                      child: Icon(Icons.arrow_forward_ios, size: 20,),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
