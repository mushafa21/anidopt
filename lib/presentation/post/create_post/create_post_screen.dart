import 'dart:io';

import 'package:anidopt/config/enum/post_type.dart';

import 'package:anidopt/presentation/post/create_post/cubit/create_post_cubit.dart';
import 'package:anidopt/presentation/post/create_post/widget/create_post_found.dart';
import 'package:anidopt/presentation/post/create_post/widget/create_post_missing.dart';
import 'package:anidopt/presentation/post/create_post/widget/create_post_open_adopt.dart';

import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/dialog.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


@RoutePage()
class CreatePostScreen extends StatelessWidget {
  final PostType postType;

  CreatePostScreen({Key? key, required this.postType}) : super(key: key);

  late CreatePostCubit _cubit;
  late AnidoptDialog _dialog;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePostCubit(),
      child: Builder(builder: (context) {
        _cubit = context.read();
        _dialog = AnidoptDialog(context);
        return _buildMainView(context);
      }),
    );
  }

  Widget _buildMainView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buat Postingan",
          style: smMedium.copyWith(color: textColor),
        ),
      ),
      body: SafeArea(
          child: BlocConsumer<CreatePostCubit, CreatePostState>(
        listener: (context, state) {
          if (state is CreatePostStateLoading) {
            _dialog.showLoading();
          } else if (state is CreatePostStateError) {
            _dialog.dismiss();
            _dialog.error(message: state.message);
          } else if (state is CreatePostStateSuccess) {
            _dialog.dismiss();
            _dialog.success(message: "Berhasil membuat post!", exit: true);
          }
        },
        builder: (context, state) {
          switch (postType) {
            case PostType.openAdopt:
              {
                return CreatePostOpenAdopt(onCreateButtonClicked: (post, file) {
                  _cubit.createPost(postModel: post, imageFile: file);
                });
              }
            case PostType.missing:
              {
                return CreatePostMissing(onCreateButtonClicked: (post, file) {
                  _cubit.createPost(postModel: post, imageFile: file);
                });
              }
            case PostType.found:
              {
                return CreatePostFound(onCreateButtonClicked: (post, file) {
                  _cubit.createPost(postModel: post, imageFile: file);
                });
              }
          }
        },
      )),
    );
  }
}


