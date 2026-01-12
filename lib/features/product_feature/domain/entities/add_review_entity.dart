import 'package:equatable/equatable.dart';

class AddReviewEntity extends Equatable {
  final String message;

  const AddReviewEntity({required this.message});

  @override
  List<Object?> get props => [message];
}
