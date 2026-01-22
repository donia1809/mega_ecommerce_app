import 'package:mega_ecommerce_app/features/auth_feature/domain/entity/auth_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/role_enum.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.id,
    required super.name,
    required super.email,
    required super.token,
    required super.avatar,
    required super.role,
    required super.isVerified,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return AuthModel(
      id: data['_id'],
      name: data['name'],
      email: data['email'],
      token: data['token'],
      avatar: data['avatar'],
      role: RoleEnum.fromStrig(data['role']),
      isVerified: data['isVerified'],
    );
  }
}
