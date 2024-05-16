import 'package:cakrypto/singleton_classes/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  MyTextField({super.key, required this.hintText, required this.errorText, required this.controller});

  final String hintText;
  final String errorText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: MyColors.instance.yellowColor,
      style: TextStyle(color: MyColors.instance.white),
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0)
        ),
        filled: true,
        fillColor: MyColors.instance.textFieldFillColor,
        hintText: hintText,
        hintStyle: TextStyle(color: MyColors.instance.hintTextColor, fontWeight: FontWeight.w300),
      ),
      validator: (value){
        if(value!.isEmpty){
          return errorText;
        }
      },
    );
  }
}
