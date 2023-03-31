import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:vyapar_post/utils/app_color.dart';
import 'package:vyapar_post/widget/primary_button.dart';
import 'package:vyapar_post/widget/scroll_view.dart';

import '../../services/api_services.dart';
import '../../services/shared_preferences.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text.dart';
import '../../utils/app_text_style.dart';
import '../../utils/screen_utils.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/drawer_widget.dart';
import '../../widget/primary_textfield.dart';

class PostAdScreen extends StatefulWidget {
  const PostAdScreen({Key? key}) : super(key: key);

  @override
  State<PostAdScreen> createState() => _PostAdScreenState();
}

class _PostAdScreenState extends State<PostAdScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _discription = TextEditingController();
  XFile? selectedDocument;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: CustomScroll(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBoxH10(),
            SizedBoxH28(),
            appText("Upload Post",style: AppTextStyle.title),
            SizedBoxH6(),
            appText("Please upload your image and videos here",style: AppTextStyle.subTitle),
            SizedBoxH28(),
            appText("Add title",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _title,
              hintText: "Add Title",
            ),
            SizedBoxH10(),
            appText("Discription",style: AppTextStyle.lable),
            SizedBoxH8(),
            PrimaryTextField(
              controller: _discription,
              hintText: "Add discription",
            ),
            SizedBoxH10(),
            appText("Upload Image",style: AppTextStyle.lable),
            SizedBoxH8(),
            InkWell(
              onTap: () => showDialogForUserImage(1),
              child: uploadBox(
                'Upload Image',
                selectedDocument != null ? selectedDocument!.path : '',
              ),
            ),
            SizedBoxH28(),
            SizedBoxH18(),
            SizedBoxH18(),
            SizedBoxH18(),
            PrimaryButton(
                lable: "Upload Post",
                onPressed : () async {
                  if (_formKey.currentState!.validate()) {
                    if (selectedDocument!.path == null) {
                      Fluttertoast.showToast(
                        msg: 'Please Upload Prescription',
                        backgroundColor: Colors.grey,
                      );
                    } else {
                      String? id = await Preferances.getString("userId");
                      print("selectedDocument!.path:=${selectedDocument!.path}");
                      var file =
                      await MultipartFile.fromFile(selectedDocument!.path);
                      print("pass file:=${file}");
                      FormData data() {
                        return FormData.fromMap({
                          "loginid": id!
                              .replaceAll('"', '')
                              .replaceAll('"', '')
                              .toString(),
                          "type": 2,
                          "title":_title.text.trim(),
                          "desc": _discription.text.trim(),
                          "media": file,
                        });
                      }

                      ApiService()
                          .addPost(context, data: data());
                    }
                  }
                }
            )

          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Post Ads"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 0,
        width: ScreenUtil().screenWidth * 0.8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Sizes.s20.r),
            bottomRight: Radius.circular(Sizes.s20.r),
          ),
        ),
        child: const DrawerWidget(),
      ),

    );
  }

  Widget uploadBox(String title, String image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).cardColor,
        border: RDottedLineBorder.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      width: ScreenUtil().screenWidth,
      height: Sizes.s180.h,
      child: Center(
        child: image != ''
            ? ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(File(image),
                width: double.infinity, fit: BoxFit.cover))
            : Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.upload_file), Text("Upload File")],
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
              color: AppColor.primaryColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: AppColor.primaryColor,
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
