import 'package:anidopt/config/constant/firestore_constant.dart';
import 'package:anidopt/model/post_model.dart';
import 'package:anidopt/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<QuerySnapshot<Map<String, dynamic>>> getPostStream() {
    try{
      // Get reference to Firestore collection
      var collectionRef = _firestore.collection(postCollection);
      return collectionRef.snapshots();
    }catch(e){
      rethrow;
    }
  }

  addPost(PostModel postModel) async{
    try{
      await _firestore.collection(postCollection).add(postModel.toJson());
    }catch(e){
      rethrow;
    }
  }
}