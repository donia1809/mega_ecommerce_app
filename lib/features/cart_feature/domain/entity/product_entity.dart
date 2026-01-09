import 'package:equatable/equatable.dart';

class ProductsEntity extends Equatable {
  final String id;
  final String owner;
  final String name;
  final String description;
  final double price;
  final String image;
  final List<String> images;
  final String category;
  final int countInStock;
  final double rating;
  final int numReviews;
  final List<String> favorites;
  final List<String> reviews;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProductsEntity({
    required this.id,
    required this.owner,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.images,
    required this.category,
    required this.countInStock,
    required this.rating,
    required this.numReviews,
    required this.favorites,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    owner,
    name,
    description,
    price,
    image,
    images,
    category,
    countInStock,
    rating,
    numReviews,
    favorites,
    reviews,
    createdAt,
    updatedAt,
  ];
}
