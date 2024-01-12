

import 'dart:io';
import 'package:image_picker/image_picker.dart';


class MediaPicker{
  Future<File?> pickImage({bool camera = false}) async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(source: camera ? ImageSource.camera : ImageSource.gallery,maxHeight: 1200, maxWidth: 1200,);
      if(pickedFile != null){
        return File(pickedFile.path);
      } else{
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;

    }

  }

}