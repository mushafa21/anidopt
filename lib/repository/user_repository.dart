

import 'package:anidopt/config/constant/firestore_constant.dart';
import 'package:anidopt/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> getUser(String uid) async{
    try {
      // Get reference to Firestore collection
      var collectionRef = _firestore.collection(usersCollection);

      var doc = await collectionRef.where('uid', isEqualTo: uid).get();
      if(doc.docs.isEmpty){
        return null;
      } else{
        return UserModel.fromJson(doc.docs.first.data());
      }
    } catch (e) {
      throw e;
    }
  }

  addUser(UserModel userModel) async{
    try{
      await _firestore.collection(usersCollection).add(userModel.toJson());
    }catch(e){
      throw e;
    }
  }
}