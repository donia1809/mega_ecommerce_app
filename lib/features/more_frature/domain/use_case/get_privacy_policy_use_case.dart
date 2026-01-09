import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/entity/menu_entity.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/repo/menu_repo.dart';

class GetPrivacyPolicyUseCase {
  final MenuRepo privacyPolicyRepo;

  GetPrivacyPolicyUseCase({required this.privacyPolicyRepo});
  Future<Either<Failure, MenuEntity>> call() {
    return privacyPolicyRepo.getPrivacyPolicy();
  }
}
