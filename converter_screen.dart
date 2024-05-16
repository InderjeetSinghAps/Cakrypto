import 'package:flutter/material.dart';

import '../helper_classes/my_app_bar.dart';
import '../singleton_classes/colors.dart';
import '../singleton_classes/strings.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  
  TextEditingController bitcoinController = TextEditingController();
  TextEditingController etheriumController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bitcoinController.text = "1";
    etheriumController.text = "20.35";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyAppBar(title: MyStrings.instance.converter),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(MyStrings.instance.from, style: TextStyle(color: MyColors.instance.grey80, fontWeight: FontWeight.w600)),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: MyColors.instance.uploadButtonColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/images/bitcoin.png"),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: bitcoinController,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            onChanged: (value){
                              var bitcoinValue = int.parse(value);
                              var etheriumValue = bitcoinValue * 20.35;
                              etheriumController.text =  etheriumValue.toString();
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(MyStrings.instance.to, style: TextStyle(color: MyColors.instance.grey80, fontWeight: FontWeight.w600)),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: MyColors.instance.uploadButtonColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/images/etheriam.png"),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: etheriumController,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            onChanged: (value){
                              var etheriumValue = int.parse(value);
                              var bitcoinValue = etheriumValue / 20.35;
                              bitcoinController.text =  bitcoinValue.toString();
                              setState(() {});
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
