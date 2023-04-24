import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/get_current_balance.dart';
import '../../routs/app_routs.dart';
import '../../services/api_services.dart';
import '../../services/shared_preferences.dart';
import '../../utils/app_color.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_style.dart';
import '../../utils/constant.dart';
import '../../utils/screen_utils.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/drawer_widget.dart';
import '../../widget/primary_appbar.dart';
import '../../widget/primary_button.dart';
import '../../widget/primary_textfield.dart';
import '../../widget/scroll_view.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final TextEditingController _amountController = TextEditingController();
  late String loginId ;
  String? balance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetCurrentBalance();
  }
  Future<void> GetCurrentBalance()async {
    String? id = await Preferances.getString("userId");
    setState(() {
      loginId = id!;
    });
    FormData data() {
      print(id!.replaceAll('"', '').replaceAll('"', '').toString());
      return FormData.fromMap({
        "loginid" : id!.replaceAll('"', '').replaceAll('"', '').toString(),
      });
    }

    ApiService().getCurrentBalance(context,data:data()).then((value){
      setState(() {
        balance = value!.balance;
      });
      print("balance = ${balance}");
    });


    }

  @override
  Widget build(BuildContext context){
  return Scaffold(
  backgroundColor: AppColor.white,
  body: SafeArea(
  child: CustomScroll(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  SizedBoxH28(),
  orderListContainer(balance),
  SizedBoxH28(),

  Padding(
  padding: EdgeInsets.symmetric(horizontal: 12),
  child: Container(
  padding: EdgeInsets.all(12),
  width: double.infinity,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(12),
  border: Border.all(color: Colors.black12)),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  SizedBoxH10(),
  Text(
  "Add Amount",
  style: AppTextStyle.appBarTextTitle,
  ),
  SizedBoxH20(),

  PrimaryTextField(
  controller: _amountController,
    hintText: "Enter Amount",
    prefix: const Icon(Icons.currency_rupee),
    textInputAction: TextInputAction.next,
    keyboardInputType: TextInputType.phone,


  ),
  // TextFormField(
  //     obscureText: true,
  //     style: TextStyle(fontSize: 16),
  //     controller: _amountController,
  //     textInputAction: TextInputAction.next,
  //     decoration: InputDecoration(
  //       hintText: "Enter amount",
  //
  //       isDense: true,
  //       enabledBorder: OutlineInputBorder(
  //           borderRadius:
  //           BorderRadius.circular(12.0),
  //           borderSide: BorderSide(
  //               width: 0.8, color: Colors.black12)),
  //       focusedBorder: OutlineInputBorder(
  //           borderRadius:
  //           BorderRadius.circular(8.0),
  //           borderSide: BorderSide(
  //               width: 1.5, color: Colors.black12)),
  //
  //       //  hintStyle: CustomTextstyleTheme.inputFieldHintStyle,
  //     )),

  SizedBoxH20(),
  Text(
  "Quick ammount",
  style: AppTextStyle.appBarTextTitle,
  ),
  SizedBoxH28(),
  Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Container(
  padding: EdgeInsets.all(12),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(12),
  border:
  Border.all(color: Colors.black12)),
  child: FittedBox(
  child: Text("500"),
  ),
  ),
  Container(
  padding: EdgeInsets.all(12),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(12),
  border:
  Border.all(color: Colors.black12)),
  child: FittedBox(
  child: Text("1000"),
  ),
  ),
  Container(
  padding: EdgeInsets.all(12),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(12),
  border:
  Border.all(color: Colors.black12)),
  child: FittedBox(
  child: Text("2000"),
  ),
  ),
  Container(
  padding: EdgeInsets.all(12),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(12),
  border:
  Border.all(color: Colors.black12)),
  child: FittedBox(
  child: Text("2500"),
  ),
  )
  ],
  ),
  SizedBoxH28(),
  PrimaryButton(
  lable: 'continue',
  onPressed: () {
    FormData data() {
    print("loginId = $loginId");
    return FormData.fromMap({
      "loginid" : loginId,
      "transactionid" : "123",
      "cwt_amount" : _amountController.text.trim(),
      "payment_type" : 1,
    });
    }
    ApiService().updateProfile(context,data:data());
  },
  ),
  ],
  ),
  ),),
  ],

  )),
  appBar: AppBar(
  title: Text("Wallet"),
  ),
    drawer: Drawer(
    backgroundColor: Colors.white,
    elevation: 0,
    width: ScreenUtil().screenWidth * 0.8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(Sizes.s20.r),
        bottomRight: Radius.circular(Sizes.s20.r),
      ),
    ),
    child: const DrawerWidget(),
  ),

    );

}
Widget orderListContainer(String? balance,) {
  return Container(
    width: double.infinity,
    alignment: Alignment.topLeft,
    decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(textFieldBorderRadius),
        border: Border.all(color: AppColor.primaryColor)),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          SizedBoxH10(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Balance available",style: AppTextStyle.appBarTextTitle.copyWith(color: AppColor.white)),
              Icon(Icons.account_balance_wallet_outlined,color: AppColor.white,)
            ],
          ),

          SizedBoxH20(),
          Align(alignment: Alignment.topLeft,
              child: Text("₹${balance}",style: AppTextStyle.bigTextTile.copyWith(color: AppColor.white),)),
          SizedBoxH10(),
        ],
      ),
    ),
  );
}

}

