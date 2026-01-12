import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String id;
  final String userName;
  final String name;
  final double rating;
  final String comment;
  final String userImage;

  const ReviewEntity({
    required this.id,
    required this.userName,
    required this.name,
    required this.rating,
    required this.comment,
    required this.userImage
  });

  @override
  List<Object?> get props => [id, userName, name, rating, comment,userImage];
}
