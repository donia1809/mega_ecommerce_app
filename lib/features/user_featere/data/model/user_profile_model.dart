import 'package:mega_ecommerce_app/features/user_featere/domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required super.id,
    required super.name,
    required super.email,
    required super.avatar,
    required super.role,
    required super.isVerified,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return UserProfileModel(
      id: data['_id'],
      name: data['name'],
      email: data['email'],
      avatar: data['avatar'],
      role: data['role'],
      isVerified: data['isVerified'],
    );
  }
}
