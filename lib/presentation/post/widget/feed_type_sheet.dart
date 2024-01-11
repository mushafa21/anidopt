import 'package:anidopt/config/enum/post_type.dart';
import 'package:anidopt/config/router/app_router.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../ui/dimen.dart';
import '../../../ui/type.dart';



class FeedTypeSheet extends StatelessWidget {
  const FeedTypeSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.getScreenMargin(),
        vertical: context.getScreenMargin(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);

                },
                child: FaIcon(FontAwesomeIcons.xmark),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Pilih Tipe Postingan",
                    style: smMedium,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: spacing7,
          ),
          GestureDetector(
            onTap: ()  {
              Navigator.pop(context);
              context.router.push(CreatePostRoute(postType: PostType.openAdopt));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: spacing5, vertical: spacing3),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.cat,size: 16,),
                  SizedBox(
                    width: spacing3,
                  ),
                  Expanded(
                    child: Text(
                      "Open Adopt",
                      style: sRegular,
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );

  }
}