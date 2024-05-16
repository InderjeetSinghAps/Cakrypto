import 'package:flutter/material.dart';

import '../helper_classes/my_app_bar.dart';
import '../singleton_classes/colors.dart';
import '../singleton_classes/strings.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundBlackColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(title: MyStrings.instance.termsAndPrivacy),
              SizedBox(height: 30,),
              Text("Acceptance of Terms", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: MyColors.instance.white),),
              SizedBox(height: 3,),
              Text("These Terms and Conditions (“Terms”) govern your relationship with The Crypto App (the “Service”) provided by 12170639 CANADA INC. DBA TRUSTSWAP, located in Canada (“us”, “we”, or “our”). Please read these Terms carefully before using the Service. Your access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service. By accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of these Terms then you may not access the Service."
                , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: MyColors.instance.white), textAlign: TextAlign.justify),
              SizedBox(height: 20,),
              Text("Use License", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: MyColors.instance.white),),
              Text("If you access the Service via a mobile application, then we grant you a revocable, non- exclusive, non-transferable, limited right to install and use the mobile application on wireless electronic devices owned or controlled by you, and to access and use the mobile application on such devices strictly in accordance with the terms and conditions of this mobile application license contained in these Terms. You shall not: (1) decompile, reverse engineer, disassemble, copy, store, or attempt to derive the source code of, or decrypt the application, content or Service; (2) make any modification, adaptation, improvement, enhancement, translation, copy, or derivative work from the application or Service; (3) violate any applicable laws, rules, or regulations in connection with your access or use of the application or Service; (4) remove, alter, or obscure any proprietary notice (including any notice of copyright or trademark) posted by us or the licensors of the application, content or Service; (5) use the application, content or Service for any revenue generating endeavor, commercial enterprise, or other purpose for which it is not designed or intended; (6) make the application or Service available over a network or other environment permitting access or use by multiple devices or users at the same time; (7) use the application, content or Service for creating a product, service, or software that is, directly or indirectly, competitive with or in any way a substitute for the application; (8) use the application or Service to send automated queries to any website or to send any unsolicited commercial e-mail; or (9) use any proprietary information or any of our interfaces or our other intellectual property in the design, development, manufacture, licensing, or distribution of any applications, accessories, or devices for use with the application or Service."
                , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: MyColors.instance.white), textAlign: TextAlign.justify,),
              SizedBox(height: 20,),
              Text("Provided Services", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: MyColors.instance.white),),
              Text("The Service is an intermediary service, connecting the users with crypto currencies that are made available through other third party networks, which we do not own or control. You are invited to connect all your third party wallets and exchanges to the Service and create a wallet provided by a third party, which may allow you to buy, sell, swap, track and earn on the crypto from its own interface or network, which we do not own or control.The Service is not a platform on which you may purchase, sell and/or swap cryptocurrencies or digital assets, but the Service is merely an intermediary to connect you to other third party services.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: MyColors.instance.white), textAlign: TextAlign.justify,),


            ],
          ),
        ),
      ),
    );
  }
}
