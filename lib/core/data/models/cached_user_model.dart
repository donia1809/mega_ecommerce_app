import 'dart:convert';

import 'package:mega_ecommerce_app/core/domain/entity/entities/cached_user_entity.dart';

class CachedUserModel extends CachedUserEntity {
  const CachedUserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.isVerified,
  });

  factory CachedUserModel.formJson(String json) {
    final Map<String, dynamic> mapData = jsonDecode(json);
    return CachedUserModel.fromMap(mapData);
  }

  factory CachedUserModel.fromMap(Map<String, dynamic> json) {
    return CachedUserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      isVerified: json['isVerified'],
    );
  }

  factory CachedUserModel.fromEntity(CachedUserEntity entity) {
    return CachedUserModel(
      email: entity.email,
      id: entity.id,
      isVerified: entity.isVerified,
      name: entity.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'isVerified': isVerified};
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
