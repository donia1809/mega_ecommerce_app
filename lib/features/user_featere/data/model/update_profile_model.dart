import 'package:mega_ecommerce_app/features/user_featere/domain/entities/update_profile_entity.dart';

class UpdateProfileModel extends UpdateProfileEntity {
  const UpdateProfileModel({required super.message});

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(message: json['message']);
  }
}
