import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import '../../routs/app_routs.dart';
import '../../routs/arguments.dart';
import '../../services/api_services.dart';
import '../../utils/app_color.dart';
import '../../utils/app_text.dart';
import '../../utils/app_text_style.dart';
import '../../utils/validation_mixin.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/primary_button.dart';
import '../../widget/primary_textfield.dart';
import '../../widget/scroll_view.dart';

class LoginScreen extends StatefulWidget {
  final SendArguments? arguments;

  const LoginScreen({Key? key, this.arguments}) : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin{
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
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
            appText("Login",style: AppTextStyle.title),
            SizedBoxH6(),
            appText("Please login with phone number and password",style: AppTextStyle.subTitle),
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
            appText("Password",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _password,
              hintText: "enter password",
              prefix: Icon(Icons.password),
              validator: passwordValidator,
              suffix: GestureDetector(
                onTap: (){
                  setState(() {
                    obscurePassword= !obscurePassword;
                  });
                },
                  child: obscurePassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
                obscureText: obscurePassword,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {
                 Navigator.pushNamed(context, Routs.forgetPasswordVerification);
                },
                    child: appText("forget password?",style: AppTextStyle.lable)),
              ],
            ),
            SizedBoxH10(),
            PrimaryButton(
                lable: "Login",
                onPressed: (){
              if (_formKey.currentState!.validate()) {
                FormData data() {
                  print(_phone.text.trim());
                  print(_password.text.trim());
                  return FormData.fromMap({
                    "contact":_phone.text.trim(),
                    "password": _password.text.trim(),
                  });
                }
                ApiService().login(context,data:data()).then((value){
                  if(value?.branchKycStatus == "0"){
                    Navigator.pushNamed(context, Routs.updateProfileScreen,
                        arguments: SendArguments(
                            phoneNumber:_phone.text.trim()

                        ) );
                  }else{
                    Navigator.pushNamed(context, Routs.mainHomeScreen,
                        arguments: SendArguments(
                          // phoneNumber:_phone.text.trim()
                            bottomIndex: 0
                        ) );



                  }

                });
                // Navigator.pushNamed(context, Routs.mainHomeScreen,
                // arguments: SendArguments(
                //   bottomIndex: 0,
                // // phoneNumber:_phone.text.trim()
                // ) );
              }

                }),
            SizedBoxH20(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appText("You don’t have an account?",style: AppTextStyle.subTitle),
                GestureDetector(
                  onTap: (){

                    Navigator.pushNamed(context, Routs.mobileVerificationScreen);


                  },
                    child: appText("Sign Up",style: AppTextStyle.redTextStyle.copyWith(color: AppColor.primaryBlue))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
