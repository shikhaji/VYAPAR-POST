import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../routs/app_routs.dart';
import '../../routs/arguments.dart';
import '../../utils/app_color.dart';
import '../../utils/app_text.dart';
import '../../utils/app_text_style.dart';
import '../../utils/validation_mixin.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/primary_button.dart';
import '../../widget/primary_textfield.dart';
import '../../widget/scroll_view.dart';

class ForgetPasswordVerification extends StatefulWidget {
  const ForgetPasswordVerification({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordVerification> createState() => _ForgetPasswordVerificationState();
}

class _ForgetPasswordVerificationState extends State<ForgetPasswordVerification> with ValidationMixin {
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
            appText("Forget password Verification",style: AppTextStyle.title),
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
                      otpStatus: 1
                    ));
                  }



                }),
            SizedBoxH20(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appText("please register your account.",style: AppTextStyle.subTitle),
                GestureDetector(
                    onTap: (){

                      Navigator.pushNamed(context, Routs.mobileVerificationScreen);


                    },
                    child: appText("Sign up",style: AppTextStyle.redTextStyle.copyWith(color: AppColor.primaryBlue))),
              ],
            )


          ],
        ),
      ),
    );

  }
}
