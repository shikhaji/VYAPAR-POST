import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_post/widget/scroll_view.dart';

import '../../utils/app_color.dart';
import '../../utils/app_text.dart';
import '../../utils/app_text_style.dart';
import '../../utils/constant.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/primary_button.dart';

class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScroll(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBoxH28(),
            SizedBoxH28(),
            SizedBoxH14(),
            Center(
                child: appText("Vyapar Post",style: AppTextStyle.appName)),

            SizedBoxH28(),
            SizedBoxH28(),
            SizedBoxH18(),

            appText("Subscribe your account",style: AppTextStyle.title),
            SizedBoxH6(),
            appText("Please subscribe your account to post ads",style: AppTextStyle.subTitle),
            SizedBoxH28(),
            SizedBoxH28(),
            orderListContainer("850"),
            SizedBoxH28(),
            SizedBoxH28(),
            SizedBoxH28(),

            Center(
              child: SizedBox(
                width: 200,
                child: PrimaryButton(
                    lable: "Subscribe now",
                    onPressed: (){


                    }),
              ),
            ),


          ]
      ),
    );
  }

  Widget orderListContainer(String? balance,) {
    return Center(
      child: Container(
        width: 280,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColor.drawerBackground,
            borderRadius: BorderRadius.circular(textFieldBorderRadius),
            border: Border.all(color: AppColor.primaryColor)),
        child: Padding(
          padding: const EdgeInsets.all(70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              SizedBoxH10(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Flexible(child: Text("Subscribe now",style: AppTextStyle.timeTitle.copyWith(color: AppColor.white))),
                  // Icon(Icons.account_balance_wallet_outlined,color: AppColor.white,)
                ],
              ),

              SizedBoxH20(),
              Align(alignment: Alignment.center,
                  child: Text("Only at 49/-",style: AppTextStyle.timeTitle.copyWith(color: AppColor.white),)),
              SizedBoxH10(),
            ],
          ),
        ),
      ),
    );
  }
}
