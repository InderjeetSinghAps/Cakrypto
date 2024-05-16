import 'package:cakrypto/singleton_classes/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.buttonText, required this.onTap});

  final String buttonText;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.instance.yellowColor,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: OutlinedButton(
        onPressed: onTap,
        child: Text(buttonText, style: TextStyle(color: MyColors.instance.backgroundBlackColor, fontWeight: FontWeight.w500, fontSize: 16),),
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
        ),
      ),
    );
  }
}
