import 'package:equatable/equatable.dart';

class ParticipantsEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String role;

  const ParticipantsEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.role,
  });
  @override
  List<Object?> get props => [id, name, email,avatar,role];
}
