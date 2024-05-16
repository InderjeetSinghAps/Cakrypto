import 'package:cakrypto/helper_classes/my_app_bar.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:flutter/material.dart';

import '../singleton_classes/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: Column(
        children: [
          MyAppBar(title: MyStrings.instance.notifications),
          // Container(
          //   color: Colors.white,
          //   child: ListView.builder(
          //     itemCount: 3,
          //     itemBuilder: (context, index) {
          //
          //       return Container(
          //         height: 100,
          //         width: double.infinity,
          //         child: Row(
          //           children: [
          //             Expanded(
          //                 child: Icon(Icons.mail_lock_outlined, size: 25, color: MyColors.instance.yellowColor,)
          //             )
          //           ],
          //         ),
          //       );
          //       },),
          // )

          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                        flex: 22,
                        child: Center(child: Icon(Icons.mail_outline_outlined, color: MyColors.instance.yellowColor,))
                    ),
                    Expanded(
                        flex: 78,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(MyStrings.instance.youHaveSuccessfullyPaid, style: TextStyle(color: MyColors.instance.white)),
                            SizedBox(height: 3),
                            Row(
                              children: [
                                Text(MyStrings.instance.youGetOneBtc, style: TextStyle(color: MyColors.instance.hintTextColor, fontSize: 12)),
                                SizedBox(width: 3),
                                Text(MyStrings.instance.viewPortfolio, style: TextStyle(color: MyColors.instance.yellowColor, fontSize: 12)),
                              ],
                            ),
                            Text(MyStrings.instance.timeInNotificationScreen, style: TextStyle(color: MyColors.instance.hintTextColor, fontSize: 12)),
                          ],
                        )
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  color: MyColors.instance.hintTextColor,
                  height: 0.6,
                  width: double.infinity,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 22,
                        child: Center(child: Icon(Icons.mail_outline_outlined, color: MyColors.instance.hintTextColor,))
                    ),
                    Expanded(
                        flex: 78,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(MyStrings.instance.crypCoinSpotTradingSystemUpgrade, style: TextStyle(color: MyColors.instance.white)),
                            SizedBox(height: 3),
                            Text(MyStrings.instance.spotSystemUpgradeWillStartAt, style: TextStyle(color: MyColors.instance.hintTextColor, fontSize: 12)),
                            Text(MyStrings.instance.timeInNotificationScreen, style: TextStyle(color: MyColors.instance.hintTextColor, fontSize: 13)),
                          ],
                        )
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  color: MyColors.instance.hintTextColor,
                  height: 0.6,
                  width: double.infinity,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 22,
                        child: Center(child: Icon(Icons.mail_outline_outlined, color: MyColors.instance.yellowColor,))
                    ),
                    Expanded(
                        flex: 78,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(MyStrings.instance.youHaveSuccessfullyPaid, style: TextStyle(color: MyColors.instance.white)),
                            SizedBox(height: 3),
                            Row(
                              children: [
                                Text(MyStrings.instance.youGetOneBtc, style: TextStyle(color: MyColors.instance.hintTextColor, fontSize: 12)),
                                SizedBox(width: 3),
                                Text(MyStrings.instance.viewPortfolio, style: TextStyle(color: MyColors.instance.yellowColor, fontSize: 12)),
                              ],
                            ),
                            Text(MyStrings.instance.timeInNotificationScreen, style: TextStyle(color: MyColors.instance.hintTextColor, fontSize: 12)),
                          ],
                        )
                    )
                  ],
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
