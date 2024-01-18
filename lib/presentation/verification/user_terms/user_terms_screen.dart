

import 'package:anidopt/config/constant/string_constant.dart';
import 'package:anidopt/config/router/app_router.dart';
import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/dimen.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class UserTermsScreen extends StatefulWidget {
  const UserTermsScreen({super.key});

  @override
  State<UserTermsScreen> createState() => _UserTermsScreenState();
}

class _UserTermsScreenState extends State<UserTermsScreen> {
  bool accept = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Syarat dan Ketentuan",style: mMedium.copyWith(color: textColor),),),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: context.getScreenMargin(),horizontal: context.getScreenMargin()),
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(child: Text(userTerms))),
            Container(
              padding: EdgeInsets.all(spacing4),
              decoration: BoxDecoration(
                  color: primaryContainerColor
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: Checkbox(value: accept, onChanged: (value){
                          accept = value ?? false;
                          setState(() {
        
                          });
        
                        },            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(radiusS),
                        ),
                          ),
                      ),
                      SizedBox(width: spacing4,),
                      Expanded(child: Text("Saya setuju dengan syarat dan ketentuan adopsi",style: sMedium,))
                    ],
                  ),
                  SizedBox(height: spacing4,),
                  OutlinedButton(onPressed: (){
                    if(accept){
                      Navigator.pop(context);
                      context.router.push(ChatRoomRoute());
                    }

                  }, child: Text("Lanjutkan"))
                ],
              ),
            )
        
        
          ],
        ),
      ),
    );
  }
}
