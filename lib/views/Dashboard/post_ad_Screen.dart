import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_post/widget/primary_button.dart';
import 'package:vyapar_post/widget/scroll_view.dart';

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
  TextEditingController _title = TextEditingController();
  TextEditingController _discription = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScroll(
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
          SizedBoxH28(),
          SizedBoxH18(),
          SizedBoxH18(),
          SizedBoxH18(),
              PrimaryButton(
                  lable: "Upload Post",
                  onPressed : (){

              }
              )

        ],
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
}
