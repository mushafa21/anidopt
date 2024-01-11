// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel()
  ..uid = json['uid'] as String?
  ..name = json['name'] as String?
  ..birthDate = json['birthDate'] as String?
  ..gender = json['gender'] as String?
  ..address = json['address'] as String?
  ..latitude = (json['latitude'] as num?)?.toDouble()
  ..longitude = (json['longitude'] as num?)?.toDouble();

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
