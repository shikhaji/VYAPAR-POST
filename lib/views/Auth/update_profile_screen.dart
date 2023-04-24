import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:vyapar_post/models/get_all_category_model.dart';


import '../../models/city_model.dart';
import '../../models/state_model.dart';
import '../../routs/app_routs.dart';
import '../../routs/arguments.dart';
import '../../services/api_services.dart';
import '../../services/shared_preferences.dart';
import '../../utils/app_color.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text.dart';
import '../../utils/app_text_style.dart';
import '../../utils/validation_mixin.dart';
import '../../widget/Dailog/category_picker.dart';
import '../../widget/Dailog/city_picker.dart';
import '../../widget/Dailog/state_picker.dart';
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
  TextEditingController _category = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _emailid = TextEditingController();
  StateModel stateModel = StateModel();
  CityModel cityModel = CityModel();
  Category category = Category();

  XFile? selectedDocument;
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
            SizedBoxH28(),
            // Center(
            //     child: appText("Vyapar Post",style: AppTextStyle.appName)),
            SizedBoxH8(),
            appText("Update your profile",style: AppTextStyle.title),
            SizedBoxH28(),
            appText("Upload Profile Photo",style: AppTextStyle.lable),
            SizedBoxH8(),
            InkWell(
              onTap: () => showDialogForUserImage(1),
              child: uploadBox(
                'Upload Image',
                selectedDocument != null ? selectedDocument!.path : '',
              ),
            ),
            SizedBoxH10(),
            appText("Name",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              hintText: "Enter Your Name",
              controller: _name,
              validator: nameValidator,
              prefix: Icon(Icons.perm_identity),
              keyboardInputType: TextInputType.text,
            ),
            SizedBoxH10(),
            appText("Address",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _address,
              hintText: "Enter your address",
              validator: addressValidation,
              prefix: Icon(Icons.work_history_outlined),
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

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText("Select state", style: AppTextStyle.lable),
                      SizedBoxH8(),
                      PrimaryTextField(
                        controller: _state,
                        readOnly: true,
                        hintText: "Select State",
                        suffix: Icon(
                          Icons.arrow_drop_down,
                          size: Sizes.s30.h,
                        ),
                        onTap: () async {
                          stateModel = await StatePickerDailog.show(context);
                          _state.text = stateModel.stateName ?? '';
                          _city.clear();
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select state';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBoxW10(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText("Select city", style: AppTextStyle.lable),
                      SizedBoxH8(),
                      PrimaryTextField(
                        controller: _city,
                        hintText: "Select City",
                        readOnly: true,
                        suffix: Icon(
                          Icons.arrow_drop_down,
                          size: Sizes.s30.h,
                        ),
                        onTap: () async {
                          cityModel = await CityPickerDailog.show(
                              context, "${stateModel.stateId}");
                          _city.text = cityModel.districtName ?? '';
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select city';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBoxW10(),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText("Select category", style: AppTextStyle.lable),
                      SizedBoxH8(),
                      PrimaryTextField(
                        controller: _category,
                        readOnly: true,
                        hintText: "Select category",
                        suffix: Icon(
                          Icons.arrow_drop_down,
                          size: Sizes.s30.h,
                        ),
                        onTap: () async {
                          category = await CategoryPickerDailog.show(
                              context, "${category.id}");
                              _category.text = category.brandName ?? '';
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select state';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),

              ],
            ),
            SizedBoxH10(),

            PrimaryButton(
                lable: "submit",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (selectedDocument?.path == null) {
                      Fluttertoast.showToast(
                        msg: 'Please Upload Post',
                        backgroundColor: Colors.grey,
                      );
                    }
                    else{
                      String? id = await Preferances.getString("userId");
                      print("selectedDocument!.path:=${selectedDocument!.path}");
                      var file =
                      await MultipartFile.fromFile(selectedDocument!.path);
                      print("pass file:=${file}");
                      print(widget.arguments?.phoneNumber);
                      FormData data() {
                        return FormData.fromMap({
                          "loginid": id!
                              .replaceAll('"', '')
                              .replaceAll('"', '')
                              .toString(),
                          "name": _name.text.trim(),
                          "address": _address.text.trim(),
                          "phone": widget.arguments?.phoneNumber,
                          "state": _state.text.trim(),
                          "city": _city.text.trim(),
                          "email": _emailid.text.trim(),
                          "status": 1,
                          "fileToUpload": file,
                        });
                      }
                      await ApiService().updateProfile(context,data:data()).then((value){
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routs.mainHomeScreen,arguments: SendArguments(bottomIndex: 0), (route) => false);
                      });
                    }

                  }
                }),
            SizedBoxH28(),
            SizedBoxH28(),


          ],
        ),
      ),
    );
  }
  Widget uploadBox(String title, String image) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).cardColor,
        border: RDottedLineBorder.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
       //width: ScreenUtil().screenWidth,
      width:Sizes.s150.h,
      height: Sizes.s150.h,
      child: Center(
        child: image != ''
            ? ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.file(File(image),
                width: double.infinity, fit: BoxFit.cover))
            : Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.photo_camera), Text(" Upload Photo")],
        ),
      ),
    );
  }

  showDialogForUserImage(int imgIndex) {
    showCupertinoModalPopup(
      context: context,
      builder: (a) => ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Material(
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.primaryBlue,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: AppColor.primaryBlue,
                  child: const Center(
                    child: Text(
                      "Select Image",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(a).pop();
                        selectImage(ImageSource.gallery, 1);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.image_rounded,
                            color: AppColor.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Gallery",
                            style: AppTextStyle.greySubTitle
                                .copyWith(color: AppColor.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height / 12,
                      width: 3,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(a).pop();
                        selectImage(ImageSource.camera, 1);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.camera_alt_rounded,
                            color: AppColor.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Camera",
                            style: AppTextStyle.greySubTitle
                                .copyWith(color: AppColor.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  selectImage(ImageSource source, int imgIndex) async {
    final ImagePicker imagePicker = ImagePicker();
    if (imgIndex == 1) {
      selectedDocument = await imagePicker.pickImage(source: source);
      setState(() {});
    }
  }
}
