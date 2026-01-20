import '../../domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    required super.id,
    required super.userId,
    required super.userName,
    required super.userImage,
    required super.rating,
    required super.comment,
    required super.date,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'];
    return ReviewModel(
      id: json['id'],
      userName: user['name'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0, 
      comment: json['comment'],
      userImage: user['image'] ?? '',
      userId: user['id'] ?? '',
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
    );
  }
}
