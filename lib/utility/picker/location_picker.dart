

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../permision_handler.dart';

Future<LatLng?> getCurrentLocation({bool repeat = true}) async{
  try{
    final permission = await PermissionHandler().askPermission(permissions: [PermissionType.location]);
    if(permission[PermissionType.location] == true){
      Position position = await Geolocator.getCurrentPosition();

      return LatLng(position.latitude ?? 0, position.longitude ?? 0);

    } else if(repeat){
      print("REPEAT LOCATION REQUEST");
      return await getCurrentLocation(repeat: false);
    }
  }catch(e){
    return null;
  }

}