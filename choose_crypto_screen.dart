import 'package:cakrypto/helper_classes/my_app_bar.dart';
import 'package:cakrypto/singleton_classes/colors.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model_classes/coins_model.dart';
import '../model_classes/single_coin_details_model.dart';

class ChooseCryptoScreen extends StatefulWidget {
  const ChooseCryptoScreen({super.key});

  @override
  State<ChooseCryptoScreen> createState() => _ChooseCryptoScreenState();
}

class _ChooseCryptoScreenState extends State<ChooseCryptoScreen> {

  List<CoinModel>? coinsList;
  SingleCoinModel singleCoinModel = SingleCoinModel();
  var coinData = [];
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    getCoins();
  }

  void getCoins() async{
    try{
      final dio = Dio();
      final response = await dio.get("https://api.coingecko.com/api/v3/coins/list");
      if(response.statusCode == 200){
        List<dynamic> list = response.data;
        coinsList = list.map((e) => CoinModel.fromJson(e)).toList();
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
        children: [
          MyAppBar(title: MyStrings.instance.chooseCrypto),
          SizedBox(height: 30),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: MyColors.instance.uploadButtonColor,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(Icons.search, color: MyColors.instance.grey80, size: 25,),
                ),
                Expanded(
                  child: Center(
                    child: TextField(
                      cursorColor: MyColors.instance.yellowColor,
                      decoration: InputDecoration(
                          hintText: MyStrings.instance.search,
                          hintStyle: TextStyle(color: MyColors.instance.hintTextColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(Icons.delete_forever, color: MyColors.instance.grey80, size: 25,),
                ),

              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
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
                    },
                  ),
                );
              },
            )
                : errorMessage == null
                ? Center(child: CircularProgressIndicator())
                : Center(child: Text("Sorry Something Went Wrong - " + errorMessage.toString(), style : TextStyle(color: MyColors.instance.white))),
          )
        ],
      ),
    );
  }
}
