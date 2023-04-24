import 'package:flutter/material.dart';
import '../../models/get_faq_model.dart';
import '../../services/api_services.dart';
import '../../utils/app_color.dart';
import '../../utils/app_text_style.dart';
import '../../widget/primary_appbar.dart';
import '../../widget/scroll_view.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

class FquestionScreen extends StatefulWidget {
  const FquestionScreen({Key? key}) : super(key: key);

  @override
  State<FquestionScreen> createState() => _FquestionScreenState();
}

class _FquestionScreenState extends State<FquestionScreen> {
  GetFaqModel? faq;

  @override
  void initState() {
    super.initState();

    ApiService().getFaq(context).then((value){
      setState(() {
        if(value != null){
          faq=value;
        }
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        body: faq != null ? CustomScroll(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            for (var i = 0; i < faq!.message.fquestion!.length; i++) ...{
              GFAccordion(
                textStyle: AppTextStyle.headingTextTile,
                title:   faq != null && faq!.message.fquestion != null ? faq?.message.fquestion![i].fquestion : "",
                content:faq != null && faq!.message.fquestion != null ? faq?.message.fquestion![i].fanswer : "",
                //collapsedIcon: Icon(Icons.add),
                //expandedIcon: Icon(Icons.minimize)
              ),
            }
          ],
        ) : SizedBox.shrink(),
        appBar: SecondaryAppBar(
          title: "FAQ",
          isLeading: true,
          onBackPressed: () {
            Navigator.pop(context);
          },
        )
    );
  }
}
