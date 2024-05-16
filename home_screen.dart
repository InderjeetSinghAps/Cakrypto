import 'package:cakrypto/screens/news_screen.dart';
import 'package:cakrypto/screens/notification_screen.dart';
import 'package:cakrypto/singleton_classes/colors.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var bottomNavIndex = 0;

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
                  SizedBox(width: 30),
                  Row(
                    children: [
                      Icon(Icons.search, color: MyColors.instance.white, size: 30,),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                        },
                        child: Icon(Icons.notifications_none_outlined, color: MyColors.instance.white, size: 30,),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30),
              Image.asset("assets/images/balance.png"),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(MyStrings.instance.topCoins, style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.bold),),
                  Text(MyStrings.instance.seeAll, style: TextStyle(color: MyColors.instance.yellowColor, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: MyColors.instance.uploadButtonColor,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 30),
                              Image.asset("assets/images/bitcoin.png"),
                              SizedBox(width: 5),
                              Text(MyStrings.instance.bitcoin,
                                style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.bold, fontSize: 16),),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(MyStrings.instance.bitcoinPrice,
                                    style: TextStyle(color: MyColors.instance.textColor, fontSize: 16),),
                                Row(
                                  children: [
                                    Text(MyStrings.instance.percentage2455,
                                      style: TextStyle(color: MyColors.instance.green, fontSize: 16),),
                                    Icon(Icons.arrow_drop_up, color: MyColors.instance.green, size: 25,)
                                  ],
                                )
                              ],
                            ),
                          ),
                          Image.asset("assets/images/chart_green_line.png")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: MyColors.instance.uploadButtonColor,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                SizedBox(width: 30),
                                Image.asset("assets/images/etheriam.png"),
                                SizedBox(width: 5),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 6),
                                  child: Text(MyStrings.instance.etherium,
                                    style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.bold, fontSize: 16),),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(MyStrings.instance.etheriumPrice,
                                  style: TextStyle(color: MyColors.instance.textColor, fontSize: 16),),
                                Row(
                                  children: [
                                    Text(MyStrings.instance.percentage255,
                                      style: TextStyle(color: MyColors.instance.green, fontSize: 16),),
                                    Icon(Icons.arrow_drop_up, color: MyColors.instance.green, size: 25,)
                                  ],
                                )
                              ],
                            ),
                          ),
                          Image.asset("assets/images/chart_green_line.png")
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(MyStrings.instance.news, style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.bold),),
                  TextButton(
                      onPressed: () { 
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewScreen()));
                      },
                      child: Text(MyStrings.instance.seeAll, style: TextStyle(color: MyColors.instance.yellowColor, fontWeight: FontWeight.bold),)),
                ],
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                    color: MyColors.instance.uploadButtonColor,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Row(
                  children: [
                    Container(
                      height: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                      width: 60,
                      decoration: BoxDecoration(
                        color: MyColors.instance.white196,
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(MyStrings.instance.analystsProjectUpside,
                          style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.w600, height: 1.5, fontSize: 12),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(MyStrings.instance.finbold, style: TextStyle(color: MyColors.instance.yellowColor),),
                            SizedBox(width: 5),
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: MyColors.instance.black73,
                            ),
                            SizedBox(width: 5),
                            Text(MyStrings.instance.minAgo47, style: TextStyle(color: MyColors.instance.black73),),

                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}


