import 'package:cakrypto/singleton_classes/colors.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:coingecko_dart/coingecko_dart.dart';

import '../model_classes/coins_model.dart';
import '../model_classes/single_coin_details_model.dart';
import 'coin_details_screen.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {

  int? selectedIndex;
  int? selectTimeDurationIndex;
  final List<int> itemCount = [12, 3, 7, 2];
  var coinList = [];

  List<CoinModel>? coinsList;
  SingleCoinModel singleCoinModel = SingleCoinModel();
  var coinData = [];
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    selectedIndex=0;
    selectTimeDurationIndex=0;
    getCoins();
  }

  void getCoins() async{
    try{
      final dio = Dio();
      final response = await dio.get("https://api.coingecko.com/api/v3/coins/list");
      if(response.statusCode == 200){
        List<dynamic> list = response.data;
        coinsList = list.map((e) => CoinModel.fromJson(e)).toList();
        coinsList!.shuffle();
        for(int i=0; i<100; i++) {
          try {
            var secondResponse = await dio.get("https://api.coingecko.com/api/v3/coins/" + coinsList![i].id.toString());
            if (secondResponse.statusCode == 200) {
              singleCoinModel = SingleCoinModel.fromJson(secondResponse.data);
              var map = {
                "icon_url" : singleCoinModel.image!.small.toString(),
                "name" : singleCoinModel.name.toString(),
                "symbol" : singleCoinModel.symbol.toString(),
                "priceChangePercentage30d" : singleCoinModel.marketData!.priceChangePercentage30d.toString() + "%",
                "id" : singleCoinModel.id.toString(),
              };
              coinData.add(map);
              print("Coin Data Length : " + coinData.length.toString());
              setState(() {});
            }
          }
          catch (error) {
            print(i.toString() + " error : " + error.toString());
            if (error is DioError && error.response?.statusCode == 429) {
              await Future.delayed(Duration(seconds: 10));
            }
          }
        }
      }
    }
    catch(error){
      print("Error : " + error.toString());
      if (error is DioError && error.response?.statusCode == 429) {
        errorMessage = "429";
        await Future.delayed(Duration(seconds: 10));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(MyStrings.instance.markets, style: TextStyle(color: MyColors.instance.white, fontSize: 30, fontWeight: FontWeight.w500),),
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex=0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        color: selectedIndex == 0 ? MyColors.instance.uploadButtonColor : MyColors.instance.transparent,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(MyStrings.instance.allAssets,
                        style: TextStyle(color: selectedIndex == 0 ? MyColors.instance.yellowColor : MyColors.instance.hintTextColor,
                          fontWeight: selectedIndex == 0 ? FontWeight.w500 : FontWeight.w400),),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex=1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                          color: selectedIndex == 1 ? MyColors.instance.uploadButtonColor : MyColors.instance.transparent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(MyStrings.instance.favourites,
                        style: TextStyle(color: selectedIndex == 1 ? MyColors.instance.yellowColor : MyColors.instance.hintTextColor,
                            fontWeight: selectedIndex == 1 ? FontWeight.w500 : FontWeight.w400),),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex=2;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                          color: selectedIndex == 2 ? MyColors.instance.uploadButtonColor : MyColors.instance.transparent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(MyStrings.instance.topGainer,
                        style: TextStyle(color: selectedIndex == 2 ? MyColors.instance.yellowColor : MyColors.instance.hintTextColor,
                            fontWeight: selectedIndex == 2 ? FontWeight.w500 : FontWeight.w400),),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex=3;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                          color: selectedIndex == 3 ? MyColors.instance.uploadButtonColor : MyColors.instance.transparent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(MyStrings.instance.topLosers,
                        style: TextStyle(color: selectedIndex == 3 ? MyColors.instance.yellowColor : MyColors.instance.hintTextColor,
                            fontWeight: selectedIndex == 3 ? FontWeight.w500 : FontWeight.w400),),
                    ),
                  ),
                ],
              ),
            ),
          ),

          selectedIndex == 0 ?
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 70,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyColors.instance.uploadButtonColor
                ),
                child: Row(
                  children: [
                    Text(MyStrings.instance.hot, style: TextStyle(color: MyColors.instance.hintTextColor),),
                    Icon(Icons.arrow_drop_down_outlined, color: MyColors.instance.hintTextColor,)
                  ],
                ),
              ),
            ],
          ) : Container(),

          selectedIndex == 2 || selectedIndex == 3 ?
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                decoration: BoxDecoration(
                  color: MyColors.instance.uploadButtonColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectTimeDurationIndex=0;
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                            color: selectTimeDurationIndex == 0 ? MyColors.instance.yellowColor : MyColors.instance.transparent,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text(MyStrings.instance.oneH,
                            style: TextStyle(color: selectTimeDurationIndex == 0 ? MyColors.instance.black : MyColors.instance.hintTextColor,
                                fontWeight: selectTimeDurationIndex == 0 ? FontWeight.w500 : FontWeight.w400),),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectTimeDurationIndex=1;
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                            color: selectTimeDurationIndex == 1 ? MyColors.instance.yellowColor : MyColors.instance.transparent,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text(MyStrings.instance.twentyFourH,
                            style: TextStyle(color: selectTimeDurationIndex == 1 ? MyColors.instance.black : MyColors.instance.hintTextColor,
                                fontWeight: selectTimeDurationIndex == 1 ? FontWeight.w500 : FontWeight.w400),),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectTimeDurationIndex=2;
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                            color: selectTimeDurationIndex == 2 ? MyColors.instance.yellowColor : MyColors.instance.transparent,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text(MyStrings.instance.sevenD,
                            style: TextStyle(color: selectTimeDurationIndex == 2 ? MyColors.instance.black : MyColors.instance.hintTextColor,
                                fontWeight: selectTimeDurationIndex == 2 ? FontWeight.w500 : FontWeight.w400),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ) : Container(),

          selectedIndex == 0 ? Expanded(
            child: coinData.length > 0
                ?  ListView.builder(
              itemCount: coinData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: MyColors.instance.uploadButtonColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: ClipRRect(
                                    child: Image.network(coinData[index]["icon_url"], fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(coinData[index]["name"].toString().length <20 ? coinData[index]["name"] : coinData[index]["name"].toString().substring(0,20)+"..", style: TextStyle(color: MyColors.instance.white),),
                                    SizedBox(height: 3),
                                    Text(coinData[index]["symbol"].toString().length <20 ? coinData[index]["symbol"] : coinData[index]["symbol"].toString().substring(0,20)+"..", style: TextStyle(color: MyColors.instance.white.withOpacity(0.5), fontSize: 12),),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text("Price Change 30d", style: TextStyle(color: MyColors.instance.white, fontSize: 10),),
                                Text(coinData[index]["priceChangePercentage30d"].toString().length > 6 ? coinData[index]["priceChangePercentage30d"].toString().substring(0, 6) : coinData[index]["priceChangePercentage30d"], style: TextStyle(color: MyColors.instance.white),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CoinDetailsScreen(api_url: "https://api.coingecko.com/api/v3/coins/"  + coinData[index]["id"]),));
                    },
                  ),
                );
              },
            )
                : errorMessage == null
                ? Center(child: CircularProgressIndicator())
                : Center(child: Text("Sorry Something Went Wrong - " + errorMessage.toString(), style : TextStyle(color: MyColors.instance.white))),
          ) : SizedBox(),
          selectedIndex == 1 ? Expanded(
            child: coinData.length > 5
                ?  ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: MyColors.instance.uploadButtonColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: ClipRRect(
                                    child: Image.network(coinData[index]["icon_url"], fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(coinData[3 + index]["name"].toString().length <20 ? coinData[3 + index]["name"] : coinData[3 + index]["name"].toString().substring(0,20)+"..", style: TextStyle(color: MyColors.instance.white),),
                                    SizedBox(height: 3),
                                    Text(coinData[3 + index]["symbol"].toString().length <20 ? coinData[3 + index]["symbol"] : coinData[3 + index]["symbol"].toString().substring(0,20)+"..", style: TextStyle(color: MyColors.instance.white.withOpacity(0.5), fontSize: 12),),  ],

                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text("Price Change 30d", style: TextStyle(color: MyColors.instance.white, fontSize: 10),),
                                Text(coinData[3 + index]["priceChangePercentage30d"], style: TextStyle(color: MyColors.instance.white),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CoinDetailsScreen(api_url: "https://api.coingecko.com/api/v3/coins/"  + coinData[3 + index]["id"]),));
                    },
                  ),
                );
              },
            )
                : errorMessage == null
                ? Center(child: CircularProgressIndicator())
                : Center(child: Text("Sorry Something Went Wrong - " + errorMessage.toString(), style : TextStyle(color: MyColors.instance.white))),
          ) : SizedBox(),
          selectedIndex == 2 ? Expanded(
            child: coinData.length > 3
                ?  ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: MyColors.instance.uploadButtonColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: ClipRRect(
                                    child: Image.network(coinData[index]["icon_url"], fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(coinData[index]["name"].toString().length <20 ? coinData[index]["name"] : coinData[index]["name"].toString().substring(0,20)+"..", style: TextStyle(color: MyColors.instance.white),),
                                    SizedBox(height: 3),
                                    Text(coinData[index]["symbol"].toString().length <20 ? coinData[index]["symbol"] : coinData[index]["symbol"].toString().substring(0,20)+"..", style: TextStyle(color: MyColors.instance.white.withOpacity(0.5), fontSize: 12),),  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text("Price Change 30d", style: TextStyle(color: MyColors.instance.white, fontSize: 10),),
                                Text(coinData[index]["priceChangePercentage30d"], style: TextStyle(color: MyColors.instance.white),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CoinDetailsScreen(api_url: "https://api.coingecko.com/api/v3/coins/"  + coinData[index]["id"]),));
                    },
                  ),
                );
              },
            )
                : errorMessage == null
                ? Center(child: CircularProgressIndicator())
                : Center(child: Text("Sorry Something Went Wrong - " + errorMessage.toString(), style : TextStyle(color: MyColors.instance.white))),
          ) : SizedBox(),
          selectedIndex == 3 ? Expanded(
            child: coinData.length > 10
                ?  ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: MyColors.instance.uploadButtonColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: ClipRRect(
                                    child: Image.network(coinData[index]["icon_url"], fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(coinData[7 + index]["name"].toString().length <20 ? coinData[7 + index]["name"] : coinData[7 + index]["name"].toString().substring(0,20)+"..", style: TextStyle(color: MyColors.instance.white),),
                                    SizedBox(height: 3),
                                    Text(coinData[7 + index]["symbol"].toString().length <20 ? coinData[7 + index]["symbol"] : coinData[7 + index]["symbol"].toString().substring(0,20)+"..", style: TextStyle(color: MyColors.instance.white.withOpacity(0.5), fontSize: 12),),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text("Price Change 30d", style: TextStyle(color: MyColors.instance.white, fontSize: 10),),
                                Text(coinData[7 + index]["priceChangePercentage30d"], style: TextStyle(color: MyColors.instance.white),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CoinDetailsScreen(api_url: "https://api.coingecko.com/api/v3/coins/"  + coinData[7 + index]["id"]),));
                    },
                  ),
                );
              },
            )
                : errorMessage == null
                ? Center(child: CircularProgressIndicator())
                : Center(child: Text("Sorry Something Went Wrong - " + errorMessage.toString(), style : TextStyle(color: MyColors.instance.white))),
          ) : SizedBox(),


        ],
      )
    );
  }
}
