import 'package:anidopt/ui/type.dart';
import 'package:flutter/material.dart';

import '../../ui/dimen.dart';


class EmptyView extends StatelessWidget {
  final String? image;
  final String? title;
  final String? description;
  const EmptyView({super.key, this.image = "assets/images/img_empty.png", this.title = "Data tidak ditemukan", this.description = "Kami tidak dapat menemukan data yang anda cari"});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: image != null,
            child: Image.asset(image ?? "",width: 96,height: 96,)),

        Visibility(
          visible: title != null,
          child: Padding(
            padding: EdgeInsets.only(top: spacing3),
            child: Text(title ?? "",style: smSemiBold,),
          ),
        ),

        Visibility(
          visible: description != null,
          child: Padding(
            padding: EdgeInsets.only(top: spacing3),
            child: Text(description ?? "",style: sRegular,textAlign: TextAlign.center,),
          ),
        ),
      ],
    );
  }
}
