
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:vyapar_post/models/get_all_post_by_category_model.dart';
import '../../models/get_all_category_model.dart';
import '../../models/get_all_post_model.dart';
import '../../routs/app_routs.dart';
import '../../routs/arguments.dart';
import '../../services/api_services.dart';
import '../../services/shared_preferences.dart';
import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_style.dart';
import '../../utils/constant.dart';
import '../../utils/screen_utils.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/drawer_widget.dart';
import '../../widget/scroll_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AllPost> getAllPostData=[];
  List<Category?> getCategoryData=[];
  GetAllPostByCategoryModel? getAllPostByCategoryModel;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetAllPost(0);
    GetAllCategory(0);

  }
  Future GetAllPost(status) async {
    ApiService().getAllPost(context,status).then((value){
      setState(() {
        getAllPostData=value!.message.allPost;
      });

    });
  }
  Future GetAllCategory(status) async {
    ApiService().getAllCategory(context,status).then((value){
      setState(() {
        //getCategoryData=value!.message!.category;
        getCategoryData = value!.message.category;
      });
      print("print length = ${getCategoryData.length}");

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: Text("Vyapar post",style: AppTextStyle.appBarTextTitle ,),
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
     body: SingleChildScrollView(
       child: Column(
         children: [
         Divider(),
      Padding (
        padding: const EdgeInsets.only(left: 12,right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Post by Category",style: AppTextStyle.appBarTitle,),
            SizedBoxH10(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(

                children: List.generate(getCategoryData.length, (index){
                  return  CetegoryList(
                    image:"${getCategoryData[index]!.brandImage}",
                    name: "${getCategoryData[index]!.brandName}",
                    categoryid: "${getCategoryData[index]!.id}",

                  );
                }),



              ),
            ),
          ],
        ),
      ),
      SizedBoxH14(),

      Column(
         children: [
           ListView.builder(
            // padding: EdgeInsets.symmetric(vertical: Sizes.s10.h),
             shrinkWrap: true,
             physics: const NeverScrollableScrollPhysics(),
             itemCount: getAllPostData.length,
             itemBuilder: (context, inx) {
               return PostList(
                 image:"${getAllPostData[inx].branchPhoto}",
                 name:"${getAllPostData[inx].vapTitle}",
                 post:"${getAllPostData[inx].vapImage}",
                 like:"${getAllPostData[inx].vapLike}",
                 comments:"${getAllPostData[inx].vapComment}",
                 description:"${getAllPostData[inx].vapDesc}",
                 postid:"${getAllPostData[inx].vapId}",
                 number:"${getAllPostData[inx].branchContact}",
                 likeStatus:"${getAllPostData[inx].vapLikeStatus}",
               );


             },

           ),
         ],
       ),
      ]),
     ));
    }
  Widget PostList({
    required String image,
    required String name,
    required String post,
    required String like,
    required String comments,
    required String description,
    required String postid,
    required String number,
    required String likeStatus,

  }){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Divider(),
          Row(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage("https://khojloindia.in//uploads/$image"),
                  ),
                  const SizedBox(width: 10,),
                  Text(name,style: AppTextStyle.appBarTitle,)
                ],
              ),
            ],
          ),
          SizedBoxH8(),
          //Image.asset(post,height: 300,fit: BoxFit.fill,),
          Image.network("https://khojloindia.in//uploads/$post",height: 300,fit: BoxFit.fill,),
          SizedBoxH10(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: ()async{

                    if(likeStatus == "0"){
                      String? id = await Preferances.getString("userId");
                      FormData data() {
                        return FormData.fromMap({
                          "loginid" :id!
                              .replaceAll('"', '')
                              .replaceAll('"', '')
                              .toString(),
                          "postid" : postid,
                        });
                      }
                      ApiService().updateLike(context,data:data()).then((value){
                        GetAllPost(1);
                      });
                    }
                  },
                    child: likeStatus == "1" ?Image.asset(AppAsset.heartFill,color: AppColor.primaryBlue,width: 25,height: 25,):Image.asset(AppAsset.heart,width: 25,height: 25,)
                ),
                GestureDetector(
                    onTap: (){
                        Navigator.pushNamed(context, Routs.commentScreen,
                        arguments: SendArguments(
                          postId:"${postid}",
                          profileImage:"${image}",
                          postTitle:"${name}",
                          postDes:"${description}",
                        )).then((value){
                          GetAllPost(1);
                        });
                    },
                    child: Image.asset("assets/icons/comment.png",width: 25,height: 25,)
                ),
                GestureDetector(
                  onTap: (){
                     sharedPressed("${description}","${post}");
                  },
                    child: Image.asset("assets/icons/share.png",width: 25,height: 25,)),
                GestureDetector(
                    onTap: (){
                      whatsApp(number);
                      print(number);
                    },
                    child: Image.asset("assets/icons/whatsapp.png",width: 25,height: 25,)),
                GestureDetector(
                  onTap: (){
                    launchDialer(number);
                  },
                    child: Image.asset("assets/icons/call.png",width: 25,height: 25,)),

              ],
            ),
          ),
          Divider(),
          SizedBoxH8(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/heart_fill.png",color: AppColor.primaryBlue,width: 15,height: 15,),
                    SizedBoxW6(),
                    Text("${like} Likes"),
                  ],
                ),
                SizedBoxW18(),
                Row(
                  children: [
                    Image.asset("assets/icons/comment.png",width: 15,height: 15,),
                    SizedBoxW6(),
                    Text("${comments} comments"),

                  ],
                ),


              ],
            ),
          ),
          SizedBoxH8(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Flexible(
                    flex: 6,
                    child: Text("${name} : ${description}",style: AppTextStyle.subTitle2,maxLines: 5,)),
              ],
            ),
           )

        ],                ),
     );


  }
  Widget CetegoryList({
     String? image,
     String? name,
     String? categoryid,

  }){
    print("imge:${categoryid}");
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [

          GestureDetector(

            child: Container(
              height:80,
              width: 105,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.grey,
              ),
              child:Image.network("https://khojloindia.in//uploads/$image",height: 70,fit: BoxFit.fill,),
            ),
            onTap:()async{
              print("imge:${categoryid}");
              // Navigator.pushNamed(context, Routs.categoryScreen,
              //     arguments: SendArguments(
              //       categoryId:"${categoryid}",
              //
              //     ));

              //  FormData data() {
              //   return FormData.fromMap({
              //     "categoryid" : categoryid,
              //   });
              // }
              String? id = await Preferances.getString("userId");
              Navigator.pushNamed(context, Routs.categoryScreen, arguments: SendArguments(catid:"${categoryid}" ));

            //   ApiService().getAllPostByCategory(context,
            //   data: FormData.fromMap({
            //     "categoryid" : categoryid,
            //     "loginid" :id!
            //         .replaceAll('"', '')
            //         .replaceAll('"', '')
            //         .toString(),
            //   }),
            //  ).then((value){
            // setState(() {
            // getAllPostByCategoryModel = value;
            // });
            // });
            },
          ),
          SizedBoxH8(),
          Text(name!),

      ],
      ),
    );
  }

}



Future whatsApp(String Number) async {
  var contact = "+91${Number}";
  var url = "whatsapp://send?phone=" +
      contact + "hiee";
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false);
  }
  else {
    print("whatsapp is not install");
  }
}

launchDialer(String number) async {
  String url = 'tel:' + number;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Application unable to open dialer.';
  }
}

sharedPressed(String des,String post)async{
  Share.share("Welcome To Vyapar Post, ${des}",
  );

}
