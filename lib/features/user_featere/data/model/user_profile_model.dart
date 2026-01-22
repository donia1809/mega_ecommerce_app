import 'package:mega_ecommerce_app/features/user_featere/domain/entities/role_enum.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/user_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/user_status_enum.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required super.id,
    required super.name,
    required super.email,
    required super.avatar,
    required super.role,
    required super.isVerified,
    required super.requestStatus,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return UserProfileModel(
      id: data['_id'],
      name: data['name'],
      email: data['email'],
      avatar: data['avatar'],
      role: RoleEnum.fromStrig(data['role']??'user'),
      isVerified: data['isVerified']?? false, 
      requestStatus: UserStatusEnum.fromString(data['traderRequestStatus']??'Pending'),
    );
  }
}
