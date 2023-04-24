import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../routs/app_routs.dart';
import '../../utils/app_text.dart';
import '../../utils/app_text_style.dart';
import '../../utils/validation_mixin.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/primary_button.dart';
import '../../widget/primary_textfield.dart';
import '../../widget/scroll_view.dart';

class ForgetPasswordScreen extends StatefulWidget {
  // final SendArguments? arguments;
  // const ForgetPasswordScreen({Key? key, this.arguments, }) : super(key: key);

  // const ForgetPasswordScreen({Key? key, required SendArguments arguments}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> with ValidationMixin {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
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
            appText("Reset Password",style: AppTextStyle.title),
            SizedBoxH6(),
            appText("create a new password",style: AppTextStyle.subTitle),
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
            SizedBoxH10(),
            appText("Confirm Password",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _confirmPassword,
              hintText: "Re-enter password",
              prefix: Icon(Icons.password),
              validator: (value){
                return confirmPasswordValidator(value!,_password.text.trim());
              },

              suffix: GestureDetector(
                 onTap: (){
                   setState(() {
                     obscureConfirmPassword= !obscureConfirmPassword;
                   });
                 },
                  child: obscureConfirmPassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
              obscureText: obscureConfirmPassword,
            ),

            SizedBoxH10(),
            SizedBoxH10(),
            PrimaryButton(
                lable: "Reset",
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
