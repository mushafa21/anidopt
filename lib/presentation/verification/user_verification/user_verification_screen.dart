import 'dart:io';

import 'package:anidopt/config/router/app_router.dart';
import 'package:anidopt/ui/dimen.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../utility/media_picker.dart';



@RoutePage()
class UserVerificationScreen extends StatefulWidget {
  const UserVerificationScreen({super.key});

  @override
  State<UserVerificationScreen> createState() => _UserVerificationScreenState();
}

class _UserVerificationScreenState extends State<UserVerificationScreen> {
  pickImage(BuildContext context) async {
    final File? pickedImage = await MediaPicker().pickImage(camera: true);
    if(pickedImage != null){
      Navigator.pop(context);
      context.router.push(UserTermsRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: context.getScreenMargin(),horizontal: context.getScreenMargin()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/ic_user_verification.svg",width: 150,height: 150,),
            SizedBox(height: spacing6,),


            Text("Verifikasi Identitas",style: mBold,),
            Text("Lakukan verifikasi wajah untuk menjaga keamanan sebagai bukti untuk proses pengambilan hewan untuk diadopsi",style: sRegular,textAlign: TextAlign.center,),
            SizedBox(height: spacing9,),
            OutlinedButton(onPressed: (){
              pickImage(context);
            }, child: Text("Verifikasi"))

          ],
        ),
      ),
    );
  }

}
