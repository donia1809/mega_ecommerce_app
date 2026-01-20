import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String token;
  final String avatar;
  final String role;
  final bool isVerified;
  const AuthEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.avatar,
    required this.role,
    required this.isVerified,
  });

  @override
  List<Object?> get props => [id, name, email, token, avatar, role, isVerified];
}
