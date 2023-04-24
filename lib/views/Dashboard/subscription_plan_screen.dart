import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../models/get_plan_model.dart';
import '../../routs/app_routs.dart';
import '../../services/api_services.dart';
import '../../services/shared_preferences.dart';
import '../../utils/app_color.dart';
import '../../utils/app_text.dart';
import '../../utils/app_text_style.dart';
import '../../utils/constant.dart';
import '../../widget/Dailog/cofirm_popup.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/primary_button.dart';
import '../../widget/scroll_view.dart';

class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {

  List<PlanList> getPlanData=[];
  late var _razorpay;
  String? paymentId;
  String? loginId;
  @override
  void initState() {
    // TODO: implement initState

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    GetPlanApi();
    super.initState();
  }

  Future GetPlanApi() async {
    loginId = await Preferances.getString("userId");
    ApiService().getPlanApi(context,1).then((value){
      setState(() {
        getPlanData=value!.message!.planList;
      });
      print(getPlanData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScroll(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBoxH28(),
            SizedBoxH28(),

            Center(
                child: appText("vyapar post",style: AppTextStyle.appName)),

            SizedBoxH28(),

            appText("Membership Plans",style: AppTextStyle.title),
            SizedBoxH6(),
            appText("Please take Membership to become member",style: AppTextStyle.subTitle),
            SizedBoxH28(),

            Column(
              children: [
                ListView.builder(
                  // padding: EdgeInsets.symmetric(vertical: Sizes.s10.h),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: getPlanData.length,
                  itemBuilder: (context, inx) {
                    return GetPlan(
                      name:getPlanData[inx].vcpPlanName,
                      offer:getPlanData[inx].vcpOffferPrice,
                      discount:getPlanData[inx].vcpDiscountPercentage,
                      time:getPlanData[inx].vcpMonth,
                      amount:getPlanData[inx].vcpDiscountPrice,

                    );


                  },

                ),
              ],
            ),

            SizedBoxH28(),

            // Center(
            //   child: SizedBox(
            //     width: 200,
            //     child: PrimaryButton(
            //         lable: "Subscribe now",
            //         onPressed: (){
            //           var options = {
            //             'key': 'rzp_test_YoriHE0YT6XVEs',
            //             'amount': 200 * 100,
            //             'name': 'AICCPO',
            //             'description': 'Payment',
            //             'send_sms_hash': true,
            //             'prefill': {
            //               'contact': 'Yashil Patel',
            //               'email': 'yp@gmail.com',
            //               'phone': '9979999799',
            //             },
            //           };
            //           _razorpay.open(options);
            //
            //         }),
            //   ),
            // ),
            SizedBoxH20(),


          ]
      ),
    );
  }

  Widget GetPlan({
    required String offer,
    required String discount,
    required String name,
    required String time,
    required String amount,
  }){
    print("offer:${offer}");
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          // Container(
          //   height:80,
          //   width: 105,
          //   decoration: const BoxDecoration(
          //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //     color: Colors.grey,
          //   ),
          //   child:Image.network("https://khojloindia.in//uploads/642ffef4f32ec.png",height: 70,fit: BoxFit.fill,),
          // ),
          GestureDetector(
            onTap: (){
              ConfirmPopUp.show(context, 'Membership',
                  'Do you want to continue....').then((value){
                if (value == true){
                  print(" rpay amount here: ${amount * 100}");
                  print(" rpay amount here: ${amount}");
                  var options = {
                    'key': 'rzp_test_YoriHE0YT6XVEs',
                    'amount': int.parse(amount) * 100,
                    'name': 'vyapar post',
                    'description': 'Payment',
                    'send_sms_hash': true,
                    'prefill': {
                      'contact': 'Yashil Patel',
                      'email': 'yp@gmail.com',
                      'phone': '9979999799',
                    },
                  };
                  _razorpay.open(options);
                }

              });
            },

            child: Container(
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColor.textFieldColor,
                  borderRadius: BorderRadius.circular(textFieldBorderRadius),
                  border: Border.all(color: AppColor.textFieldColor)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Plan Type : ${name}",style: AppTextStyle.bigTextTile.copyWith(color: AppColor.primaryBlue),),

                        Divider(),

                        Text("Duration : ${time} Month",style: AppTextStyle.appBarTitle,),
                        SizedBoxH8(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text("Price: ${offer}",style:AppTextStyle.appBarTitle, ),
                              // Icon(Icons.account_balance_wallet_outlined,color: AppColor.white,],
                            ),
                            Flexible(
                              child: Text(" ${discount} off",style:AppTextStyle.appBarTitle.copyWith(color: AppColor.red),  ),
                              // Icon(Icons.account_balance_wallet_outlined,color: AppColor.white,],
                            )],

                        ),
                        SizedBoxH6(),
                        Text("Total Amount : ${amount}",style: AppTextStyle.appBarTitle,),

                      ],
                    )],
                ),
              ),
            ),
          ),
          SizedBoxH8(),

        ],
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    paymentId = response.paymentId;

    try {
      ApiService()
          .subscriptionPayment(context,
          data: FormData.fromMap({
            "loginid": loginId!.replaceAll('"', '').replaceAll('"', '').toString(),
            "planid": 220,
            "transaction_id": paymentId,
            "days": 1,
          }))
          .then((value) {
        print("api call done");

        //Navigator.pushNamed(context, Routs.transactionHistory);

      });
    } catch (e) {
      debugPrint("errror here:=${e.toString()}");
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: 'Payment Failed',
      backgroundColor: Colors.grey,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

}
