
import 'package:flutter/material.dart';


import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/scroll_view.dart';

class OnBoardingScreen1 extends StatefulWidget {
  const OnBoardingScreen1({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen1> createState() => _OnBoardingScreen1State();
}

class _OnBoardingScreen1State extends State<OnBoardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScroll(
        children: [
          SizedBoxH8(),
          Image.asset(AppAsset.obssceen1),
          RichText(
            text: const TextSpan(children: [
              TextSpan(text: 'AD Post', style: TextStyle(
                  fontSize: 26,
                  color: AppColor.primaryBlue,
                  fontWeight: FontWeight.w600
              )),
              TextSpan(text: '  करके अपने', style: TextStyle(
                  fontSize: 26,
                  color: AppColor.black,
                  fontWeight: FontWeight.w400
              )),

            ]),
          ),
          RichText(
            text: const TextSpan(children: [
              TextSpan(text: 'Business', style: TextStyle(
                  fontSize: 26,
                  color: AppColor.primaryBlue,
                  fontWeight: FontWeight.w600
              )),
              TextSpan(text: '  को बढाएं', style: TextStyle(
                  fontSize: 26,
                  color: AppColor.black,
                  fontWeight: FontWeight.w400
              )),

            ]),
          ),
          SizedBoxH20(),
          RichText(
            text: const TextSpan(children: [
              TextSpan(text: 'Facebook', style: TextStyle(
                  fontSize: 22,
                  color: AppColor.orange,
                  fontWeight: FontWeight.w300
              )),
              TextSpan(text: ' और', style: TextStyle(
                  fontSize: 20,
                  color: AppColor.black,
                  fontWeight: FontWeight.w100
              )),
              TextSpan(text: ' Instagram', style: TextStyle(
                  fontSize: 22,
                  color: AppColor.orange,
                  fontWeight: FontWeight.w300
              )),
              TextSpan(text: ' की तरह', style: TextStyle(
                  fontSize: 20,
                  color: AppColor.black,
                  fontWeight: FontWeight.w100
              )),
            ]),
          ),
          RichText(
            text: const TextSpan(children: [
              TextSpan(text: 'Vyapar Post', style: TextStyle(
                  fontSize: 26,
                  color: AppColor.primaryBlue,
                  fontWeight: FontWeight.w500
              )),
              TextSpan(text: ' App', style: TextStyle(
                  fontSize: 22,
                  color: AppColor.black,
                  fontWeight: FontWeight.w400
              )),
              TextSpan(text: ' पर अपने बिजनेस ', style: TextStyle(
                  fontSize: 20,
                  color: AppColor.black,
                  fontWeight: FontWeight.w100
              )),
            ]),
          ),
          RichText(
            text: const TextSpan(children: [
              TextSpan(text: 'की पोस्ट अपलोड करे और अपने', style: TextStyle(
                  fontSize: 20,
                  color: AppColor.black,
                  fontWeight: FontWeight.w100
              )),
              TextSpan(text: ' Business', style: TextStyle(
                  fontSize: 23,
                  color: AppColor.primaryBlue,
                  fontWeight: FontWeight.w400
              )),
            ]),
          ),
          RichText(
            text: const TextSpan(children: [
              TextSpan(text: 'को', style: TextStyle(
                  fontSize: 20,
                  color: AppColor.black,
                  fontWeight: FontWeight.w100
              )),
              TextSpan(text: ' Brand', style: TextStyle(
                  fontSize: 23,
                  color: AppColor.primaryBlue,
                  fontWeight: FontWeight.w400
              )),
              TextSpan(text: ' बनाऐ', style: TextStyle(
                  fontSize: 20,
                  color: AppColor.black,
                  fontWeight: FontWeight.w100
              )),
            ]),
          ),

        ],

      ),
    );
  }
}
