import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../routs/app_routs.dart';
import '../../routs/arguments.dart';
import '../../services/api_services.dart';
import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_style.dart';
import '../../utils/loader.dart';
import '../../utils/screen_utils.dart';
import '../custom_sized_box.dart';
import '../primary_button.dart';

class OpenImagePopup extends StatefulWidget {
  final String imageUrl;
  final String profileImage;
  final String name;
  final String id;
  final String like;
  final String comment;
  const OpenImagePopup({
    super.key,
    required this.imageUrl,
    required this.profileImage,
    required this.name,
    required this.id,
    required this.like,
    required this.comment,
  });

  static Future<String> show(BuildContext context, String imageUrl,String profileImage,String name,String id,String like,String comment,) async {
    return await showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => OpenImagePopup(
        imageUrl: imageUrl,
        profileImage: profileImage,
        name: name,
        id:id,
        like:like,
        comment:comment,
      ),
    );
  }

  @override
  State<OpenImagePopup> createState() =>
      _OpenImagePopupState();
}

class _OpenImagePopupState extends State<OpenImagePopup> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("image url:=${widget.imageUrl}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Dialog(
          insetPadding: EdgeInsets.all(Sizes.s10.h),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.s12.r),
          ),
          child: SizedBox(
            height: ScreenUtil().screenHeight /2.4,
            width: ScreenUtil().screenWidth / 1.2,
            child: Column(
              children: [
                Padding(
                  padding:EdgeInsets.only(top: 8,right: 15,left: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        children: [
                          Container(
                              height: Sizes.s40.h,
                              width: Sizes.s40.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: widget.profileImage != ""
                                      ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage("https://aiccpo.com//uploads/${widget.profileImage}" ?? ""),
                                  )
                                      : DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(AppAsset.dummyAvatar),
                                  ))),
                          SizedBoxW18(),
                          Text(
                            widget.name,
                            style: AppTextStyle.appBarTitle
                                .copyWith(fontSize: Sizes.s20),
                          ),

                          // Expanded(

                        ],
                      ),

                      GestureDetector(
                          onTap: (){
                            FormData data() {
                              return FormData.fromMap({
                                "vap_id": widget.id!
                                    .replaceAll('"', '')
                                    .replaceAll('"', '')
                                    .toString(),
                              });
                            }
                            ApiService().deletePost(context,data:data()).then((value){
                              Navigator.pushNamedAndRemoveUntil(
                                  context, Routs.mainHomeScreen,arguments: SendArguments(bottomIndex: 3), (route) => false);
                            });
                          },
                          child: Icon(Icons.delete_sweep,size:25 ,color: AppColor.primaryBlue,)),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.only(left: 12,right: 12,top: 12,bottom: 12),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://khojloindia.in//uploads/${widget.imageUrl}',
                        height: Sizes.s200.h,
                        width: double.infinity,
                      )),
                ),
                const Divider(),
                SizedBoxH8(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/icons/heart_fill.png",color: AppColor.primaryBlue,width: 15,height: 15,),
                          SizedBoxW8(),
                          Text("${widget.like}, Likes"),
                        ],
                      ),
                      SizedBoxW18(),
                      SizedBoxW18(),
                      SizedBoxW18(),
                      Row(
                        children: [
                          Image.asset("assets/icons/comment.png",width: 15,height: 15,),
                          SizedBoxW8(),
                          Text("${widget.comment}, comments"),

                        ],
                      ),


                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  _buildDownloadImage() async {
    Loader.showLoader();
    var status = Permission.storage.request();
    if (await status.isGranted) {
      var response = await Dio().get(
          "https://appointment.doctoroncalls.in/uploads/${widget.imageUrl.toString()}",
          options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 60,
          name: "hello");

      print(result);
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: 'Download Successfully...',
        backgroundColor: Colors.grey,
      );
      Loader.hideLoader();
    }
  }
}
