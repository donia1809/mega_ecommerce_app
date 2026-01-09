import 'dart:convert';

import 'package:mega_ecommerce_app/core/domain/entity/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  const TokenModel({required super.token});

  factory TokenModel.fromEntity(TokenEntity entity) {
    return TokenModel(token: entity.token);
  }

  factory TokenModel.fromJson(String json) {
    final Map<String, dynamic> jsonData = jsonDecode(json);
    return TokenModel.fromMap(jsonData);
  }

  factory TokenModel.fromMap(Map<String, dynamic> json) {
    return TokenModel(token: json['token']);
  }

  Map<String, dynamic> toMap() {
    return {'token': token};
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
