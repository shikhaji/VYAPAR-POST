import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_post/utils/app_color.dart';
import 'package:vyapar_post/utils/app_text_style.dart';

import '../../routs/app_routs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushNamed(context,

            Routs.onBoardingScreen
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Text("Vyapar Post",style: AppTextStyle.mainTitle.copyWith(color: AppColor.white),),
      ),
    );
  }
}
