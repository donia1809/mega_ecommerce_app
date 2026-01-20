import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_pagination_entity.dart';
import 'product_model.dart';

class ProductsPaginationModel extends ProductsPaginationEntity {
  const ProductsPaginationModel({
    required super.products,
    required super.page,
    required super.pages,
    required super.total,
  });

  factory ProductsPaginationModel.fromJson(Map<String, dynamic> map) {
    return ProductsPaginationModel(
      products: List<ProductModel>.from(
        (map['products'] as List<dynamic>).map((e) => ProductModel.fromJson(e)),
      ),
      page: map['page'],
      pages: map['pages'],
      total: map['total'],
    );
  }
}
