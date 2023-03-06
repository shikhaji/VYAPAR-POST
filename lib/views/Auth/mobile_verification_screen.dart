import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_post/routs/arguments.dart';
import 'package:vyapar_post/utils/validation_mixin.dart';

import '../../routs/app_routs.dart';
import '../../utils/app_color.dart';
import '../../utils/app_text.dart';
import '../../utils/app_text_style.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/primary_button.dart';
import '../../widget/primary_textfield.dart';
import '../../widget/scroll_view.dart';

class MobileVerificationScreen extends StatefulWidget {
  const MobileVerificationScreen({Key? key}) : super(key: key);

  @override
  State<MobileVerificationScreen> createState() => _MobileVerificationScreenState();
}

class _MobileVerificationScreenState extends State<MobileVerificationScreen> with ValidationMixin {
  TextEditingController _phone = TextEditingController();
  bool obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: CustomScroll(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBoxH34(),
            SizedBoxH34(),
            SizedBoxH34(),
            Center(
                child: appText("Vyapar Post",style: AppTextStyle.appName)),
            SizedBoxH10(),
            SizedBoxH28(),
            appText("Mobile Verification",style: AppTextStyle.title),
            SizedBoxH6(),
            appText("Please verify your mobile number first",style: AppTextStyle.subTitle),
            SizedBoxH28(),
            appText("Phone number",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _phone,
              hintText: "enter phone number",
              validator: mobileNumberValidator,
              prefix: Icon(Icons.phone),
              keyboardInputType: TextInputType.phone,
            ),
            SizedBoxH10(),
            SizedBoxH10(),
            PrimaryButton(
                lable: "Send OTP ",
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, Routs.otpVerificationScreen,
                        arguments: SendArguments(
                            phoneNumber: _phone.text.trim(),
                            otpStatus: 0
                        ) );
                  }



                }),
            SizedBoxH28(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appText("already have an account?",style: AppTextStyle.subTitle),
                GestureDetector(
                    onTap: (){

                      Navigator.pushNamed(context, Routs.loginScreen);


                    },
                    child: appText("Login",style: AppTextStyle.redTextStyle.copyWith(color: AppColor.primaryColor))),
              ],
            )


          ],
        ),
      ),
    );
  }
}
