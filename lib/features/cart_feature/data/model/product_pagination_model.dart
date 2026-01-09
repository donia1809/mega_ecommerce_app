import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/product_pagination_entity.dart';
import 'product_model.dart';

class ProductsPaginationModel extends ProductsPaginationEntity {
  const ProductsPaginationModel({
    required super.products,
    required super.page,
    required super.pages,
  });

  factory ProductsPaginationModel.fromJson(Map<String, dynamic> map) {
    return ProductsPaginationModel(
      products: List<ProductModel>.from(
        (map['products'] as List<dynamic>).map((e) => ProductModel.fromJson(e)),
      ),
      page: map['page'],
      pages: map['pages'],
    );
  }
}
