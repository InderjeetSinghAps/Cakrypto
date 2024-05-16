import 'package:cakrypto/helper_classes/my_app_bar.dart';
import 'package:cakrypto/singleton_classes/colors.dart';
import 'package:flutter/material.dart';

import '../helper_classes/button.dart';
import '../singleton_classes/strings.dart';

class PriceAlertScreen extends StatefulWidget {
  const PriceAlertScreen({super.key});

  @override
  State<PriceAlertScreen> createState() => _PriceAlertScreenState();
}

class _PriceAlertScreenState extends State<PriceAlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: Container(
        child: Column(
          children: [
            MyAppBar(title: MyStrings.instance.priceAlerts),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    Image.asset("assets/images/price_alert_image.png",),
                    SizedBox(height: 40),
                    Text(MyStrings.instance.thereIsNoAlerts, style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.bold, fontSize:25),),
                    SizedBox(height: 10),
                    Text(MyStrings.instance.clickAddNewToCreateYourAlerts, style: TextStyle(color: MyColors.instance.hintTextColor, fontSize:14), textAlign: TextAlign.center,),
                    SizedBox(height: 50),
                    Container(
                        width: double.infinity,
                        child: MyButton(buttonText: MyStrings.instance.addNewAlerts, onTap: (){})
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
