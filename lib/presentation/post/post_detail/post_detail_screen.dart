import 'package:anidopt/model/post_model.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';


@RoutePage()
class PostDetailScreen extends StatelessWidget {
  final PostModel postModel;
  const PostDetailScreen({Key? key, required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
    );
  }





}
