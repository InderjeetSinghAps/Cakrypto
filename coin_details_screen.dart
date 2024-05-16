import 'dart:async';

import 'package:cakrypto/model_classes/single_coin_details_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../helper_classes/my_app_bar.dart';
import '../singleton_classes/colors.dart';

class CoinDetailsScreen extends StatefulWidget {
  final String api_url;
  CoinDetailsScreen({super.key, required this.api_url});

  @override
  State<CoinDetailsScreen> createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends State<CoinDetailsScreen> {

  SingleCoinModel singleCoinModel = SingleCoinModel();

  @override
  void initState() {
    super.initState();
    print(widget.api_url);
    Timer(Duration(seconds: 15), (){
      getCoinDetails();
    });
  }

  void getCoinDetails() async{
    try{
      final dio = Dio();
      var response = await dio.get(widget.api_url);
      if (response.statusCode == 200) {
        singleCoinModel = SingleCoinModel.fromJson(response.data);
        print(singleCoinModel.id);
        setState(() {});
      }
    }
    catch(error){
      Timer(Duration(seconds: 15), (){
        getCoinDetailsAgain();
      });
    }
  }

  void getCoinDetailsAgain() async{
    try{
      final dio = Dio();
      print("dio object");
      var response = await dio.get(widget.api_url);
      if (response.statusCode == 200) {
        print("status code : 200");
        print(response.data);
        singleCoinModel = SingleCoinModel.fromJson(response.data);
        print(singleCoinModel.id);
        setState(() {});
      }
    }
    catch(error){
      Timer(Duration(seconds: 10), (){
        getCoinDetails();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: singleCoinModel.id != null ? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){Navigator.pop(context);},
                      child: Container(
                          height: 40, width: 40,
                          child: Image.asset("assets/images/back_arrow.png"))),
                  Text(singleCoinModel.name.toString().length > 20 ? singleCoinModel.name.toString().substring(0, 20) + "..." : singleCoinModel.name.toString(),
                  style: TextStyle(color: MyColors.instance.white, fontSize: 19, fontWeight: FontWeight.w500),),
                  SizedBox(width: 30)
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(singleCoinModel.image!.large.toString())),
                            )),
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("ID : " + singleCoinModel.id.toString(), style: TextStyle(color: MyColors.instance.white),),
                                Text("Symbol : " + singleCoinModel.symbol.toString(), style: TextStyle(color: MyColors.instance.white),),
                                Text("Last Updated : " + singleCoinModel.lastUpdated.toString(), style: TextStyle(color: MyColors.instance.white),),
                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Asset Platform ID : " + singleCoinModel.assetPlatformId.toString(), style: TextStyle(color: MyColors.instance.white)),
                  SizedBox(height: 6,),
                  Text("Price Changes Within 24h : " + singleCoinModel.marketData!.priceChange24h.toString() + "%", style: TextStyle(color: MyColors.instance.white)),
                  SizedBox(height: 6,),
                  Text("Price Changes Within 7d : " + singleCoinModel.marketData!.priceChangePercentage7d.toString() + "%", style: TextStyle(color: MyColors.instance.white)),
                  SizedBox(height: 6,),
                  Text("Price Changes Within 14h : " + singleCoinModel.marketData!.priceChangePercentage14d.toString() + "%", style: TextStyle(color: MyColors.instance.white)),
                  SizedBox(height: 6,),
                  Text("Price Changes Within 30d : " + singleCoinModel.marketData!.priceChangePercentage30d.toString() + "%", style: TextStyle(color: MyColors.instance.white)),
                  SizedBox(height: 6,),
                  Text("Price Changes Within 60d : " + singleCoinModel.marketData!.priceChangePercentage60d.toString() + "%", style: TextStyle(color: MyColors.instance.white)),
                  SizedBox(height: 6,),
                  Text("Price Changes Within 200d : " + singleCoinModel.marketData!.priceChangePercentage200d.toString() + "%", style: TextStyle(color: MyColors.instance.white)),
                  SizedBox(height: 6,),
                    Text("Description : " + singleCoinModel.description!.en.toString(), style: TextStyle(color: MyColors.instance.white)),
                    SizedBox(height: 6,),
                ]
              ),
            )
          ],
        ),
      ) : Padding(
        padding: const EdgeInsets.symmetric(horizontal:18),
        child: Column(
          children: [
            MyAppBar(title: 'Coin',),
            Expanded(child: Center(child: CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}
