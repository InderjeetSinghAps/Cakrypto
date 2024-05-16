import 'package:cakrypto/helper_classes/my_app_bar.dart';
import 'package:cakrypto/singleton_classes/colors.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAppBar(title: MyStrings.instance.news),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(MyStrings.instance.trendings,
                style: TextStyle(color: MyColors.instance.white, fontSize: 16, fontWeight: FontWeight.bold),),
                    Stack(
                      children: [
                        Container(
                          height: 170,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: MyColors.instance.hintTextColor,
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(35), bottomLeft: Radius.circular(35),
                              topRight: Radius.circular(20), topLeft:  Radius.circular(20)),
                          ),
                        ),
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(left: 30, right: 30, top: 120),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: MyColors.instance.uploadButtonColor
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 15),
                                  Text(MyStrings.instance.belnCrypto, style: TextStyle(color: MyColors.instance.yellowColor),),
                                  SizedBox(width: 10),
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor: MyColors.instance.black73,
                                  ),
                                  SizedBox(width: 10),
                                  Text(MyStrings.instance.minAgo47, style: TextStyle(color: MyColors.instance.black73),),

                                ],
                              ),
                              SizedBox(height: 10),
                              Text(MyStrings.instance.singaporeMonetaryAuthority,
                                    style: TextStyle(color: MyColors.instance.white, fontSize: 16, fontWeight: FontWeight.w600),)
                            ],
                          ),
                        )
                      ],
                    )
              ]
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(MyStrings.instance.latestNews,
                    style: TextStyle(color: MyColors.instance.white, fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
