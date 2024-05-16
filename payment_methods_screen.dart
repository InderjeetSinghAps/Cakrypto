import 'package:cakrypto/helper_classes/button.dart';
import 'package:cakrypto/helper_classes/my_app_bar.dart';
import 'package:cakrypto/singleton_classes/colors.dart';
import 'package:cakrypto/singleton_classes/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: Stack(
        children: [
          Column(
            children: [
              MyAppBar(title: MyStrings.instance.paymentMethonds),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: MyColors.instance.uploadButtonColor
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(MyStrings.instance.linkYourcreditCardMasterCardDebitCardOrPaypal,
                                      style: TextStyle(color: MyColors.instance.grey80),),
                                  Row(
                                    children: [
                                      Text(MyStrings.instance.linkNow,
                                        style: TextStyle(color: MyColors.instance.yellowColor),),
                                      SizedBox(width: 10),
                                      Icon(Icons.arrow_forward_ios, size:13, color: MyColors.instance.yellowColor)
                                    ]
                                  )
                                ],
                              )
                          ),
                          Expanded(
                              flex: 2,
                              child: Center(child: Image.asset("assets/images/payment_method.png"))
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      child: Text(MyStrings.instance.linkedCard, style: TextStyle(color: MyColors.instance.white, fontWeight: FontWeight.w600),),
                    ),
                    CreditCardWidget(
                      cardNumber: MyStrings.instance.creditCardNo,
                      expiryDate: MyStrings.instance.creditCardExpiryDate,
                      cardHolderName: MyStrings.instance.creditCardHolderName,
                      cvvCode: MyStrings.instance.creditCardCvvCode,
                      labelValidThru: MyStrings.instance.creditCardValidThru,
                      showBackView: false, //true when you want to show cvv(back) view
                      onCreditCardWidgetChange: (CreditCardBrand brand) {}, // Callback for anytime credit card brand is changed
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 20,
              left: 20,
              right: 20,
              child: MyButton(
                onTap: (){},
                buttonText: MyStrings.instance.addANewCard,)
          )
        ],
      ),
    );
  }
}
