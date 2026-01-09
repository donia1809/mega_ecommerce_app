import 'package:mega_ecommerce_app/features/more_frature/domain/entity/menu_entity.dart';

class MenuModel extends MenuEntity {
  MenuModel({required super.content});

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return MenuModel(content: data['content']);
  }
}
