import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/role_enum.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/user_status_enum.dart';

class UserProfileEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final RoleEnum role;
  final bool isVerified;
  final UserStatusEnum requestStatus;

  const UserProfileEntity({required this.requestStatus, 
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.role,
    required this.isVerified,
  });

  @override
  List<Object?> get props => [id, name, email, avatar, role, isVerified,requestStatus];
}
