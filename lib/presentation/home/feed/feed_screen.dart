import 'package:anidopt/model/post_model.dart';
import 'package:anidopt/presentation/home/feed/cubit/feed_cubit.dart';
import 'package:anidopt/presentation/post/widget/feed_type_sheet.dart';
import 'package:anidopt/presentation/post/widget/post_item.dart';
import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/dimen.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

@RoutePage()
class FeedScreen extends StatelessWidget {
  FeedScreen({Key? key}) : super(key: key);

  late FeedCubit _cubit;

  showFeedTypeSheet(BuildContext context) {
    showMaterialModalBottomSheet(context: context, builder: (context) {
      return FeedTypeSheet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedCubit(),
      child: Builder(
        builder: (context) {
          _cubit = context.read();
          return _buildMainView(context);
        }
      ),
    );
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
          padding: EdgeInsets.symmetric(horizontal: context.getScreenMargin(),
              vertical: context.getScreenMargin()),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                _postListView(_cubit.getPostStream())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _postListView(Stream<QuerySnapshot<Map<String, dynamic>>> stream) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(stream: stream, builder: (context,snapshot){
      if (!snapshot.hasData) {
        return Center(child: CircularProgressIndicator());
      }
      List<PostModel> listPost = snapshot.data!.docs.map((document) {
        return PostModel.fromJson(document.data());
      }).toList();
      return ListView.builder(
          shrinkWrap: true,
          itemCount: listPost.length,
          itemBuilder: (context, index) {
            return PostItem(postModel: listPost[index]);
          });
    });
  }
}
