import 'package:equatable/equatable.dart';
import 'product_entity.dart';

class ProductsPaginationEntity extends Equatable {
  final List<ProductsEntity> products;
  final int page;
  final int pages;

  const ProductsPaginationEntity({
    required this.products,
    required this.page,
    required this.pages,
  });

  @override
  List<Object?> get props => [products, page, pages];
}
