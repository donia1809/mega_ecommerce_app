import 'package:mega_ecommerce_app/features/product_feature/domain/entities/owner_entity.dart';

class OwnerModel extends OwnerEntity {
  const OwnerModel({
    required super.id,
    required super.name,
    required super.image,
    required super.rate,
  });
  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(id: json['id'], name: json['name'], image: json['image'], rate: json['rate']??0);
  }
}
