import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/notification_feature/domain/entity/notification_entity.dart';
import 'package:mega_ecommerce_app/features/notification_feature/domain/repository/notification_repository.dart';

class GetNotificationsUseCase {
  final NotificationRepository notificationRepo;

  GetNotificationsUseCase({required this.notificationRepo});

  Future<Either<Failure, List<NotificationEntity>>> call() {
    return notificationRepo.getNotifications();
  }
}
