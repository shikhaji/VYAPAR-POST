import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../routs/app_routs.dart';
import '../../utils/app_color.dart';
import '../../utils/app_text.dart';
import '../../utils/app_text_style.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/primary_button.dart';
import '../../widget/scroll_view.dart';
import 'on_boaeding_screen1.dart';
import 'on_boaeding_screen2.dart';
import 'on_boaeding_screen3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);


  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller  = PageController( initialPage: 0 );
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            body: CustomScroll(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBoxH28(),
                Center(
                    child: appText("Vyapar Post",style: AppTextStyle.appName)),
                SizedBox(
                  height: 600,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    onPageChanged:(index){
                      setState(() {
                        onLastPage= (index==2);
                      });
                    } ,
                    children:  [
                      OnBoardingScreen1(),
                      OnBoardingScreen2(),
                      OnBoardingScreen3(),

                    ],
                  ),
                ),
                onLastPage ?
                PrimaryButton(
                    lable: "Get Started",
                    onPressed: (){
                      Navigator.pushNamed(context, Routs.mobileVerificationScreen);
                    }
                ):
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: PrimaryButton(
                        height: 40,
                          lable: "Skip",
                          onPressed: (){
                              _controller.jumpToPage(2);
                          }
                      ),
                    ),

                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: JumpingDotEffect(
                          activeDotColor: AppColor.primaryBlue,
                          dotColor: AppColor.primaryBlue.withOpacity(0.5),
                          dotHeight: 10,
                          dotWidth: 10
                      ),
                    ),

                    SizedBox(
                      width: 100,
                      child: PrimaryButton(
                        height: 40,
                          lable: "Next",
                          onPressed: (){
                              _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                          }
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ),
        );


  }

}


