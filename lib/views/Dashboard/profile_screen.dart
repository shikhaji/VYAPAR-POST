import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routs/app_routs.dart';
import '../../utils/app_color.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_style.dart';
import '../../utils/screen_utils.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/drawer_widget.dart';
import '../../widget/primary_appbar.dart';
import '../../widget/scroll_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
        body: CustomScroll(
          children: [
            SizedBoxH34(),
            // Center(
            //   child: Container(
            //       height: Sizes.s100.h,
            //       width: Sizes.s100.h,
            //       decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           image: DecorationImage(
            //             image: AssetImage(AppAsset.mainLogoImage),
            //             fit: BoxFit.cover,
            //           ))),
            // ),
            SizedBoxH10(),
            SizedBoxH20(),
            SizedBoxH20(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.textFieldColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: _ProfileListTile.asset(
                title: 'Edit Profile',
                onTap: () {
                  // Navigator.pushNamed(context, Routs.editProfile,);
                },
                child: Icon(Icons.perm_identity),
              ),
            ),
            SizedBoxH18(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.textFieldColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: _ProfileListTile.asset(
                title: 'FAQ',
                onTap: () {

                },
                child: Icon(Icons.format_list_bulleted_sharp),
              ),
            ),
            SizedBoxH18(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.textFieldColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: _ProfileListTile.asset(
                title: 'Terms & Conditions',
                onTap: () async {

                },

                child: Icon(Icons.local_police_outlined),
              ),
            ),
            SizedBoxH18(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.textFieldColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: _ProfileListTile.asset(
                title: 'Privacy Policy',
                onTap: () async {

                },
                child: Icon(Icons.policy),
              ),
            ),
            SizedBoxH18(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.textFieldColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: _ProfileListTile.asset(
                title: 'About Us',
                onTap: () async {

                },
                child: const Icon(Icons.account_box),
              ),
            ),
            SizedBoxH18(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.textFieldColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: _ProfileListTile.asset(
                title: 'Subscription plan',
                onTap: () async {
                  Navigator.pushNamed(context, Routs.subscriptionPlanScreen);
                },
                child: const Icon(Icons.subscriptions),
              ),
            ),
          ],
        ),
        appBar: SecondaryAppBar(
          title: "Profile",
          isLeading: true,
          leadingIcon: Icons.menu,
          onBackPressed: () {
            openDrawer();
          },
        ));
  }

  void openDrawer() {}
}
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



class _ProfileListTile extends StatelessWidget {
  final Widget child;
  final String title;
  final VoidCallback onTap;

  _ProfileListTile.asset({
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
        onTap();
      },
    );
  }
}


