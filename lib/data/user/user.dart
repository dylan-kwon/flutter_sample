import 'package:flutter_sample/data/name/name.dart';
import 'package:flutter_sample/data/picture/picture.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  Name? name;

  String? email;

  String? phone;

  Picture? picture;

  User({this.name, this.email, this.phone, this.picture});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
