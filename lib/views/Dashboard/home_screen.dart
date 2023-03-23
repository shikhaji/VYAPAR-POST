import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:vyapar_post/widget/custom_sized_box.dart';
import 'package:vyapar_post/widget/post_view.dart';

import '../../models/get_all_category_model.dart';
import '../../models/get_all_post_model.dart';
import '../../services/api_services.dart';
import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_style.dart';
import '../../utils/constant.dart';
import '../../utils/screen_utils.dart';
import '../../widget/drawer_widget.dart';
import '../../widget/scroll_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AllPost> getAllPostData=[];
  List<GetCategory> getCategoryData=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetAllPost();
    GetAllCategory();
  }
  Future GetAllPost() async {
    ApiService().getAllPost(context).then((value){
      setState(() {
        getAllPostData=value!.message.allPost;
      });

    });
  }

  Future GetAllCategory() async {
    ApiService().getAllCatgory(context).then((value){
      setState(() {
        getCategoryData=value!.message!.category!;
      });
      print("print length = ${getCategoryData.length}");

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: Text("Vyapar Post",style: AppTextStyle.appBarTextTitle ,),
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
           Padding(
             padding: const EdgeInsets.only(left: 8,right: 8),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const Text("Post by Category",style: AppTextStyle.appBarTitle,),
                 SizedBoxH10(),
                 SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Row(
                     children: List.generate(getCategoryData.length, (index){
                       return CetegoryList(
                         image:AppAsset.postImg,
                        name: "${getCategoryData[index].brandName}",
                       );
                     }),


                   ),
                 ),
               ],
             ),
           ),
           Divider(),
           SizedBoxH14(),


           Column(
             children: [

               ListView.builder(
                 padding: EdgeInsets.symmetric(vertical: Sizes.s20.h),
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 itemCount: getAllPostData.length,
                 itemBuilder: (context, inx) {
                   return PostList(
                     image:AppAsset.postImg,
                     name:getAllPostData[inx].vapTitle,
                     post: AppAsset.postImg,
                    // post: getAllPostData[inx].vapImage,


                   );


                 },

               ),
             ],
           ),



       ],

       ),
     ),

    );
  }
  Widget PostList({
    required String image,
    required String name,
    required String post,

  }){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        //width: double.infinity,
        //color: AppColor.postBackground,
        //margin: EdgeInsets.only(bottom: 25),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(image),
                      //child: Image.asset(AppAsset.postImg,),
                     // backgroundImage:Image.asset(AppAsset.postImg),
                    ),
                    SizedBox(width: 10,),
                    Text(name,style: AppTextStyle.appBarTitle,)
                  ],
                ),
              ],
            ),
            SizedBoxH10(),
            Image.asset(post,height: 300,fit: BoxFit.fill,),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/icons/heart.png",width: 15,height: 15,),
                      SizedBoxW6(),
                      Text("20 Likes"),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/icons/comment.png",width: 15,height: 15,),
                      SizedBoxW6(),
                      Text("20 comments"),

                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/icons/share.png",width: 15,height: 15,),
                      SizedBoxW6(),
                      Text("2 Share"),
                    ],
                  ),

                ],
              ),
            ),
            Divider(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("assets/icons/heart.png",width: 25,height: 25,),
                  Image.asset("assets/icons/comment.png",width: 25,height: 25,),
                  Image.asset("assets/icons/share.png",width: 25,height: 25,),
                  Image.asset("assets/icons/whatsapp.png",width: 25,height: 25,),
                  Image.asset("assets/icons/call.png",width: 25,height: 25,),

                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );


  }
  
  Widget CetegoryList({
    required String image,
    required String name,
}){
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            height:80,
            width: 105,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.grey,
            ),
            child: Image.asset(image),
          ),
          SizedBoxH8(),
          Text(name)
        ],
      ),
    );
  }
}

