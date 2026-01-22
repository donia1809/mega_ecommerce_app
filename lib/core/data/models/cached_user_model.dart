import 'dart:convert';

import 'package:mega_ecommerce_app/core/domain/entity/entities/cached_user_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/role_enum.dart';

class CachedUserModel extends CachedUserEntity {
  const CachedUserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.isVerified,
    required super.role,
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
      role: RoleEnum.fromStrig(json['role']),
    );
  }

  factory CachedUserModel.fromEntity(CachedUserEntity user) {
    return CachedUserModel(
      email: user.email,
      id: user.id,
      isVerified: user.isVerified,
      name: user.name,
      role: user.role,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'isVerified': isVerified,
      'role': role.value,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
