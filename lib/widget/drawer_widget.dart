import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vyapar_post/utils/app_color.dart';
import 'package:vyapar_post/widget/primary_button.dart';
import 'package:vyapar_post/widget/scroll_view.dart';

import '../utils/app_asset.dart';
import '../utils/app_sizes.dart';
import '../utils/app_text_style.dart';
import '../utils/screen_utils.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Column(
        children: [
          _buildDrawerHeader(),
          Expanded(
            child: SafeArea(
              top: false,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ScreenUtil().setVerticalSpacing(20),
                    _DrawerMenuListTile.asset(
                      title: 'Terms & Conditions',
                      onTap: () async {

                      },
                      child: Icon(Icons.local_police_outlined),
                    ),
                    _DrawerMenuListTile.asset(
                      title: 'Privacy Policy',
                      onTap: () async {

                      },
                      child: Icon(Icons.policy),
                    ),
                    _DrawerMenuListTile.asset(
                      title: 'About Us',
                      onTap: () async {

                      },
                      child: const Icon(Icons.account_box),
                    ),
                    _DrawerMenuListTile.asset(
                      title: 'Payment Refund',
                      onTap: () async {

                      },
                      child: const Icon(Icons.payment),
                    ),
                    ScreenUtil().setVerticalSpacing(30),
                    SizedBox(
                      height: Sizes.s40.h,
                      width: ScreenUtil().screenWidth - 200,
                      child: PrimaryButton(
                        lable: 'Logout',
                        onPressed: (){

                        },
                      ),
                    ),
                    ScreenUtil().setVerticalSpacing(5),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // Widget _buildDrawerHeader() {
    //   return SizedBox(
    //     height: Sizes.s240.h,
    //     child: Container(
    //
    //       decoration: BoxDecoration(
    //         color: AppColor.drawerBackground,
    //         borderRadius: BorderRadius.only(topLeft:Radius.zero,topRight: Radius.circular(18),bottomLeft: Radius.circular(25),bottomRight:  Radius.circular(25),),
    //       ),
    //       child: Align(
    //         alignment: Alignment.centerLeft,
    //         child: Padding(
    //           padding: EdgeInsets.symmetric(horizontal: Sizes.s20.w),
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Container(
    //                   height: Sizes.s80.h,
    //                   width: Sizes.s80.h,
    //                   decoration: BoxDecoration(
    //                       shape: BoxShape.circle,
    //                       image: DecorationImage(
    //                         image: AssetImage(AppAsset.mainLogoImage),
    //                         fit: BoxFit.cover,
    //                       ))),
    //               ScreenUtil().setVerticalSpacing(10),
    //               Text(
    //                 "${myProfileData?.branchName ?? ""}",
    //                 style: AppTextStyle.appBarTextTitle
    //                     .copyWith(color: AppColor.white),
    //               ),
    //               Text(
    //                 "${myProfileData?.branchEmail ?? ""}",
    //                 style: AppTextStyle.lable.copyWith(color: AppColor.white),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }

  }
  Widget _buildDrawerHeader() {
    return SizedBox(
      height: Sizes.s240.h,
      child: Container(

        decoration: BoxDecoration(
          color: AppColor.drawerBackground,
          borderRadius: BorderRadius.only(topLeft:Radius.zero,topRight: Radius.circular(18),bottomLeft: Radius.circular(25),bottomRight:  Radius.circular(25),),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.s20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //     height: Sizes.s80.h,
                //     width: Sizes.s80.h,
                //     decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         image: DecorationImage(
                //           image: AssetImage(AppAsset.0),
                //           fit: BoxFit.cover,
                //         ))),
                ScreenUtil().setVerticalSpacing(10),
                Text(
                  "Vidhi patel",
                  style: AppTextStyle.appBarTextTitle
                      .copyWith(color: AppColor.white),
                ),
                Text(
                  "vidhi12@gmail.com",
                  style: AppTextStyle.lable.copyWith(color: AppColor.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
class _DrawerMenuListTile extends StatelessWidget {
  final Widget child;
  final String title;
  final VoidCallback onTap;

  _DrawerMenuListTile.asset({
    required this.onTap,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: child,
      title: Text(
        title,
        style: AppTextStyle.lable,
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.black,
      ),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}