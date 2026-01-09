import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/user_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/repo/profile_repo.dart';

class UpdateProfileParams {
  final String name;
  final String avatar;

  UpdateProfileParams({required this.name, required this.avatar});
Map<String, dynamic> get toMap  {
    return {'name': name, 
    if(avatar.isNotEmpty)
    'avatar':  MultipartFile.fromFileSync(avatar)};
  }
}

class UpdateProfileUseCase {
  final ProfileRepo userProfileRepo;

  UpdateProfileUseCase({required this.userProfileRepo});
  Future<Either<Failure, UserProfileEntity>> call(UpdateProfileParams params) {
    return userProfileRepo.updateProfile(params);
  }
}
