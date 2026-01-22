import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/role_enum.dart';

class CachedUserEntity extends Equatable {
  final String name;
  final String id;
  final String email;
  final bool isVerified;
  final RoleEnum role;

  const CachedUserEntity({
    required this.name,
    required this.id,
    required this.email,
    required this.isVerified,
    required this.role,
  });

  CachedUserEntity copyWith({final RoleEnum? role}) {
    return CachedUserEntity(
      name: name,
      id: id,
      email: email,
      isVerified: isVerified,
      role: role?? this.role,
    );
  }

  @override
  List<Object?> get props => [name, id, email, isVerified, role];
}
