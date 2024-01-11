import 'package:anidopt/model/post_model.dart';
import 'package:anidopt/presentation/post/widget/feed_type_sheet.dart';
import 'package:anidopt/presentation/post/widget/post_item.dart';
import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/dimen.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

@RoutePage()
class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);


  showFeedTypeSheet(BuildContext context){
    showMaterialModalBottomSheet(context: context, builder: (context){
      return FeedTypeSheet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/img_app_logo.png",
          width: 35,
          height: 35,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showFeedTypeSheet(context);
        },
        label: Text(
          "Buat Postingan",
          style: sMedium.copyWith(color: whiteColor),
        ),
        icon: FaIcon(
          FontAwesomeIcons.plus,
          color: whiteColor,
        ),
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: context.getScreenMargin(),vertical: context.getScreenMargin()),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                _postListView()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _postListView() {
    return ListView.builder(itemBuilder: (context,index){
      return PostItem(postModel: PostModel() ..type = "OPEN_ADOPT");
    },itemCount: 10,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),);
  }
}
