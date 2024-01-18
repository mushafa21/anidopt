import 'package:anidopt/config/router/app_router.dart';
import 'package:anidopt/ui/color.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/type.dart';
import '../../widgets/network_image_view.dart';


@RoutePage()
class ReportListScreen extends StatelessWidget {
  const ReportListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("laporanku",style: smMedium.copyWith(color: textColor),),
      ),
      body: SafeArea(child: Padding(padding: EdgeInsets.symmetric(
        horizontal: context.getScreenMargin(),
        vertical: context.getScreenMargin(),),
        child: ListView.builder(itemBuilder: (context, index) {
          return _reportItem(onTap: () {
            context.router.push(CreateReportRoute());
          });
        }, itemCount: 1, shrinkWrap: true,),)),
    );
  }


  Widget _reportItem({required Function() onTap}) {
    return InkWell(
      onTap:onTap,
      child: Card(
        child: ListTile(
          leading: NetworkImageView(
            url: "https://cdn.idntimes.com/content-images/post/20220705/64e2da7a-7a5c-4529-9ec3-a575c254ac4b-cb108858b3b383eaa5e12931c9ec58f8.jpeg",
            width: 60,
            height: 60,
            fit: BoxFit.cover,),
          title: Text("Grey", style: sMedium,),
          subtitle: Text("18 Januari 2024", style: xxsRegular,),
        ),
      ),
    );
  }
}
