import 'package:flutter/material.dart';
import 'package:vyapar_post/utils/app_color.dart';
import 'package:vyapar_post/utils/app_text_style.dart';
import 'package:vyapar_post/widget/custom_sized_box.dart';
import 'package:vyapar_post/widget/primary_textfield.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
   return SafeArea(
       child: Scaffold(
         body:  Padding(
           padding: const EdgeInsets.only(left:20,top:5,right:20),
           child: Column(
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:  [
                   Text("Welcome back!",style: AppTextStyle.title.copyWith(color: AppColor.red),),
                   SizedBox(height: 10,),
                   Text("Sign in to your account",style: AppTextStyle.lable.copyWith(color: AppColor.green),),
                   SizedBox(height: 30,),
                   Text("Log in",style: AppTextStyle.mainTitle),
                   TextField(
                       controller: _phoneNo,
                       decoration: InputDecoration(
                           enabledBorder: UnderlineInputBorder(
                             borderSide: BorderSide(
                                 width: 3, color: Colors.greenAccent), //<-- SEE HERE
                             borderRadius: BorderRadius.circular(50.0),

                           ),
                           hintText:"enter your phone no"

                       ),

                   ),
                    SizedBoxH20(),
                    PrimaryTextField(
                      controller: _password,
                      hintText: "enter your password",
                      prefix: Icon(Icons.password),


                   ),
                 ],
               ),
               // Align(alignment: Alignment.bottomRight,
               //     child: GestureDetector(onTap: (){
               //       Navigator.push(context, MaterialPageRoute(builder: (context) =>Forget() ),);
               //     },
               //         child: Text("forget password",)))

             ],
           ),
         ),

       )
   );
  }
}

//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
//   final TextEditingController _phone = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   bool obscurePassword = true;
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.white,
//       body: SafeArea(
//           child: Form(
//             key: _formKey,
//             child: CustomScroll(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBoxH34(),
//                 SizedBoxH34(),
//                 SizedBoxH34(),
//                 Center(
//                   child: appText("Doctor on call",
//                       style: AppTextStyle.appName
//                           .copyWith(color: AppColor.primaryColor)),
//                 ),
//                 SizedBoxH28(),
//                 SizedBoxH28(),
//                 appText("Login", style: AppTextStyle.title),
//                 SizedBoxH6(),
//                 appText("Please login with phone number and password",
//                     style: AppTextStyle.subTitle),
//                 SizedBoxH28(),
//                 appText("Phone number", style: AppTextStyle.lable),
//                 SizedBoxH8(),
//                 PrimaryTextField(
//                   controller: _phone,
//                   hintText: "Enter phone number",
//                   validator: mobileNumberValidator,
//                   prefix: const Icon(Icons.phone),
//                   keyboardInputType: TextInputType.phone,
//                 ),
//                 SizedBoxH10(),
//                 appText("Password", style: AppTextStyle.lable),
//                 SizedBoxH8(),
//                 PrimaryTextField(
//                   controller: _password,
//                   hintText: "Enter password",
//                   validator: passwordValidator,
//                   prefix: const Icon(Icons.password),
//                   suffix: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           obscurePassword = !obscurePassword;
//                         });
//                       },
//                       child: obscurePassword
//                           ? const Icon(Icons.visibility_off)
//                           : const Icon(Icons.visibility)),
//                   obscureText: obscurePassword,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ForgotPassword()));
//                         },
//                         child:
//                         appText("Forgot password?", style: AppTextStyle.lable))
//                   ],
//                 ),
//                 SizedBoxH8(),
//                 PrimaryButton(
//                     lable: "Login",
//                     onPressed: () async {
//
//                       if (_formKey.currentState!.validate()) {
//                         FormData data() {
//                           return FormData.fromMap({
//                             "user_id": _phone.text.trim(),
//                             "password": _password.text.trim(),
//                             "firebase_token": PreferenceManager.getFcmToken()
//                           });
//                         }
//
//                         ApiService().login(context,
//                             data: data(), phoneNumber: _phone.text.trim());
//                       }
//                     }),
//                 SizedBoxH18(),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pushNamed(context, Routs.mobileVerification);
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       appText(
//                         "You don’t have an account? ",
//                         style: AppTextStyle.subTitle,
//                       ),
//                       appText(
//                         "Sign Up",
//                         style: AppTextStyle.redTextStyle
//                             .copyWith(color: AppColor.primaryLightColor),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }