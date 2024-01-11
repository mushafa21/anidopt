// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel()
  ..uid = json['uid'] as String?
  ..imageUrl = json['imageUrl'] as String?
  ..caption = json['caption'] as String?
  ..type = json['type'] as String?
  ..latitude = (json['latitude'] as num?)?.toDouble()
  ..longitude = (json['longitude'] as num?)?.toDouble()
  ..address = json['address'] as String?
  ..contact = json['contact'] as String?
  ..name = json['name'] as String?
  ..species = json['species'] as String?;

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'imageUrl': instance.imageUrl,
      'caption': instance.caption,
      'type': instance.type,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'contact': instance.contact,
      'name': instance.name,
      'species': instance.species,
    };
