import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_post/widget/custom_sized_box.dart';
import 'package:vyapar_post/widget/post_view.dart';

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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
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
           const Text("Post by Categorise",style: AppTextStyle.appBarTitle,),
           SizedBoxH14(),
           Column(
             children: [
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   children: [
                      for(int i = 0; i < 5; i++)
                        Container(
                          height: 90,
                          width: 90,
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              ListView.builder(
                                padding: EdgeInsets.symmetric(vertical: Sizes.s10.h),
                                shrinkWrap: true,
                                // physics: const NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (context, inx) {
                                  return CetegoryList(
                                    // image:AppAsset.postImg,
                                    // name:"vidhi",
                                    // post: AppAsset.postImg,


                                  );


                                },

                              ),

                            ],
                          ),
                        )
                   ],
                 ),
               )
             ],
           ),

           Column(
             children: [
               ListView.builder(
                 padding: EdgeInsets.symmetric(vertical: Sizes.s20.h),
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 itemCount: 8,
                 itemBuilder: (context, inx) {
                   return PostList(
                     image:AppAsset.postImg,
                     name:"vidhi",
                     post: AppAsset.postImg,


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
  
  Widget CetegoryList(){
    return Container(
      height: 30,
      width: 30,
      child: Column(
        children: [
          Image.asset(AppAsset.post,height:10,fit: BoxFit.fill,),
          Text("Store ")
        ],
      ),
    );
  }
}

