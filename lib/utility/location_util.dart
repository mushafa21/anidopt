import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';

import '../config/constant/string_constant.dart';

Future<Placemark?> getPlacemark(double lat, double long) async {
  try{
    List<Placemark> placemarks = await placemarkFromCoordinates(
        lat, long);
    if (placemarks.isNotEmpty) {
      return placemarks.first;
    } else {
      return null;
    }
  }catch(e){
    return null;

  }
}

String getAddressFromPlacemark(Placemark placemark){
  return "${placemark.street}, ${placemark.name}, ${placemark.locality}, ${placemark.subAdministrativeArea}";
}

Future<String> getLocationName(double lat, double long) async {
  GeoCode geoCode = GeoCode(apiKey : geoCodeApi);
  try{
    List<Placemark> placemarks = await placemarkFromCoordinates(
        lat, long);
    if (placemarks.isNotEmpty) {
      return "${placemarks.first.street}, ${placemarks.first.name}, ${placemarks.first.locality}, ${placemarks.first.subAdministrativeArea}" ?? "Lokasi Tidak Ditemukan";
    } else {
      try{
        final address = await geoCode.reverseGeocoding(latitude: lat, longitude: long);
        return "${address.streetAddress}, ${address.postal}, ${address.city}, ${address.region}. ${address.countryName}";
      } catch(e){
        return "Lokasi Tidak Ditemukan";

      }
    }
  } catch(e){
    try{
      final address = await geoCode.reverseGeocoding(latitude: lat, longitude: long);
      return "${address.streetAddress}, ${address.postal}, ${address.city}, ${address.region}. ${address.countryName}";
    } catch(e){
      return "Lokasi Tidak Ditemukan";
    }



  }

}