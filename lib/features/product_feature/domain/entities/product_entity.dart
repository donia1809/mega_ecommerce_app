import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/review_entity.dart';

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
  final List<ReviewEntity> reviews;
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

  bool isFavorite(String currentUserId) {
    final bool isFavorite = favorites.contains(currentUserId);
    return isFavorite;
  }

  ProductsEntity copyWith({final List<String>? favorites}) {
    return ProductsEntity(
      id: id,
      favorites: favorites ?? this.favorites,
      category: category,
      countInStock: countInStock,
      createdAt: createdAt,
      rating: rating,
      image: image,
      description: description,
      images: images,
      name: name,
      numReviews: numReviews,
      owner: owner,
      price: price,
      reviews: reviews,
      updatedAt: updatedAt,
    );
  }

  ProductsEntity toggleFavorite(String currentUserId) {
    final List<String> tempFavoritesUsersIds = favorites;
    if (isFavorite(currentUserId)) {
      tempFavoritesUsersIds.remove(currentUserId);
    } else {
      tempFavoritesUsersIds.add(currentUserId);
    }
    return copyWith(favorites: tempFavoritesUsersIds);
  }

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
