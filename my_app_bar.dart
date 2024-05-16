import 'package:flutter/material.dart';

import '../singleton_classes/colors.dart';
import '../singleton_classes/strings.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: (){Navigator.pop(context);},
              child: Container(
                  height: 40, width: 40,
                  child: Image.asset("assets/images/back_arrow.png"))),
          Text(title, style: TextStyle(color: MyColors.instance.white, fontSize: 18, fontWeight: FontWeight.w600),),
          SizedBox(width: 30)
        ],
      ),
    );
  }
}
