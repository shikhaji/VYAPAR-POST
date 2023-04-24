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

class SignupScreen extends StatefulWidget {
  final SendArguments? arguments;
  const SignupScreen({Key? key, this.arguments, }) : super(key: key);

  // const SignupScreen({Key? key, this.arguments}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with ValidationMixin{
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _referral = TextEditingController();
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
            appText("Sign Up",style: AppTextStyle.title),
            SizedBoxH6(),
            appText("create a new account",style: AppTextStyle.subTitle),
            SizedBoxH28(),
            appText("Name",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _name,
              hintText: "enter your name",
              validator: nameValidator,
              prefix: Icon(Icons.person),
              keyboardInputType: TextInputType.text,
            ),
            SizedBoxH10(),
            appText("Phone Number",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _phone,
              hintText: "${widget.arguments?.phoneNumber}",
              readOnly: true,
              prefix: Icon(Icons.phone),
              keyboardInputType: TextInputType.phone,
            ),
            SizedBoxH10(),
            appText("Password",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _password,
              validator: passwordValidator,
              hintText: "enter password",
              prefix: Icon(Icons.password),
              suffix: GestureDetector(
                  onTap: (){
                    setState(() {
                      obscurePassword= !obscurePassword;
                    });
                  },
                  child: obscurePassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
              obscureText: obscurePassword,
            ),
            SizedBoxH10(),
            appText("Email-id",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _email,
              validator: passwordValidator,
              hintText: "Enter Email-id",
              prefix: Icon(Icons.email_outlined),

            ),
            SizedBoxH10(),
            appText("Referral Code",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _referral,
              hintText: "Enter Password",
              prefix: Icon(Icons.card_giftcard),
            ),

            SizedBoxH10(),
            SizedBoxH10(),
            PrimaryButton(
                lable: "Sign Up",
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    FormData data() {
                      return FormData.fromMap({
                        "name": _name.text.trim(),
                        "contact": widget.arguments?.phoneNumber,
                        "email": _email.text.trim(),
                        "password": _password.text.trim(),
                        "referal_code": _referral.text.trim(),

                      });
                    }
                    print("name=${_name.text.trim()}");
                    print("contact=${widget.arguments?.phoneNumber}");
                    print("email=${_email.text.trim()}");
                    print("password=${_password.text.trim()}");
                    print("referal_code=${_referral.text.trim()}");
                    ApiService().signUp(context,data:data());


                    }



                }),

          ],
        ),
      ),
    );
  }
}
