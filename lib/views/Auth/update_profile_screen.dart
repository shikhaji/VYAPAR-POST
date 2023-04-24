

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_post/services/shared_preferences.dart';
import 'package:vyapar_post/utils/validation_mixin.dart';

import '../../models/city_model.dart';
import '../../models/state_model.dart';
import '../../routs/app_routs.dart';
import '../../routs/arguments.dart';
import '../../services/api_services.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text.dart';
import '../../utils/app_text_style.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/primary_button.dart';
import '../../widget/primary_textfield.dart';
import '../../widget/scroll_view.dart';

class UpdateProfileScreen extends StatefulWidget {
  final SendArguments? arguments;
  const UpdateProfileScreen({Key? key, this.arguments, }) : super(key: key);

  // const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> with ValidationMixin {
  TextEditingController _phone = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _businessname = TextEditingController();
  TextEditingController _businessaddress = TextEditingController();
  TextEditingController _businesscategory = TextEditingController();
  TextEditingController _emailid = TextEditingController();
  StateModel stateModel=StateModel();
  CityModel cityModel=CityModel();
  bool obscurePassword = true;
  late String loginId ;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future getData() async {
     String? id = await Preferances.getString("userId");
     setState(() {
       loginId = id!;
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
            SizedBoxH28(),
            // Center(
            //     child: appText("Vyapar Post",style: AppTextStyle.appName)),
            SizedBoxH8(),
            appText("Update your business profile",style: AppTextStyle.title),
            SizedBoxH28(),
            SizedBoxH8(),
            appText("Business Name",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _businessname,
              hintText: "Enter your business name",
              validator: nameValidator,
              prefix: Icon(Icons.assured_workload),
              keyboardInputType: TextInputType.text,
            ),
            SizedBoxH10(),
            appText("State",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _state,
              hintText: "Enter state",
              validator: stateValidation,
              prefix: Icon(Icons.location_city),
              keyboardInputType: TextInputType.text,
            ),
            SizedBoxH10(),
            appText("City",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _city,
              hintText: "Enter city",
              validator: cityValidation,
              prefix: Icon(Icons.location_city_outlined),
              keyboardInputType: TextInputType.text,
            ),
            SizedBoxH10(),
            appText("Business address",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _businessaddress,
              hintText: "Enter your business address",
              validator: addressValidation,
              prefix: Icon(Icons.work_history_outlined),
              keyboardInputType: TextInputType.text,
            ),
            SizedBoxH10(),
            appText("Business category",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _businesscategory,
              hintText: "Enter your business category",
              validator: categoryValidation,
              prefix: Icon(Icons.work),
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
            appText("Email-Id",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _emailid,
              hintText: "Enter your Email-Id",
              validator: emailValidator,
              prefix: Icon(Icons.mail),
              keyboardInputType: TextInputType.text,
            ),
            SizedBoxH10(),
            PrimaryButton(
                lable: "submit",
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    ApiService().updateProfile(context,data:data());                  }



                }),
            SizedBoxH10(),
            SizedBoxH28(),
            SizedBoxH28(),

          ],
        ),
      ),
    );
  }
  FormData data() {
    print("loginId = $loginId");
    return FormData.fromMap({
      "business_name": _businessname.text.trim(),
      "business_category": _businesscategory.text.trim(),
      "business_address": _businessaddress.text.trim(),
      "phone": widget.arguments?.phoneNumber,
      "email": _emailid.text.trim(),
      "state": _state.text.trim(),
      "city": _city.text.trim(),
      "loginid": loginId,
      "status": "1",
    });
  }
}
