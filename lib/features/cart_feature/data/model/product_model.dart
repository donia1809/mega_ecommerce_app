import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/product_entity.dart';

class ProductModel extends ProductsEntity {
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
    return ProductModel(
      id: json['_id'],
      owner: json['owner'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      images: List<String>.from(json['images'] ?? []),
      category: json['category'],
      countInStock: json['countInStock'],
      rating: (json['rating'] as num).toDouble(),
      numReviews: json['numReviews'],
      favorites: List<String>.from(json['favorites'] ?? []),
      reviews: List<String>.from(json['reviews'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
