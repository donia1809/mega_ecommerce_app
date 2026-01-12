import '../../domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    required super.id,
    required super.userName,
    required super.name,
    required super.rating,
    required super.comment,
    required super.userImage,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final userData = json['user'];
    return ReviewModel(
      id: json['_id'],
      userName: userData is Map ? (userData['name'] ?? '') : '',
      name: json['name'],
      rating: double.tryParse(json['rating'].toString()) ?? 0,
      comment: json['comment'],
      userImage:userData is Map ? (userData['avatar'] ?? '') : '',
    );
  }
}
