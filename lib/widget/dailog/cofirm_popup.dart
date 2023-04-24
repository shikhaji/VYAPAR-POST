import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_sizes.dart';
import '../custom_sized_box.dart';
import '../primary_button.dart';


class ConfirmPopUp extends StatefulWidget {
  final String title;
  final String subTitle;
  const ConfirmPopUp({super.key, required this.title, required this.subTitle});

  static Future<bool> show(
      BuildContext context, String title, String subTitle) async {
    return await showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => ConfirmPopUp(title: title, subTitle: subTitle),
    );
  }

  @override
  State<ConfirmPopUp> createState() => _ConfirmPopUpState();
}

class _ConfirmPopUpState extends State<ConfirmPopUp> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: Sizes.s26.w,
            vertical: Sizes.s20.h,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.s12.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.s18.w,
              vertical: Sizes.s20.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAsset.yesOrNoIcon,
                  height: Sizes.s68,
                ),
                SizedBoxH28(),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: Sizes.s20.sp,
                    fontWeight: FontWeight.w700,
                    // color: const Color(0xff1D2125),
                  ),
                ),
                SizedBoxH14(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.s24.w),
                  child: Text(
                    widget.subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Sizes.s14.sp,
                      fontWeight: FontWeight.w400,
                      // /color: const Color(0xff1D2125),
                    ),
                  ),
                ),
                SizedBoxH28(),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        color: AppColor.red,
                        onPressed: () => Navigator.pop(context, false), lable: 'No',
                      ),

                    ),
                    SizedBoxW10(),
                    Expanded(
                      child: PrimaryButton(
                        color: AppColor.green,
                        onPressed: () => Navigator.pop(context, true), lable: 'Yes',

                      ),
                    )
                  ],
                ),
                SizedBoxH10(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
