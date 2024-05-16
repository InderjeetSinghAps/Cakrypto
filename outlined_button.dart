import 'package:flutter/material.dart';

import '../singleton_classes/colors.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({super.key, required this.onTap, required this.buttonText});

  final onTap;
  final buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        onPressed: onTap,
        child: Text(buttonText, style: TextStyle(color: MyColors.instance.yellowColor, fontWeight: FontWeight.w500, fontSize: 16),),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          side: BorderSide(
            width: 1,
            color: MyColors.instance.yellowColor,),
        ),
      ),
    );
  }
}
