import 'package:anidopt/config/cache_store.dart';
import 'package:anidopt/config/enum/post_type.dart';
import 'package:anidopt/config/router/app_router.dart';
import 'package:anidopt/model/post_model.dart';
import 'package:anidopt/presentation/widgets/network_image_view.dart';
import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/locator.dart';
import '../../../ui/dimen.dart';


@RoutePage()
class PostDetailScreen extends StatelessWidget {
  final PostModel postModel;
   PostDetailScreen({Key? key, required this.postModel}) : super(key: key);

  late PostType? postType;

  _launchCaller() async {
    final url = "tel:${postModel.contact}";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    postType = PostType.values.firstWhereOrNull((element) => element.value == postModel.type);
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                AspectRatio(aspectRatio: 1,child: NetworkImageView(url: postModel.imageUrl ?? "",fit: BoxFit.cover,),),
                Positioned(
                  top: context.getScreenMargin(),
                  left: context.getScreenMargin(),
                  child: CircleAvatar(child: IconButton(icon: FaIcon(FontAwesomeIcons.arrowLeft,color: blackColor,),onPressed: (){
                    Navigator.pop(context);

                  },), backgroundColor: whiteColor,),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.getScreenMargin(),vertical: context.getScreenMargin()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(postModel.name ?? "",style: mBold,),
                      Spacer(),
                      _labelView(),
                    ],
                  ),
                  Text(postModel.species ?? "",style: sRegular,),
                  SizedBox(height: spacing5,),

                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.paw,size: 16,),
                      SizedBox(width: spacing3,),
                      Text("Tentang ${postModel.name}",style: sMedium,)
                    ],
                  ),
                  Text(postModel.caption ?? "",style: sRegular,),
                  SizedBox(height: spacing5,),


                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.locationDot,size: 16,),
                      SizedBox(width: spacing3,),
                      Text(postType == PostType.found ? "Lokasi Hewan Ditemukan" :postType == PostType.missing ? "Lokasi Hewan Terakhir Kali Dilihat" : "Lokasi"  ,style: sMedium,)
                    ],
                  ),
                  SizedBox(height: spacing2,),
                  Text(postModel.address ?? "",style: sRegular,),


                  SizedBox(height: spacing5,),



                  Center(
                    child: postModel.uid == locator.get<CacheStore>().user.uid ?  ElevatedButton(onPressed: (){
                      context.router.push(SelectNewOwnerRoute());
                    }, child: Text("Selesaikan"))  :OutlinedButton(onPressed: (){
                      context.router.push(UserVerificationRoute());
                    }, child: Text("Hubungi Pemilik")),
                  )


                ],
              ),
            ),


          ],
        ),
      ),
    );
  }


  Widget _labelView(){
    switch(postType){

      case null:{
        return Container();
      }
      case PostType.openAdopt: {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: spacing3,vertical: spacing1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radiusXl),
            color: successColor,
          ),
          child: Text("Open Adopt",style: xsMedium.copyWith(color: whiteColor),),
        );
      }
      case PostType.missing:{
        return Container(
          padding: EdgeInsets.symmetric(horizontal: spacing3,vertical: spacing1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radiusXl),
            color: errorColor,
          ),
          child: Text("Hilang",style: xsMedium.copyWith(color: whiteColor),),
        );
      }
      case PostType.found:{
        return Container(
          padding: EdgeInsets.symmetric(horizontal: spacing3,vertical: spacing1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radiusXl),
            color: secondaryColor,
          ),
          child: Text("Ditemukan",style: xsMedium.copyWith(color: whiteColor),),
        );
      }
    }
  }





}
