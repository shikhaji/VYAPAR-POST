import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vyapar_post/widget/primary_button.dart';


import '../models/profile_contant_model.dart';
import '../routs/app_routs.dart';
import '../services/api_services.dart';
import '../services/shared_preferences.dart';
import '../utils/app_asset.dart';
import '../utils/app_color.dart';
import '../utils/app_sizes.dart';
import '../utils/app_text_style.dart';
import '../utils/screen_utils.dart';
import 'Dailog/cofirm_popup.dart';
import 'custom_sized_box.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Profile? getProfileData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiService().profileContant(context).then((value) {
      setState(() {
        getProfileData = value?.message?.profile;
      });
    }
    );
  }
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
                      title: 'Edit Profile',
                      onTap: () async {
                        Navigator.pushNamed(context, Routs.editProfileScreen);
                      },
                      child: Icon(Icons.perm_identity),
                    ),
                    _DrawerMenuListTile.asset(
                      title: 'FAQ',
                      onTap: () async {
                        Navigator.pushNamed(context,Routs.fQuestionScreen);
                      },
                      child: Icon(Icons.question_answer_outlined),
                    ),
                    _DrawerMenuListTile.asset(
                      title: 'Terms & Conditions',
                      onTap: () async {
                        _launchURLBrowser("https://khojloindia.in/terms-conditions.html");
                      },
                      child: Icon(Icons.local_police_outlined),
                    ),
                    _DrawerMenuListTile.asset(
                      title: 'Privacy Policy',
                      onTap: () async {
                        _launchURLBrowser("https://khojloindia.in/privacy-policy.html");
                      },
                      child: Icon(Icons.policy),
                    ),
                    _DrawerMenuListTile.asset(
                      title: 'About Us',
                      onTap: () async {
                        _launchURLBrowser("https://khojloindia.in/about-us.html");
                      },
                      child: const Icon(Icons.account_box),
                    ),
                    _DrawerMenuListTile.asset(
                      title: 'Subscription Plan',
                      onTap: () async {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routs.subscriptionPlanScreen, (route) => false);
                      },
                      child: const Icon(Icons.subscriptions),
                    ),
                    ScreenUtil().setVerticalSpacing(30),
                    SizedBox(
                      height: Sizes.s40.h,
                      width: ScreenUtil().screenWidth - 200,
                      child: PrimaryButton(
                        lable: 'Logout',
                        onPressed: (){

                          ConfirmPopUp.show(context, 'Logout',
                              'Are you sure you want to logout?')
                              .then((value) async {
                            if (value == true) {
                              Preferances.clearAllPref();
                              Navigator.pushNamedAndRemoveUntil(
                                  context, Routs.loginScreen, (route) => false);
                            }
                          });
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

  }

  _launchURLBrowser(String link) async {
    var url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
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

                ScreenUtil().setVerticalSpacing(10),
                Center(
                  child:  Container(
                      height: Sizes.s80.h,
                      width: Sizes.s80.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: getProfileData?.branchPhoto != ""
                              ? DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://khojloindia.in//uploads/${getProfileData?.branchPhoto}" ?? ""),
                          )
                              : DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AppAsset.dummyAvatar),
                          ))),
                ),

                SizedBoxH10(),
                Center(
                  child: Text(
                    "${getProfileData?.branchName ?? ""}",
                    style: AppTextStyle.appBarTextTitle
                        .copyWith(color: AppColor.white),
                  ),
                ),
                SizedBoxH6(),
                Center(
                  child: Text(
                    "${getProfileData?.branchEmail ?? ""}",
                    style: AppTextStyle.lable.copyWith(color: AppColor.white),
                  ),
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