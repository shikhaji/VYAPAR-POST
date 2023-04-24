import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../routs/app_routs.dart';
import '../../routs/arguments.dart';
import '../../services/shared_preferences.dart';
import '../../utils/app_color.dart';
import '../../utils/app_text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(Duration(seconds: 3),
  //           ()=>Navigator.pushNamed(context,
  //
  //           Routs.onBoardingScreen
  //       )
  //   );
  // }
  @override
  void initState() {
    super.initState();
    verify();
  }

  Future<void> verify() async {
    String userId = await Preferances.prefGetString("userId", '');
    String profileStatus = await Preferances.prefGetString("profileStatus", '');
    Future.delayed(const Duration(seconds: 3)).then(
          (value) {
        if (userId != null &&
            profileStatus.replaceAll('"', '').toString() == "1") {
          Navigator.pushNamedAndRemoveUntil(
              context, Routs.mainHomeScreen, (route) => false,
              arguments: SendArguments(bottomIndex: 0));
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, Routs.onBoardingScreen, (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.primaryLightColor,
      body: Center(
        child: Text("Vyapar Post",style: AppTextStyle.mainTitle.copyWith(color: AppColor.white),),
      ),
    );
  }
}
