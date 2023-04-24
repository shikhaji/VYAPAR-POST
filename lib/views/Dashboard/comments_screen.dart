import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/get_all_comment_model.dart';
import '../../routs/arguments.dart';
import '../../services/api_services.dart';
import '../../services/shared_preferences.dart';
import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_style.dart';
import '../../widget/custom_sized_box.dart';
import '../../widget/primary_appbar.dart';
import '../../widget/primary_textfield.dart';
import '../../widget/scroll_view.dart';

class CommentsScreen extends StatefulWidget {
  final SendArguments? arguments;
  const CommentsScreen({Key? key, this.arguments}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  TextEditingController _comment = TextEditingController();
  List<Message> getAllCommentData=[];
  bool sendButton= false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllComment(0);

  }
  Future getAllComment(int status) async {
    FormData data() {
      print(widget.arguments?.postId);
      return FormData.fromMap({
        "postid" : widget.arguments?.postId,
      });
    }
    ApiService().getAllCommnet(context,status,data:data()).then((value){
      setState(() {
        getAllCommentData=value!.message!;
      });
      print(getAllCommentData);

    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        body:Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10),
                             child: Row(
                               children: [
                                 CircleAvatar(
                                   radius: 18,
                                   backgroundImage:NetworkImage("https://khojloindia.in//uploads/${widget.arguments?.profileImage}"),
                                 ),
                                 SizedBoxW14(),
                                 Text("${widget.arguments?.postTitle}",style: AppTextStyle.commenttitle,)
                               ],
                             ),

                           ),
                          SizedBoxH8(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Flexible(
                                    flex: 6,
                                    child: Text("${widget.arguments?.postDes}",style: AppTextStyle.appBarTitle,maxLines: 5,)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: Sizes.s20.h),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: getAllCommentData.length,
                        itemBuilder: (context, inx) {
                          return commentList(
                            name:"${getAllCommentData[inx].commentBy}",
                            comment:"${getAllCommentData[inx].commentDesc}",


                          );


                        },

                      ),
                      


                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:12),
                child: PrimaryTextField(
                  controller: _comment,
                  hintText: "Add Comment",
                  prefix: Icon(Icons.comment),
                  keyboardInputType: TextInputType.text,
                  onChanged: (value){
                    setState(() {

                    });
                  },
                  suffix:_comment.text != "" ?
                  GestureDetector(
                      onTap: ()async{
                        String? id = await Preferances.getString("userId");
                        FormData data() {
                          return FormData.fromMap({
                            "comment_by" :id!
                                .replaceAll('"', '')
                                .replaceAll('"', '')
                                .toString(),
                            "postid" : widget.arguments?.postId,
                            "desc" : _comment.text.trim(),
                          });
                        }
                        ApiService().updateComment(context,data:data()).then((value){
                          getAllComment(1);
                          _comment.clear();
                        });
                      },
                      child: Icon(Icons.send,size: 20,)):SizedBox.shrink()
                ),
              ),
            ],
          ),
        ),
        appBar: SecondaryAppBar(
          title: "Comments",
          isLeading: true,
          onBackPressed: () {
            Navigator.pop(context);
          },
        )
    );
  }
  Widget commentList({
    required String name,
    required String comment,

  }){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${name} :",style: AppTextStyle.appBarTitle,),
              SizedBoxW10(),
              Flexible(
                  flex: 6,
                  child: Text("${comment}",style: AppTextStyle.appBarTitle,maxLines: 5,)),
            ],
          ),
          SizedBoxH10()
        ],
      ),
    );


  }

}
