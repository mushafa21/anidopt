import 'package:anidopt/model/article_model.dart';
import 'package:anidopt/presentation/widgets/network_image_view.dart';
import 'package:anidopt/ui/dimen.dart';
import 'package:anidopt/ui/type.dart';
import 'package:flutter/material.dart';


class ArticleItem extends StatelessWidget {
  final ArticleModel articleModel;
  const ArticleItem({Key? key, required this.articleModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(radiusXl),
              child: NetworkImageView(url:articleModel.imageUrl ?? "",width: 300,height: 150, fit: BoxFit.cover,)),

          Container(
            width: 300,
            padding: EdgeInsets.symmetric(horizontal: spacing4,vertical: spacing3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(articleModel.source ?? "",style: xsRegular,),
                Text(articleModel.title ?? "",style: sMedium,),

              ],
            ),
          )

        ],
      ),
    );
  }
}
