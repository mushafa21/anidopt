

import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel{
  String? uid;
  String? imageUrl;
  String? caption;
  String? type;
  double? latitude;
  double? longitude;
  String? address;
  String? contact;
  String? name;
  String? species;

  PostModel();
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}