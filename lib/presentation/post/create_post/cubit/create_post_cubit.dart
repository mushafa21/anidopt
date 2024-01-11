import 'dart:io';

import 'package:anidopt/model/post_model.dart';
import 'package:anidopt/repository/post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final PostRepository _postRepository = PostRepository();
  CreatePostCubit() : super(CreatePostStateInitial());






  createPost({required PostModel postModel, required File imageFile}) async{
    try{

    }catch(e){

    }
    emit(CreatePostStateLoading());
    try{
      _postRepository.addPost(postModel);
      emit(CreatePostStateSuccess());
    }catch(e){
      emit(CreatePostStateError(e.toString()));
    }
  }

//   Future<String> uploadImage() async{
//     // Create a storage reference from our app
//     final storageRef = FirebaseStorage.instance.ref();
//
// // Create a reference to "mountains.jpg"
//     final mountainsRef = storageRef.child("mountains.jpg");
//
// // Create a reference to 'images/mountains.jpg'
//     final mountainImagesRef = storageRef.child("images/mountains.jpg");
//     String filePath = '${appDocDir.absolute}/file-to-upload.png';
//     File file = File(filePath);
//
//     try {
//       await mountainsRef.putFile(file);
//     } on firebase_core.FirebaseException catch (e) {
//       // ...
//     }
//   }
}
