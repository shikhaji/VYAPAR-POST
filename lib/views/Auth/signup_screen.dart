import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_post/utils/app_text.dart';
import 'package:vyapar_post/utils/function.dart';
import 'package:vyapar_post/utils/validation_mixin.dart';

import '../../routs/app_routs.dart';
import '../../routs/arguments.dart';
import '../../utils/app_color.dart';
import '../../utils/app_text_style.dart';
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
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _name = TextEditingController();
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
            appText("Phone number",style: AppTextStyle.lable),
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
            // SizedBoxH10(),
            // appText("Confirm Password",style: AppTextStyle.lable),
            // SizedBoxH8(),
            // PrimaryTextField(
            //   controller: _confirmPassword,
            //   hintText: "Re-enter password",
            //   prefix: Icon(Icons.password),
            //   validator: passwordValidator,
            //   suffix: GestureDetector(
            //       onTap: (){
            //         setState(() {
            //           obscurePassword= !obscurePassword;
            //         });
            //       },
            //       child: obscurePassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
            //   obscureText: obscurePassword,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     TextButton(onPressed: () {
            //       Navigator.pushNamed(context, Routs.forgetPasswordScreen);
            //
            //     },
            //         child: appText("forget password?",style: AppTextStyle.lable)),
            //   ],
            // ),
            SizedBoxH10(),
            SizedBoxH10(),
            PrimaryButton(
                lable: "Sign Up",
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, Routs.loginScreen);
                    }



                }),

          ],
        ),
      ),
    );
  }
}
