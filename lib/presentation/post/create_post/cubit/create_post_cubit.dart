import 'dart:io';

import 'package:anidopt/model/post_model.dart';
import 'package:anidopt/repository/post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final PostRepository _postRepository = PostRepository();

  CreatePostCubit() : super(CreatePostStateInitial());






  createPost({required PostModel postModel, required File imageFile}) async{
    try{
      emit(CreatePostStateLoading());
      final imageUrl =  await uploadImage(imageFile);
      if(imageUrl != null){
        postModel.uid = FirebaseAuth.instance.currentUser?.uid ?? "";
        postModel.imageUrl = imageUrl;
        await _postRepository.addPost(postModel);
        emit(CreatePostStateSuccess());
      } else{
        emit(CreatePostStateError("Terjadi Kesalahan saat mengupload image"));
      }
    }catch(e){
      emit(CreatePostStateError(e.toString()));
    }
  }

  Future<String?> uploadImage(File imageFile) async{
    // Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref();
    // Create a reference to 'images/mountains.jpg'
    final fileName = imageFile.path.split('/').last;
    final mountainImagesRef = storageRef.child("images/post/$fileName");
    try {
      final uploadTask = await mountainImagesRef.putFile(imageFile);
      final dowurl = await uploadTask.ref.getDownloadURL();
      return dowurl;
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
