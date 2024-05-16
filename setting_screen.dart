import 'package:cakrypto/screens/converter_screen.dart';
import 'package:cakrypto/screens/default_currencies_screen.dart';
import 'package:cakrypto/screens/help_center_screen.dart';
import 'package:cakrypto/screens/notification_screen.dart';
import 'package:cakrypto/screens/payment_methods_screen.dart';
import 'package:cakrypto/screens/profile_setting_screen.dart';
import 'package:cakrypto/screens/terms_screen.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:flutter/material.dart';

import '../singleton_classes/colors.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body:Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 20),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                        }, 
                        child: Icon(Icons.notifications_none_outlined, color: MyColors.instance.white, size: 30,)
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: MyColors.instance.white196,
                          radius: 35,
                        ),
                        SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(MyStrings.instance.karanGoyal, style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.w600, fontSize: 17),),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: MyColors.instance.textFieldFillColor,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Row(
                                children: [
                                  Text(MyStrings.instance.verified, style: TextStyle(color: MyColors.instance.yellowColor),),
                                  SizedBox(width: 3),
                                  Icon(Icons.verified_rounded, color: MyColors.instance.yellowColor,)
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Text(MyStrings.instance.id7134, style: TextStyle(color: MyColors.instance.hintTextColor, fontSize: 15),),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                color: MyColors.instance.textFieldFillColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.card_giftcard, color: MyColors.instance.yellowColor,),
                    SizedBox(width: 10),
                    Text(MyStrings.instance.inviteFriendsEarnCryptoTogether, style: TextStyle(color: MyColors.instance.white),)
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(MyStrings.instance.appSetting, style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.w600, fontSize: 16)),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: MyColors.instance.textFieldFillColor,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSettingScreen()));
                        },
                        child: ListTile(
                          leading: Icon(Icons.person, color: MyColors.instance.yellowColor, size: 25,),
                          title: Text(MyStrings.instance.profileSetting, style: TextStyle(color: MyColors.instance.white, fontSize: 14),),
                          trailing: Icon(Icons.arrow_forward_ios, size: 20, color: MyColors.instance.grey80,),
                        ),
                      ),
                    ),
                    Container(
                      height: 0.7,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      color: MyColors.instance.grey80,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                        },
                        child: ListTile(
                          leading: Icon(Icons.notifications, color: MyColors.instance.yellowColor, size: 25,),
                          title: Text(MyStrings.instance.notification, style: TextStyle(color: MyColors.instance.white, fontSize: 14),),
                          trailing: Icon(Icons.arrow_forward_ios, size: 20, color: MyColors.instance.grey80,),
                        ),
                      ),
                    ),
                    Container(
                      height: 0.7,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      color: MyColors.instance.grey80,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethodsScreen()));
                        },
                        child: ListTile(
                          leading: Icon(Icons.payment_outlined, color: MyColors.instance.yellowColor, size: 25,),
                          title: Text(MyStrings.instance.paymentMethonds, style: TextStyle(color: MyColors.instance.white, fontSize: 14),),
                          trailing: Icon(Icons.arrow_forward_ios, size: 20, color: MyColors.instance.grey80,),
                        ),
                      ),
                    ),
                    Container(
                      height: 0.7,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      color: MyColors.instance.grey80,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ConverterScreen()));
                        },
                        child: ListTile(
                          leading: Icon(Icons.ad_units_rounded, color: MyColors.instance.yellowColor, size: 25,),
                          title: Text(MyStrings.instance.converter, style: TextStyle(color: MyColors.instance.white, fontSize: 14),),
                          trailing: Icon(Icons.arrow_forward_ios, size: 20, color: MyColors.instance.grey80,),
                        ),
                      ),
                    ),
                    Container(
                      height: 0.7,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      color: MyColors.instance.grey80,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DefaultCurrenciesScreen()));
                        },
                        child: ListTile(
                          leading: Icon(Icons.currency_exchange_rounded, color: MyColors.instance.yellowColor, size: 25,),
                          title: Text(MyStrings.instance.defaultCurrencies, style: TextStyle(color: MyColors.instance.white, fontSize: 14),),
                          trailing: Container(
                            width: 80,
                            height: 100,
                            child: Row(
                              children: [
                                Text(MyStrings.instance.usdAndBtc, style: TextStyle(color: MyColors.instance.white196, fontSize: 10)),
                                SizedBox(width: 3),
                                Icon(Icons.arrow_forward_ios, size: 20, color: MyColors.instance.grey80,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(MyStrings.instance.aboutAndSupport, style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.w600, fontSize: 16)),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: MyColors.instance.textFieldFillColor,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TermsScreen(),));
                        },
                        child: ListTile(
                          leading: Icon(Icons.file_copy_sharp, color: MyColors.instance.yellowColor, size: 25,),
                          title: Text(MyStrings.instance.termsAndPrivacy  , style: TextStyle(color: MyColors.instance.white, fontSize: 14),),
                          trailing: Icon(Icons.arrow_forward_ios, size: 20, color: MyColors.instance.grey80,),
                        ),
                      ),
                    ),
                    Container(
                      height: 0.7,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      color: MyColors.instance.grey80,
                    ),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HelpCenterScreen()));
                        },
                        child: ListTile(
                          leading: Icon(Icons.help, color: MyColors.instance.yellowColor, size: 25,),
                          title: Text(MyStrings.instance.helpCenter  , style: TextStyle(color: MyColors.instance.white, fontSize: 14),),
                          trailing: Icon(Icons.arrow_forward_ios, size: 20, color: MyColors.instance.grey80,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
