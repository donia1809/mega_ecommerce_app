import 'package:equatable/equatable.dart';

class UpdateProfileEntity extends Equatable {
  final String message;

  const UpdateProfileEntity({required this.message});

  @override
  List<Object?> get props => [message];
}
