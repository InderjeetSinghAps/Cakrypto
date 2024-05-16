import 'package:cakrypto/helper_classes/my_app_bar.dart';
import 'package:cakrypto/singleton_classes/colors.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            MyAppBar(title: MyStrings.instance.helpCenter),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                color: MyColors.instance.uploadButtonColor,
                width: double.infinity,
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          style: TextStyle(color: MyColors.instance.white),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: MyColors.instance.grey80),
                            hintText: MyStrings.instance.enterYourQuestion,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none
                            )
                          ),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.add_chart, color: MyColors.instance.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          child: Icon(Icons.send_outlined, color: MyColors.instance.white),
                        onTap: (){
                            Fluttertoast.showToast(msg: "Server Error - 404");
                        },
                      ),
                    ),
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
