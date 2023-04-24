import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../../models/city_model.dart';
import '../../models/profile_contant_model.dart';
import '../../models/state_model.dart';
import '../../routs/app_routs.dart';
import '../../routs/arguments.dart';
import '../../services/api_services.dart';
import '../../services/shared_preferences.dart';
import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text.dart';
import '../../utils/app_text_style.dart';
import '../../utils/file_utils.dart';
import '../../utils/validation_mixin.dart';
import '../../widget/Dailog/city_picker.dart';
import '../../widget/Dailog/state_picker.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/primary_appbar.dart';
import '../../widget/primary_button.dart';
import '../../widget/primary_textfield.dart';
import '../../widget/scroll_view.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with ValidationMixin{
  var url;
  File? _file;
  TextEditingController _phone = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _emailid = TextEditingController();
  StateModel stateModel = StateModel();
  CityModel cityModel = CityModel();
  XFile? selectedDocument;
  bool obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  Profile? myProfileData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //debugPrint("${widget.arguments?.phoneNumber}");
    callApi();
  }
  Future<void> callApi() async {
    String? id = await Preferances.getString("userId");

    print("login id $id");
    ApiService().profileContant(context,).then((value){
      setState(() {
        myProfileData=value!.message!.profile;
        _name.text=value.message!.profile!.branchName!;
        _phone.text=value.message!.profile!.branchContact.toString();
        _emailid.text=value.message!.profile!.branchEmail!;
        _address.text=value.message!.profile!.branchAddress;
        _state.text=value.message!.profile!.branchCity;
        _city.text=value.message!.profile!.branchState;
        url=value.message!.profile!.branchPhoto;
       // selectedDocument="https://aiccpo.doctoroncalls.in//uploads/${value.message!.profile!.branchPhoto}" as XFile?;
      });
      print(url);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(
        title: "Edit Profile",
        isLeading: true,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Form(
        key: _formKey,
        child: CustomScroll(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBoxH28(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildProfileImageWidget(
                  context,
                ),
              ],
            ),
            SizedBoxH10(),
            appText("Name",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              hintText: "Enter Your Name",
              controller: _name,
              validator: nameValidator,
              prefix: Icon(Icons.people),
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
              hintText: "enter phone number",
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
                )
              ],
            ),
            SizedBoxH10(),

            PrimaryButton(
                lable: "Save",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var file;
                    if (_file != null) {
                      file = await MultipartFile.fromFile(_file!.path);
                    } else {
                      file = myProfileData?.branchPhoto;
                    }

                      String? id = await Preferances.getString("userId");

                      print("pass file:=${file}");
                      FormData data() {
                        return FormData.fromMap({
                          "loginid": id!
                              .replaceAll('"', '')
                              .replaceAll('"', '')
                              .toString(),
                          "name": _name.text.trim(),
                          "address": _address.text.trim(),
                          "phone": _phone.text.trim(),
                          "state": _state.text.trim(),
                          "city": _city.text.trim(),
                          "email": _emailid.text.trim(),
                          "status": "1",
                          "fileToUpload": file,
                        });
                      }

                      ApiService().updateProfile(context,data:data()).then((value){
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routs.mainHomeScreen,arguments: SendArguments(bottomIndex: 3), (route) => false);
                      });
                    }
                  }
                ),
            SizedBoxH28(),
            SizedBoxH28(),


          ],
        ),
      ),
    );
  }

  Widget buildProfileImageWidget(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 75,
          child: ClipOval(
            // photo: _file?.path ?? userProvider.user.profilePic,
            child: _file != null
                ? Image.file(File(_file!.path),
                height: 160, width: 160, fit: BoxFit.cover)
                : myProfileData != null && myProfileData?.branchPhoto != ''
                ? Image.network(
                'https://aiccpo.com//uploads/${myProfileData!.branchPhoto}',
                height: 160,
                width: 160,
                fit: BoxFit.cover)
                : Image.asset(AppAsset.dummyAvatar,
                height: 160, width: 160, fit: BoxFit.cover),
          ),
        ),
        Positioned.fill(
          bottom: -12,
          child: Align(
            alignment: Alignment.bottomCenter,
            //  child: showDialogForUserImage(1),
            child: InkWell(
              //onTap: () => showDialogForUserImage(1),
              onTap: () async {
                File? file = await FileUtils.pickImage(ImageSource.gallery);
                if (file != null) {
                  setState(() {
                    _file = file;
                  });
                }
              },
              child: CircleAvatar(
                backgroundColor: AppColor.white,
                radius: Sizes.s20.r,
                child: CircleAvatar(
                  radius: Sizes.s18.r,
                  backgroundColor: AppColor.primaryBlue,
                  child: SvgPicture.asset(
                    AppAsset.camera,
                    height: Sizes.s20.h,
                    width: Sizes.s20.w,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
  // Widget uploadBox(String title, String image) {
  //   return
  //     Container(
  //     alignment: Alignment.center,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(25),
  //       color: Theme.of(context).cardColor,
  //       border: RDottedLineBorder.all(
  //         color: Colors.grey,
  //         width: 1,
  //       ),
  //     ),
  //     //width: ScreenUtil().screenWidth,
  //     width:Sizes.s150.h,
  //     height: Sizes.s150.h,
  //     child: Center(
  //       child: image != null
  //           ? ClipRRect(
  //           borderRadius: BorderRadius.circular(25),
  //           child: Image.file(File(image),
  //               width: double.infinity, fit: BoxFit.cover))
  //           : url != null && url!= " " ? Image.network("https://aiccpo.doctoroncalls.in//uploads/${url}") :
  //       Row(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [Icon(Icons.photo_camera), Text(" Upload Photo")],
  //       ),
  //     ),
  //   );
  // }
  //
  // showDialogForUserImage(int imgIndex) {
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (a) => ClipRRect(
  //       borderRadius: const BorderRadius.only(
  //         topLeft: Radius.circular(20),
  //         topRight: Radius.circular(20),
  //       ),
  //       child: Material(
  //         child: Container(
  //           decoration: BoxDecoration(
  //             color: AppColor.primaryRed,
  //           ),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Container(
  //                 width: MediaQuery.of(context).size.width,
  //                 height: 50,
  //                 color: AppColor.primaryRed,
  //                 child: const Center(
  //                   child: Text(
  //                     "Select Image",
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       color: AppColor.white,
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(height: 10),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: <Widget>[
  //                   InkWell(
  //                     onTap: () {
  //                       Navigator.of(a).pop();
  //                       selectImage(ImageSource.gallery, 1);
  //                     },
  //                     child: Column(
  //                       mainAxisSize: MainAxisSize.min,
  //                       children: <Widget>[
  //                         Icon(
  //                           Icons.image_rounded,
  //                           color: AppColor.white,
  //                         ),
  //                         SizedBox(height: 10),
  //                         Text(
  //                           "Gallery",
  //                           style: AppTextStyle.greySubTitle
  //                               .copyWith(color: AppColor.white),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Container(
  //                     color: Colors.white,
  //                     height: MediaQuery.of(context).size.height / 12,
  //                     width: 3,
  //                   ),
  //                   InkWell(
  //                     onTap: () {
  //                       Navigator.of(a).pop();
  //                       selectImage(ImageSource.camera, 1);
  //                     },
  //                     child: Column(
  //                       mainAxisSize: MainAxisSize.min,
  //                       children: <Widget>[
  //                         Icon(
  //                           Icons.camera_alt_rounded,
  //                           color: AppColor.white,
  //                         ),
  //                         SizedBox(height: 10),
  //                         Text(
  //                           "Camera",
  //                           style: AppTextStyle.greySubTitle
  //                               .copyWith(color: AppColor.white),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //               const SizedBox(height: 10),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // selectImage(ImageSource source, int imgIndex) async {
  //   final ImagePicker imagePicker = ImagePicker();
  //   if (imgIndex == 1) {
  //     selectedDocument = await imagePicker.pickImage(source: source);
  //     setState(() {});
  //   }
  // }
}
