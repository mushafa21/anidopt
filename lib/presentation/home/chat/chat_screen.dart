

import 'package:anidopt/config/router/app_router.dart';
import 'package:anidopt/presentation/widgets/circle_image_view.dart';
import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class ChatScreen extends StatelessWidget {
   ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat",style: smMedium.copyWith(color: textColor),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: context.getScreenMargin(),horizontal: context.getScreenMargin()),
        child: ListView.builder(itemBuilder: (context,index){
          return _chatItem(onTap: () {
            context.router.push(ChatRoomRoute());
          });
        },itemCount: 1,shrinkWrap: true,),
      ),
    );
  }

  Widget _chatItem({required Function() onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          leading: CircleImageView(url: "",radius: 30,fit: BoxFit.cover,),
          title: Text( "Mushafa Fadzan Andira",style: sMedium,),
          subtitle: Text( "Kondisi hewannya bagaimana ya?",style: xxsRegular,),
        ),
      ),
    );
  }
}
