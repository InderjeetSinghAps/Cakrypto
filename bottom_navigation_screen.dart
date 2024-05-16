  import 'package:cakrypto/screens/home_screen.dart';
  import 'package:cakrypto/screens/market_screen.dart';
  import 'package:cakrypto/screens/portfolio_screen.dart';
  import 'package:cakrypto/screens/setting_screen.dart';
  import 'package:cakrypto/singleton_classes/strings.dart';
  import 'package:curved_navigation_bar/curved_navigation_bar.dart';
  import 'package:flutter/material.dart';
  import '../singleton_classes/colors.dart';
  import 'choose_crypto_screen.dart';

  class BottomNavigationScreen extends StatefulWidget {
    const BottomNavigationScreen({super.key});

    @override
    State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
  }

  class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

    int currentIndex = 0;

    final List<Widget> screens = [
      HomeScreen(),
      MarketScreen(),
      HomeScreen(),
      PortfolioScreen(),
      SettingScreen(),
    ];

    final PageStorageBucket bucket = PageStorageBucket();
    Widget currentScreen = HomeScreen();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: MyColors.instance.backgroundBlackColor,
        bottomNavigationBar: CurvedNavigationBar(
          items: [
            Icon(Icons.home, size: 30, color: MyColors.instance.white),
            Icon(Icons.shopify, size: 30,color: MyColors.instance.white),
            Icon(Icons.add, size: 30, color: MyColors.instance.white),
            Icon(Icons.person, size: 30, color: MyColors.instance.white),
            Icon(Icons.settings, size: 30, color: MyColors.instance.white,),
          ],
          buttonBackgroundColor: MyColors.instance.yellowColor,
          onTap: (index) {
            if(index==2){
              showModalBottomSheet(
                  context: context,
                  backgroundColor: MyColors.instance.black22,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  builder: (BuildContext context){
                    return Container(
                      width: double.infinity,
                      height: 250,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseCryptoScreen()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                      child: Image.asset("assets/images/buy.png")
                                  ),
                                  Expanded(
                                    flex: 8,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 15),
                                              Text(MyStrings.instance.buy, style: TextStyle(color: MyColors.instance.white, fontSize: 17, fontWeight: FontWeight.w600),),
                                              Text(MyStrings.instance.buyCryptoWithYourLocalCurrency, style: TextStyle(color: MyColors.instance.textColor, fontSize: 13),),
                                            ],
                                          ),
                                          SizedBox(height: 25),
                                          Container(
                                            height: 0.7,
                                            width: double.infinity,
                                            color: MyColors.instance.hintTextColor,
                                          )
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseCryptoScreen()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                      child: Image.asset("assets/images/sell.png")
                                  ),
                                  Expanded(
                                    flex: 8,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 15),
                                              Text(MyStrings.instance.sell, style: TextStyle(color: MyColors.instance.white, fontSize: 17, fontWeight: FontWeight.w600),),
                                              Text(MyStrings.instance.sellCryptoFromYourWallet, style: TextStyle(color: MyColors.instance.textColor, fontSize: 13),),
                                            ],
                                          ),
                                          SizedBox(height: 25),

                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }
            else{
              currentIndex = index;
              currentScreen = screens[index];
            }
            setState(() {});
          },
          backgroundColor: MyColors.instance.transparent  ,
          color: MyColors.instance.navigationColor,
        ),

        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        )

      );
    }
  }
