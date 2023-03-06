import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_post/widget/custom_sized_box.dart';

import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_text_style.dart';
import '../../widget/scroll_view.dart';

class OnBoardingScreen3 extends StatefulWidget {
  const OnBoardingScreen3({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen3> createState() => _OnBoardingScreen3State();
}

class _OnBoardingScreen3State extends State<OnBoardingScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScroll(
        children: [
          SizedBoxH20(),
          Image.asset(AppAsset.obs3),
          SizedBoxH28(),
          SizedBoxH18(),
          Text("Low Cost & Effactive Marketing", style: TextStyle(
              fontSize: 20,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w700
          )),
          SizedBoxH28(),
          Text("बहुत ही कम बजट मै करे, अपने बिजनेस की", style: TextStyle(
              fontSize: 18,
              color: AppColor.orange,
              fontWeight: FontWeight.w100
          )),
          Text("Effactive Marketing", style: TextStyle(
              fontSize: 18,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w100
          )),



        ],

      ),
    );
  }
}
