import 'package:cakrypto/helper_classes/my_app_bar.dart';
import 'package:cakrypto/screens/verify_upload_document_screen.dart';
import 'package:cakrypto/singleton_classes/colors.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../helper_classes/button.dart';

class VerifyChooseDocumentScreen extends StatefulWidget {
  const VerifyChooseDocumentScreen({super.key});

  @override
  State<VerifyChooseDocumentScreen> createState() => _VerifyChooseDocumentScreenState();
}

class _VerifyChooseDocumentScreenState extends State<VerifyChooseDocumentScreen> {

  bool checkBoxValue = false;
  int? selectedIndex;
  var myCountry;
  var outlinedBoxDecoration = BoxDecoration(
      border: Border.all(color: MyColors.instance.yellowColor),
      borderRadius: BorderRadius.circular(15)
  );
  var filledBoxDecoration = BoxDecoration(
      color: MyColors.instance.uploadButtonColor,
      borderRadius: BorderRadius.circular(15)
  );

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(title: MyStrings.instance.verifyAccount),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Text(MyStrings.instance.selectCountryOfResidence, style: TextStyle(color: MyColors.instance.white, fontSize: 16, fontWeight: FontWeight.w600),),
                    SizedBox(height: 20),
                    Stack(
                      children: [
                        Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(15),
                              border: Border.all(color: MyColors.instance.grey80, width: 2)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(myCountry==null ? MyStrings.instance.selectCountry : myCountry, style: TextStyle(color: MyColors.instance.grey80),),
                              ),
        
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: CountryCodePicker(
                            showDropDownButton: true,
                            textStyle: TextStyle(color: MyColors.instance.white, ),
                            dialogBackgroundColor: MyColors.instance.backgroundBlackColor,
                            dialogTextStyle: TextStyle(color: MyColors.instance.white),
                            hideMainText: true,
                            showFlag: false,
                            onChanged: (selectedCountry){
                              myCountry = selectedCountry.name!;
                              setState(() {});
                            },
                            initialSelection: 'In',
                            favorite: ['+91','IN'],
                            showCountryOnly: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(MyStrings.instance.selectValidGovernmentIssuedDocument, style: TextStyle(color: MyColors.instance.white, fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedIndex=0;
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: selectedIndex==0 ? outlinedBoxDecoration : filledBoxDecoration,
                        child: Row(
                          children:[
                            SizedBox(width: 10),
                            Icon(Icons.person, color: selectedIndex==0 ? MyColors.instance.yellowColor : MyColors.instance.grey80,),
                            SizedBox(width: 10),
                            Text(MyStrings.instance.identifyCard, style: TextStyle(
                              color: selectedIndex==0 ? MyColors.instance.yellowColor : MyColors.instance.grey80,
                            ),)
                          ]
                        )
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedIndex=1;
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: selectedIndex==1 ? outlinedBoxDecoration : filledBoxDecoration,
                        child: Row(
                              children:[
                                SizedBox(width: 10),
                                Icon(Icons.supervisor_account, color: selectedIndex==1 ? MyColors.instance.yellowColor : MyColors.instance.grey80,),
                                SizedBox(width: 10),
                                Text(MyStrings.instance.passport, style: TextStyle(
                                  color: selectedIndex==1 ? MyColors.instance.yellowColor : MyColors.instance.grey80,
                                ),)
                              ]
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedIndex=2;
                        });
                      },
                      child: Container(
                          height: 50,
                          decoration: selectedIndex==2 ? outlinedBoxDecoration : filledBoxDecoration,
                          child: Row(
                              children:[
                                SizedBox(width: 10),
                                Icon(Icons.credit_card, color: selectedIndex==2 ? MyColors.instance.yellowColor : MyColors.instance.grey80,),
                                SizedBox(width: 10),
                                Text(MyStrings.instance.driverLicence, style: TextStyle(
                                  color: selectedIndex==2 ? MyColors.instance.yellowColor : MyColors.instance.grey80,
                                ),)
                              ]
                          )
                      ),
                    ),
                    SizedBox(height: 150),
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
                    SizedBox(height: 10),
                    Container(
                        width: double.infinity,
                        child: MyButton(buttonText: MyStrings.instance.continue_, onTap: (){
                          if(myCountry == null){
                            Fluttertoast.showToast(msg: MyStrings.instance.selectCountry);
                            return;
                          }
                          if(checkBoxValue != true){
                            Fluttertoast.showToast(msg: MyStrings.instance.acceptArgument);
                            return;
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyUploadDocumentScreen()));
                        })
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
