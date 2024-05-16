import 'package:cakrypto/singleton_classes/colors.dart';
import 'package:flutter/material.dart';

class MyPasswordTextField extends StatelessWidget {

  MyPasswordTextField({super.key, required this.hintText, required this.errorText, required this.controller});

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
      obscureText: true,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0)
        ),
        filled: true,
        suffixIcon: Icon(Icons.visibility_off_sharp, color: MyColors.instance.white,),
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
