import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/get_current_balance.dart';
import '../../models/my_post_model.dart';
import '../../models/profile_contant_model.dart';
import '../../routs/app_routs.dart';
import '../../services/api_services.dart';
import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_style.dart';
import '../../utils/screen_utils.dart';
import '../../widget/Dailog/open_image_popup.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/drawer_widget.dart';
import '../../widget/primary_appbar.dart';
import '../../widget/primary_button.dart';
import '../../widget/primary_padding.dart';
import '../../widget/scroll_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  Profile? getProfileData;
  List<Post> getMyPostData=[];
  GetCurrentBalanceModel? getWalletModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    GetMyPost(1);
  }


  Future GetMyPost(status) async {
    // post api call
    ApiService().getMyPost(context,status).then((value){
      setState(() {
        getMyPostData=value!.message!.post;
      });

    });
    // profile api call
    ApiService().profileContant(context).then((value) {
      setState(() {
        getProfileData = value?.message?.profile;
      });
    }
    );
    // balance api call
    ApiService().getCurrentBalance(context,).then((value){
      setState(() {
        getWalletModel = value;
      });
      print("balance = ${value?.balance}");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBoxH20(),
              PrimaryPadding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: Sizes.s90.h,
                        width: Sizes.s90.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: getProfileData?.branchPhoto != ""
                                ? DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://khojloindia.in//uploads/${getProfileData?.branchPhoto}" ?? ""),
                            )
                                : DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(AppAsset.dummyAvatar),
                            ))),
                   
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "${getMyPostData.length}",
                                style: AppTextStyle.headingTextTile2
                                    .copyWith(fontSize: Sizes.s16),
                              ),
                              Text(
                                "Posts",
                                style: AppTextStyle.lable.copyWith(fontSize: Sizes.s16),
                              )

                            ],
                          ),
                          Column(
                            children: [
                              Text(
                          "${getWalletModel != null && getWalletModel!.balance != null ? getWalletModel!.balance : " 0"}"
                          ),

                              Text(
                                "Balance",
                                style: AppTextStyle.lable.copyWith(fontSize: Sizes.s16),
                              )

                            ],
                          )
                        ],
                      ),
                    ),


                    // IconButton(onPressed: (){
                    //   Navigator.pushNamed(context, Routs.editProfileScreen);
                    // }, icon: Icon(Icons.edit)),
                  ],
                ),
              ),
              SizedBoxH12(),
              PrimaryPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${getProfileData?.branchName ?? ""}",
                      style: AppTextStyle.headingTextTile2
                          .copyWith(fontSize: Sizes.s16),
                    ),
                    Text(
                      "${getProfileData?.branchEmail ?? ""}",
                      style: AppTextStyle.lable.copyWith(fontSize: Sizes.s16),
                    )
                  ],
                ),
              ),
              SizedBoxH12(),
              PrimaryPadding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.pushNamed(context, Routs.editProfileScreen);
                      },
                      child: Container(
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: AppColor.textFieldColor,
                        ),

                          child: Center(child: Text("Edit Profile",style: AppTextStyle.appBarTitle.copyWith(fontSize: Sizes.s16))),
                      ),
                    ),

                    Container(
                      height: 35,
                      width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        color: AppColor.textFieldColor,
                      ),

                      child: Center(child: Text("Share Profile",style: AppTextStyle.appBarTitle.copyWith(fontSize: Sizes.s16))),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        color: AppColor.textFieldColor,
                      ),

                      child: Icon(Icons.perm_identity,size: Sizes.s22,)
                    ),

                  ],
                ),
              ),
              SizedBoxH28(),

              // Divider(),
              // const Center(child: Text("My Uploaded Post",style: AppTextStyle.appBarTitle)),
              // Divider(),
              getMyPostData.length!=0?PrimaryPadding(
                  child:GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      cacheExtent: 30,
                      physics: const ClampingScrollPhysics(),
                      itemCount: getMyPostData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 8 / 8,
                        crossAxisSpacing: Sizes.s10.h,
                        mainAxisSpacing: Sizes.s10.h,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                           OpenImagePopup.show(context, "${getMyPostData[index].vapImage}","${getProfileData?.branchPhoto}","${getMyPostData[index].vapTitle}","${getMyPostData[index].vapId}","${getMyPostData[index].vapLike}","${getMyPostData[index].vapComment}");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColor.textFieldColor),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://khojloindia.in//uploads/${getMyPostData[index].vapImage}",
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        );
                      }),
              ): Center(child: Text("No Image",style: AppTextStyle.appBarTitle)),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Profile",style: AppTextStyle.appBarTextTitle),
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

  void openDrawer() {}
}
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



