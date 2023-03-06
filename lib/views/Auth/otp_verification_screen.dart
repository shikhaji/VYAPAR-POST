import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:vyapar_post/utils/validation_mixin.dart';

import '../../routs/app_routs.dart';
import '../../routs/arguments.dart';
import '../../utils/app_text.dart';
import '../../utils/app_text_style.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/primary_button.dart';
import '../../widget/primary_textfield.dart';
import '../../widget/scroll_view.dart';

class OtpVerificationScreen extends StatefulWidget {
  final SendArguments? arguments;
  const OtpVerificationScreen({Key? key, this.arguments, }) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> with ValidationMixin{
  TextEditingController _otp = TextEditingController();
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
            appText("OTP Verification",style: AppTextStyle.title),
            SizedBoxH6(),
            appText("Enter 6 digit code sent to your mobile number",style: AppTextStyle.subTitle),
            appText("${widget.arguments?.phoneNumber}",style: AppTextStyle.subTitle),
            SizedBoxH28(),
            appText("Enter OTP",style: AppTextStyle.lable),
            SizedBoxH8(),
            PinCodeTextField(
              controller: _otp,
              maxLength: 6,
              pinBoxHeight: 50,
              pinBoxWidth: 50,
            ),
            // PrimaryTextField(
            //   controller: _otp,
            //   hintText: "enter OTP",
            //   validator: otpValidator,
            //   keyboardInputType: TextInputType.number,
            // ),
            SizedBoxH10(),
            SizedBoxH10(),
            PrimaryButton(
                lable: "Verify OTP ",
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    if(widget.arguments!.otpStatus == 0 ){
                      Navigator.pushNamed(context, Routs.signupScreen,
                          arguments: SendArguments(
                              phoneNumber:widget.arguments?.phoneNumber
                          ) );
                    }else
                    Navigator.pushNamed(context, Routs.forgetPasswordScreen);
                  }



                }),

          ],
        ),
      ),
    );;
  }
}
