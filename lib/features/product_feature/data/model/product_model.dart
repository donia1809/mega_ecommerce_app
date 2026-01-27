import 'package:mega_ecommerce_app/features/product_feature/data/model/owner_model.dart';

import 'review_model.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.owner,
    required super.name,
    required super.description,
    required super.price,
    required super.image,
    required super.images,
    required super.category,
    required super.countInStock,
    required super.rating,
    required super.numReviews,
    required super.favorites,
    required super.reviews,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final ownerJson = json['owner'];
    return ProductModel(
      id: json['_id'],
      owner: OwnerModel.fromJson(
        ownerJson is Map<String, dynamic> ? ownerJson :{},
        ),
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      image: json['image']??'',
      images: List<String>.from(json['images'] ?? []),
      category: json['category']??'',
      countInStock: json['countInStock']??0,
      rating: (json['rating'] ?? 0).toDouble(),
      numReviews: json['numReviews']??0,
      favorites: json['isFavorite'] ?? false,
      reviews:
          List.from(
            json['reviews'] ?? [],
          ).map((e) => ReviewModel.fromJson(e)).toList(),

      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
