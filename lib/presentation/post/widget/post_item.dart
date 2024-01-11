import 'package:anidopt/config/enum/post_type.dart';
import 'package:anidopt/model/post_model.dart';
import 'package:anidopt/presentation/widgets/network_image_view.dart';
import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/dimen.dart';
import 'package:anidopt/ui/type.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PostItem extends StatelessWidget {
  final PostModel postModel;

   PostItem({Key? key, required this.postModel}) : super(key: key);

  late PostType? postType;

  @override
  Widget build(BuildContext context) {
    postType = PostType.values.firstWhereOrNull((element) => element.value == postModel.type);
    switch(postType){

      case null: {
        return Container();
      }
      case PostType.openAdopt: {
        return _openAdoptView();
      }
      case PostType.missing: {
        return _missingView();
      }
      case PostType.found: {
        return _foundView();
      }
    }
  }

  Widget _openAdoptView(){
    return InkWell(
      onTap: (){

      },
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: spacing4,vertical: spacing3),
          child: Row(
            children: [
              ClipRRect(child: NetworkImageView(url: postModel.imageUrl ?? "",width: 100,height: 100,fit: BoxFit.cover,)),
              SizedBox(width: spacing4,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: spacing3,vertical: spacing1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radiusXl),
                        color: successColor,
                      ),
                      child: Text("Open Adopt",style: xsMedium.copyWith(color: whiteColor),),
                    ),
                    SizedBox(height: spacing2,),
                    Text(postModel.name ?? "",style: smMedium,),
                    Text(postModel.species ?? "",style: xsRegular.copyWith(color: gray8Color),),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.locationDot,size: 12,),
                        SizedBox(width: spacing2,),
                        Expanded(child: Text(postModel.address ?? "",style: xsRegular,)),
                      ],
                    )


                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget _missingView(){
    return Container();
  }

  Widget _foundView(){
    return Container();
  }
}
