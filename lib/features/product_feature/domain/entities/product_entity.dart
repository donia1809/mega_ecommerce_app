import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/owner_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/review_entity.dart';

class ProductEntity extends Equatable {
  final String id;
  final OwnerEntity owner;
  final String name;
  final String description;
  final double price;
  final String image;
  final List<String> images;
  final String category;
  final int countInStock;
  final double rating;
  final int numReviews;
  final bool favorites;
  final List<ReviewEntity> reviews;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProductEntity({
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

  bool isFavorite() {
    final bool isFavorite = favorites;
    return isFavorite;
  }

  ProductEntity copyWith({final bool? favorites}) {
    return ProductEntity(
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

  ProductEntity toggleFavorite() {
    // final List<String> tempFavoritesUsersIds = favorites;
    // if (isFavorite(currentUserId)) {
    //   tempFavoritesUsersIds.remove(currentUserId);
    // } else {
    //   tempFavoritesUsersIds.add(currentUserId);
    // }
    return copyWith(favorites: !favorites);
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
