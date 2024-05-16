import 'dart:io';

import 'package:cakrypto/helper_classes/button.dart';
import 'package:cakrypto/helper_classes/my_app_bar.dart';
import 'package:cakrypto/screens/verified_screen.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../singleton_classes/colors.dart';

class VerifyUploadDocumentScreen extends StatefulWidget {
  const VerifyUploadDocumentScreen({super.key});

  @override
  State<VerifyUploadDocumentScreen> createState() => _VerifyUploadDocumentScreenState();
}

class _VerifyUploadDocumentScreenState extends State<VerifyUploadDocumentScreen> {

  bool checkBoxValue = false;
  File? frontFile;
  File? backFile;

  void getFrontImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(source: ImageSource.gallery);
    if (img == null) return;
    setState(() {
      frontFile = File(img.path); // convert it to a Dart:io file
    });
  }

  void getBackImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(source: ImageSource.gallery);
    if (img == null) return;
    setState(() {
      backFile = File(img.path); // convert it to a Dart:io file
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(title: MyStrings.instance.verifyAccount),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Text(MyStrings.instance.uploadImageOfIDCard,
                        style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              frontFile == null ?
              GestureDetector(
                onTap: (){getFrontImage();},
                child: Container(
                  height: 115,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: MyColors.instance.uploadButtonColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/camera_icon.png"),
                      Text(MyStrings.instance.uploadFrontImage, style: TextStyle(color: MyColors.instance.textColor),)
                    ],
                  ),
                ),
              ) :
              Stack(
                children: [
                  Container(
                    height: 115,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: MyColors.instance.uploadButtonColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Image.file(frontFile!, fit: BoxFit.fitWidth),
                  ),
                  Positioned(
                      right: 20,
                      top: 0,
                      child: GestureDetector(
                        onTap: (){
                          frontFile=null;
                          setState(() {
                          });
                          },
                        child: Container(
                          height: 40,
                            width: 40,
                            child: Icon(Icons.delete_forever, color: MyColors.instance.white,)
                        ),
                      )
                  )
                ],
              ),
              SizedBox(height: 20),

              backFile == null ?
              GestureDetector(
                onTap: (){getBackImage();},
                child: Container(
                  height: 115,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: MyColors.instance.uploadButtonColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/camera_icon.png"),
                      Text(MyStrings.instance.uploadBackImage, style: TextStyle(color: MyColors.instance.textColor),)
                    ],
                  ),
                ),
              ) :
              Stack(
                children: [
                  Container(
                    height: 115,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: MyColors.instance.uploadButtonColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Image.file(backFile!, fit: BoxFit.fitWidth),
                  ),
                  Positioned(
                      right: 20,
                      top: 0,
                      child: GestureDetector(
                        onTap: (){
                          backFile=null;
                          setState(() {

                          });},
                        child: Container(
                            height: 40,
                            width: 40,
                            child: Icon(Icons.delete_forever, color: MyColors.instance.white,)
                        ),
                      )
                  )
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(style: TextStyle(fontSize: 16),
                            children:[
                              TextSpan(text: MyStrings.instance.tick,  style: TextStyle(color: MyColors.instance.green),),
                              TextSpan(text: MyStrings.instance.govtIssue,  style: TextStyle(color: MyColors.instance.textColor),),
                            ]
                        )),
                    SizedBox(height: 10),
                    RichText(
                        text: TextSpan(style: TextStyle(fontSize: 16),
                            children:[
                              TextSpan(text: MyStrings.instance.tick,  style: TextStyle(color: MyColors.instance.green),),
                              TextSpan(text: MyStrings.instance.originalFullSize,  style: TextStyle(color: MyColors.instance.textColor),),
                            ]
                        )),
                    SizedBox(height: 10),
                    RichText(
                        text: TextSpan(style: TextStyle(fontSize: 16),
                            children:[
                              TextSpan(text: MyStrings.instance.tick,  style: TextStyle(color: MyColors.instance.green),),
                              TextSpan(text: MyStrings.instance.placeDocumentsAgainst,  style: TextStyle(color: MyColors.instance.textColor),),
                            ]
                        )),
                    SizedBox(height: 10),
                    RichText(
                        text: TextSpan(style: TextStyle(fontSize: 16),
                            children:[
                              TextSpan(text: MyStrings.instance.tick,  style: TextStyle(color: MyColors.instance.green),),
                              TextSpan(text: MyStrings.instance.readable,  style: TextStyle(color: MyColors.instance.textColor),),
                            ]
                        )),
                    SizedBox(height: 10),
                    RichText(
                        text: TextSpan(style: TextStyle(fontSize: 16),
                            children:[
                              TextSpan(text: MyStrings.instance.cross,  style: TextStyle(color: MyColors.instance.red),),
                              TextSpan(text: MyStrings.instance.noBlackAndWhiteImages,  style: TextStyle(color: MyColors.instance.textColor),),
                            ]
                        )),
                    SizedBox(height: 10),
                    RichText(
                        text: TextSpan(style: TextStyle(fontSize: 16),
                            children:[
                              TextSpan(text: MyStrings.instance.cross,  style: TextStyle(color: MyColors.instance.red),),
                              TextSpan(text: MyStrings.instance.noEditedAndExpiredDocuments,  style: TextStyle(color: MyColors.instance.textColor),),
                            ]
                        )),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(checkBoxValue==true){
                            checkBoxValue = false;
                          }
                          else{
                            checkBoxValue=true;
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            child: Checkbox(
                                value: checkBoxValue,
                                activeColor: MyColors.instance.grey80,
                                checkColor: MyColors.instance.white,
                                onChanged: (value){
                                  setState(() {
                                    checkBoxValue = value!;
                                  });
                                }
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(MyStrings.instance.thisInformationIsUsedFor,
                              style: TextStyle(color: MyColors.instance.textColor, fontSize: 13, fontWeight: FontWeight.w400),),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                        width: double.infinity,
                        child: MyButton(buttonText: MyStrings.instance.continue_, onTap: (){
                          if(frontFile == null){
                            Fluttertoast.showToast(msg: MyStrings.instance.uploadFrontImage);
                            return;
                          }
                          if(backFile == null){
                            Fluttertoast.showToast(msg: MyStrings.instance.uploadBackImage);
                            return;
                          }
                          if(checkBoxValue != true){
                            Fluttertoast.showToast(msg: MyStrings.instance.acceptArgument);
                            return;
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context) => VerifiedScreen()));
                        })
                    )
                  ],
                ),
              )
          
            ],
          ),
        ),
      ),
    );
  }
}
