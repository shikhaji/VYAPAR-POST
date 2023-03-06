import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_post/widget/custom_sized_box.dart';

import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_text_style.dart';
import '../../widget/scroll_view.dart';

class OnBoardingScreen2 extends StatefulWidget {
  const OnBoardingScreen2({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen2> createState() => _OnBoardingScreen2State();
}

class _OnBoardingScreen2State extends State<OnBoardingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScroll(
        children: [
          SizedBoxH10(),
          Image.asset(AppAsset.obs1),
          RichText(
            text: TextSpan(children: [
              TextSpan(text: 'ऐसा', style: TextStyle(
                  fontSize: 26,
                  color: AppColor.black,
                  fontWeight: FontWeight.w400
              )),
              TextSpan(text: '  Social platform', style: TextStyle(
                  fontSize: 24,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600
              )),
              TextSpan(text: '  जो आपके', style: TextStyle(
                  fontSize: 26,
                  color: AppColor.black,
                  fontWeight: FontWeight.w400
              )),

            ]),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(text: 'Business', style: TextStyle(
                  fontSize: 24,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600
              )),
              TextSpan(text: '  को करे', style: TextStyle(
                  fontSize: 26,
                  color: AppColor.black,
                  fontWeight: FontWeight.w400
              )),
              TextSpan(text: '  Promote', style: TextStyle(
                  fontSize: 24,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600
              )),

            ]),
          ),
          SizedBoxH20(),
          RichText(
            text: TextSpan(children: [
              TextSpan(text: 'आपकी पोस्ट आपके ग्राहक को पसंद आने', style: TextStyle(
                  fontSize: 22,
                  color: AppColor.black,
                  fontWeight: FontWeight.w100
              )),
            ]),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(text: '   पर वह कर सकता है आपको सीधे', style: TextStyle(
                  fontSize: 22,
                  color: AppColor.black,
                  fontWeight: FontWeight.w100
              )),
            ]),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(text: '  Call', style: TextStyle(
                  fontSize: 22,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w300
              )),
              TextSpan(text: ' और ', style: TextStyle(
                  fontSize: 20,
                  color: AppColor.black,
                  fontWeight: FontWeight.w100
              )),
              TextSpan(text: ' Whatsapp ', style: TextStyle(
                  fontSize: 22,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w300
              )),
            ]),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(text: ' इससे आपका बिजनेस होगा प्रमोट। ', style: TextStyle(
                  fontSize: 20,
                  color: AppColor.black,
                  fontWeight: FontWeight.w100
              )),

            ]),
          ),

          // Text("AD Post", style: TextStyle(
          //     fontSize: 26,
          //     color: AppColor.primaryColor,
          //     fontWeight: FontWeight.w900
          // )),
          // Text("करके अपने", style: TextStyle(
          //     fontSize: 22,
          //     color: AppColor.black,
          //     fontWeight: FontWeight.w400
          // )),

        ],

      ),
    );
  }
}
