import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_asset.dart';
import '../utils/app_color.dart';
import '../utils/app_text_style.dart';
import 'custom_sized_box.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(left: 10, right: 10,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4YQlnpV-0PQS8Te_UsCDjELsscppeWzZSzA&usqp=CAU"),
                  ),
                  SizedBox(width: 10,),
                  Text("vidhiptl",style: AppTextStyle.appBarTitle,)
                ],
              ),
              Icon(Icons.more_vert_rounded, color: AppColor.white,)
            ],
          )
            ,),
          Image.asset(AppAsset.post,height: 300,fit: BoxFit.fill,),
          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10, ),
            child: Row(
              children: [
                 Row(
                   children: [
                     Image.asset("assets/icons/heart.png",width: 25,height: 25,),
                     Padding(
                       padding: const EdgeInsets.only(left: 15,right: 15),
                       child: Image.asset("assets/icons/comment.png",width: 25,height: 25,),
                     ),
                     Image.asset("assets/icons/send.png",width: 25,height: 25,),

                   ],
                 ),
                SizedBoxH28(),
                SizedBoxH14(),
                SizedBoxH14(),
              ],
            ),
          )
        ],
      ),
    );
  }
}


