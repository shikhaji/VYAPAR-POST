import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:vyapar_post/utils/loader.dart';
import 'package:vyapar_post/utils/validation_mixin.dart';

import '../../models/auth_result.dart';
import '../../routs/app_routs.dart';
import '../../routs/arguments.dart';
import '../../utils/app_text.dart';
import '../../utils/app_text_style.dart';
import '../../utils/function.dart';
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

  final _formKey = GlobalKey<FormState>();
  Timer? _timer;
  String _verificationId = '';
  int _seconds = -1;

  void _startTimer() {
    _seconds = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds--;
        if (_seconds == 0) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await sendCode();
    });
  }

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
                onPressed: () async {
                  if (_otp.text == "") {
                    CommonFunctions.toast("please enter otp code !!");
                  } else {
                    AuthResult result = await _verify(_otp.text);
                    if (result.status) {}
                  }

                }
                ),

          ],
        ),
      ),
    );
  }

  Future<void> sendCode() async {
    Loader.showLoader();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${"+91"}${widget.arguments?.phoneNumber}",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'web-context-cancelled') {
          throw e.message ?? 'Error';
        } else {
          throw e.message ?? 'Error';
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        Loader.hideLoader();
        _verificationId = verificationId;
        setState(() {});
        _startTimer();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
        setState(() {});
      },
    );
  }

  Future _verify(String smsCode) async {
    Loader.showLoader();
    try {
      final PhoneAuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );

      UserCredential credential =
      await FirebaseAuth.instance.signInWithCredential(authCredential);

      if(widget.arguments!.otpStatus == 0){
        Navigator.pushNamed(context, Routs.signupScreen,arguments: SendArguments(phoneNumber: widget.arguments!.phoneNumber));
      }else{
        Navigator.pushNamed(context, Routs.forgetPasswordScreen);
      }

      Loader.hideLoader();
      return AuthResult(status: true, user: credential.user);
    } on FirebaseAuthException catch (e) {
      Loader.hideLoader();
      debugPrint('inside catch : ${e.message}');
      AuthResult result = AuthResult(status: false, message: e.message);

      switch (e.code) {
        case 'invalid-verification-code':
          result.message = 'Your SMS code is invalid.';
          break;
        case 'provider-already-linked':
          result.message = 'This phone number is already registered.';
          break;
        default:
      }
      if (result.message != null) {
        _otp.clear();
        CommonFunctions.toast(result.message!);
      }
      return AuthResult(status: false);
    }
  }

}
